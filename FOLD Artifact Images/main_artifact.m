% ARTIFACT IMAGES script 

% This is the script used to segment the retinal images belonging to the
% artifact image group (see README.md to know what images belongs to
% this group and the parameters tuning). 

% The script implements the Speeded-Up Adaptive Contrast Enhancement, the Matched
% Filter and the Chan-Vese Active Contour segmentation method as the main steps. 
% The comparison with the Matched Filter response segmented with Otzu
% Thresholding, the Matched Filter response enhanced with Sobel edge
% detector and segmented with Otzu Thresholding is proposed. 

%% 
clc; clear all; close all; 

%% Image decompression 
untar('stare-images.tar'); 

%% Image loading 
[filename, pathname, filterindex] = uigetfile('*.gz*', 'Pick the wanted image');
file_uz=gunzip(filename); 
[I, map]=imread (file_uz{1}); 

im_width= size (I, 2); 
im_height= size (I, 1); 
I= im2double (I); 
figure (1), imshow(I, []), title ('Selected Image'); 

%% ROI selection for accessing noise 

for C=1:size (I, 3)
    
    figure (3), subplot (1, 3, C), imshow (I (:, :, C),[]),
    switch C
        case 1 
            c='red';
        case 2
            c='green'; 
        otherwise
            c='blue'; 
    end 
    title (['Image channel: ',c,'']); 
end 

prompt= {'Enter the dimension of the bottom left ROI 1: ',...
                'Enter the number of the channel to be analyzed: '}; 
name= 'Input for ROI extraction'; 
numlines=1; 
def_ans= {'64' '2'};
answer= inputdlg (prompt, name,numlines,def_ans); 
ris1= char (answer(1,1)); dim_ROI1= str2num (ris1); 
ris2= char (answer(2,1)); C= str2num (ris2);

% Extraction of 2 ROI one in the Dbg=dark BG, one in the Bbg=bright BG
rect_Dbg= [10 im_height-dim_ROI1-50 dim_ROI1-1 dim_ROI1-1]; % -10 in order to avoid the black offset

ROI.mat_Dbg= imcrop(I (:, :, C),rect_Dbg);

switch C
    case 1 
        c='r';
    case 2
        c='g'; 
    otherwise
        c='b'; 
end

% figure (4), imshow (I, []), title (['ROI extraction channel: ', c, '']); 
% rectangle ('Position',rect_Dbg,'EdgeColor',c);
%  
% figure (5), subplot (1, 2, 1), imshow (ROI.mat_Dbg, []), title (['Extracted ROI 1 channel: ', c, ' ']), ...
%         subplot (1, 2, 2), imhist (ROI.mat_Dbg), ylim ([1, 455]), title ('Histogram selected ROI'); 
             

xc= ceil (size (I(:, :, C), 1)/2); 
yc= ceil (size (I(:, :, C), 2)/2); 

%% SAUCE

% Mean filter 5x5 
size_f=5; 
mean_filt= fspecial('average',size_f);
I= imfilter (I, mean_filt, 'conv'); 

% CLAHE 
I_e= adapthisteq (I(:, :, C), 'NumTiles', [9 9],  'ClipLimit',0.007,'NBins', 256, ...
    'Range','full', 'Distribution', 'uniform'); 

% Processing burnt area
BW_burnt = imextendedmin(I_e,0.6) ; 
[br, bc]= find (BW_burnt==0); 
figure (6), imshow (I(:, :, C), []), hold on, plot (bc, br, '.r'), title ('Burnt Area'); 

distance=21; 
size_f=9; 
sigma= (1/3)*2; 
[I_souce]= souce(I, C, distance, size_f, sigma); 

for c= 1:length (bc)
    for i=1:im_height
        for j=1:im_width
            if i==br(c) && j==bc(c)
            I_souce(i-1, j)=0.5; I_souce(i-1, j+1)=0.5; I_souce(i, j+1)=0.5;  I_souce(i+1, j+1)=0.5; 
            I_souce(i+1, j)=0.5; I_souce(i+1, j-1)=0.5; I_souce(i, j-1)=0.5; I_souce(i-1, j-1)=0.5; 
            end
        end 
    end 
end 

figure (7), imshow (I_souce, []), title ('Equalized Image with SOUCE')

I_souce= imadjust (I_souce, stretchlim (I_souce), []);

figure (8), imshow (I_souce, []), title ('Contrasted SOUCE')

%% Analysis of the videointensity profiles perpendicular to the length of the vessel
 
% p= []; 
% count=0; 
% 
% while count~=5
%     figure (12), imshow (I(:, :, C), []); 
%     p= improfile; 
%     count=count+1; 
%     str(count)= {['Vessel nr.: ', num2str(count), ' ']}; 
%     figure (9), plot ([1: length(p)],p, '-o'), title ('Vessels Videointensity Pattern'),...
%         xlabel ('Distance in the pattern '), ylabel ('Video Intensity'), legend (str); 
%     hold on 
% end 

%% 2D Matched Filter
% Set k = -exp(-u.^2/(2*dev_std.^2)) in the 
% [I_MF, k_mean, k] = matched_filter(I_TH, s, L, resol, orient) function

s = 2; % standard deviation 
L = 11; % length of the segment for which the vessel is assumed to have a fixed orinetation 
resol= 15; % angular resolution 
orient=12; % # orientation 

[I_MF, k_mean, k] = matched_filter_LCA(I_souce, s, L, resol, orient); 

figure (10), imhist (I_MF), title ('Matched Filter response histogram'); 
figure (11), imshow (I_MF, []), title ('Matched Filter response'); 

%%  Otzu thresholding 

counts = imhist(I_MF);
T=otsuthresh(counts); 
I_MF_BW = imbinarize(I_MF,T);

% Post processing
I_MF_BW= bwmorph (I_MF_BW, 'majority');
I_MF_BW = bwareaopen(I_MF_BW,40); 

% FOV refinement
[I_O]= fov_ref (I_MF_BW, xc, yc); 

figure (15), imshow (I_O, []),title ('Otzu thresholding')

%% Sobel filtering 

S= fspecial ('sobel'); 
I_MF= im2double (I_MF); 
I_sx= imfilter (I_MF, S, 'conv');
I_sy= imfilter (I_MF, S', 'conv'); 
I_SF= abs (sqrt (I_sx.^2+I_sy.^2)); 

figure (15), imshow (I_SF, []), title ('Sobel Filter response'); 

% Binarization using Otzu thresholding
counts = imhist(I_SF);
T=otsuthresh(counts); 
I_SF_BW = imbinarize(I_SF,T);
 
% Post process
I_SF_BW = bwareaopen(I_SF_BW,70);

SE= strel('disk',2);
I_SF_BW= imclose (I_SF_BW, SE); 
 

% FOV refinement
[I_SO]= fov_ref (I_SF_BW, xc, yc); 

figure(16), imshow (I_SO, []), title ('Sobel Otzu Thresholded response')

%% Threshold Probing 
 
I_MF= im2uint8 (I_MF); 

% Parameters
par= []; 
% Lowest value parameter to reduce the possible influences of noise (see other ranges in the reference paper)
par.thresh= 5000; 

% Queue initialization 
[queue] = queue_init(I_MF, par); 

figure (17), imshow (I_MF, []), title ('Matched Filter response'); 
hold on 
for i=1:size(queue, 2)
    plot (queue(i).x_coord,queue(i).y_coord, '*r')  
end 

% Mask creation 
mask_in= ones (im_height, im_width); 
[mask]= fov_ref (mask_in, xc, yc); 
mask= bwperim (mask); 

for i=1:size(queue, 2)
    mask(queue(i).y_coord,queue(i).x_coord)=1;   
end 

[mask]= fov_ref (mask, xc, yc);
figure (20), imshow (mask), title ('Active contour starting point')

% Active contour 
iter_ac= 1000; 
extension_par= -0.04; 
I_AC_BW = activecontour(I_MF,mask,iter_ac,'Chan-Vese','ContractionBias',extension_par);

% Post processing 
for i= 45:45:315
    SE = strel('line', 2, 180);    
    I_AC_BW = imclose(I_AC_BW,SE);
end 

I_AC_BW = bwmorph(I_AC_BW,'spur',50);
I_AC_BW = bwareaopen(I_AC_BW,200); 

%FOV refinement
[I_AC]= fov_ref (I_AC_BW, xc, yc);
figure(21), imshow(I_AC), title('Active Contour segmentation');

%% Evaluation metrics computation 

% Hand labeled image loading 
untar('labels-vk.tar');
C = strsplit(filename,'.'); 
im=C{1}; 
exst= 'vk.ppm.gz'; 
filename_HL= strcat (im, {'.'}, exst); 

file_uz_HL=gunzip(filename_HL); 
[hand_lab]=imread (file_uz_HL{1}); 
% FOV refinement
[hand_lab]= fov_ref (hand_lab, xc, yc); 

% Computation
r.im= im; 
r.O1=eval_metrics(I_O,hand_lab);    % Otzu on SAUCE MFR
r.AC=eval_metrics(I_AC,hand_lab);   % Chan Vese on SAUCE MFR
r.SO=eval_metrics(I_SO,hand_lab);   % Otzu on SAUCE MFR + Sobel

save (strcat(im, '_EvalMAr'), 'r')
%% Results visualization
figure (22), subplot (1, 3, 1), imshow (I_O), title ('Otzu thresholding on MR'), ...
    subplot (1, 3, 2), imshow (I_SO), title ('Otzu thresholding on Sobel edge detector & MR'), ...
            subplot (1, 3, 3), imshow (I_AC), title ('Active Contour on MR'); 