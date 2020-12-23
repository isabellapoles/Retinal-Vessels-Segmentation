% INFORMATIVE IMAGES script 

% This is the script used to segment the retinal images belonging to the
% informative image group (see README.md to know what images belongs to
% this group). 

% The script implements the Top Hat morphological operation, the Matched
% Filter and the Chan-Vese Active Contour segmentation method as the main steps. 
% The comparison with the Matched Filter response segmented with Otzu
% Thresholding, the Matched Filter response enhanced with Sobel edge
% detector and segmented with Otzu Thresholding and the Matched Filter
% response enhanced with Kirsh compass mask and segmented with Otzu
% Thresholding is proposed. 

% The optic disk segmentation is implemented using the extended maxima
% transform. 

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

figure (4), imshow (I, []), title (['ROI extraction channel: ', c, '']); 
rectangle ('Position',rect_Dbg,'EdgeColor',c);
 
figure (5), subplot (1, 2, 1), imshow (ROI.mat_Dbg, []), title (['Extracted ROI 1 channel: ', c, ' ']), ...
        subplot (1, 2, 2), imhist (ROI.mat_Dbg), ylim ([1, 455]), title ('Histogram selected ROI'); 
             

xc= ceil (size (I(:, :, C), 1)/2); 
yc= ceil (size (I(:, :, C), 2)/2); 

%% TopHat morphological preprocessing

size_m=3; 
size_g=9; 
sigma=1.8^2; 
size_bg=69;
[I_TH] = ill_disom(I,size_m,size_g, sigma,size_bg,C); 

% FOV refinement
[I_TH]= fov_ref (I_TH, xc, yc); 
  
figure (6), imshow (I_TH, []), title ('TopHat enhanced image')

%% Analysis of the videointensity profiles perpendicular to the length of the vessel
 
% p= []; 
% count=0; 
% 
% while count~=5
%     figure (12), imshow (I_eC, []); 
%     p= improfile; 
%     count=count+1; 
%     str(count)= {['Vessel nr.: ', num2str(count), ' ']}; 
%     figure (7), plot ([1: length(p)],p, '-o'), title ('Vessels Videointensity Pattern'),...
%         xlabel ('Distance in the pattern '), ylabel ('Video Intensity'), legend (str); 
%     hold on 
% end 

%% 2D Matched Filter
% Set k = exp(-u.^2/(2*dev_std.^2)) in the 
% [I_MF, k_mean, k] = matched_filter(I_TH, s, L, resol, orient) function

s = 2; % standard deviation 
L = 11; % length of the segment for which the vessel is assumed to have a fixed orinetation 
resol= 15; % angular resolution 
orient=12; % # orientations

[I_MF, k_mean, k] = matched_filter_I(I_TH, s, L, resol, orient); 

figure (8), imhist (I_MF), title ('Matched Filter response histogram'); 
figure (9), imshow (I_MF, []), title ('Matched Filter response'); 

%% Stretching in order to increase the contrast 

I_MF= imadjust (I_MF, [0.05; 0.4], [0.5;1]);
figure (10), imshow (I_MF, []), title ('Stretched Matched Filter response');
figure (11), imhist (I_MF), title ('Matched Filter response histogram'); 

%%  Otzu thresholding 

counts = imhist(I_MF);
T=otsuthresh(counts); 
I_MF_BW = imbinarize(I_MF,T);

% Post processing
I_MF_BW= bwmorph (I_MF_BW, 'majority');
I_MF_BW = bwareaopen(I_MF_BW,40); 

% FOV refinement
[I_O]= fov_ref (I_MF_BW, xc, yc); 

figure (12), imshow (I_O, []),title ('Otzu thresholding')

%% Sobel filtering 

S= fspecial ('sobel'); 
I_MF= im2double (I_MF); 
I_sx= imfilter (I_MF, S, 'conv');
I_sy= imfilter (I_MF, S', 'conv'); 
I_SF= abs (sqrt (I_sx.^2+I_sy.^2)); 

figure (13), imshow (I_SF, []), title ('Sobel Filter response'); 

% Binarization using Otzu thresholding
counts = imhist(I_SF);
T=otsuthresh(counts); 
I_SF_BW = imbinarize(I_SF,T);
 
% Post process
I_SF_BW = bwareaopen(I_SF_BW,70);
for i= 45:45:360
    SE= strel('line',3, i);
    I_SF_BW= imclose (I_SF_BW, SE); 
end 

% FOV refinement
[I_SO]= fov_ref (I_SF_BW, xc, yc); 

figure(14), imshow (I_SO, []), title ('Sobel Otzu Thresholded response')

%% Morphological edge detector TopHat and KirshMask edge detector

I_M=kirsh_edge (I_MF); 
figure (15), imshow (I_M, []), title ('TopHat and KirshMask edge detector')

counts = imhist(I_M);
T=otsuthresh(counts); 
I_M = imbinarize(I_M,T);

I_M = bwareaopen(I_M,60);
SE= [0 0 1 0 0;0 0 1 0 0;1 1 1 1 1; 0 0 1 0 0; 0 0 1 0 0];
I_M= imclose (I_M, SE); 
I_M = bwareaopen(I_M,60);

figure(16), imshow (I_M, []), title ('Thresholded Matched Filter response')

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

figure (20), imshow (mask), title ('Active contour starting point')

% Active contour 
iter_ac= 2000; 
extension_par= -0.27; 
I_AC_BW = activecontour(I_MF,mask,iter_ac,'Chan-Vese','ContractionBias',extension_par);

% Post processing 
for i= 45:45:315
    SE = strel('line', 3, 180);    
    I_AC_BW = imclose(I_AC_BW,SE);
end 

I_AC_BW = bwmorph(I_AC_BW,'spur',50);
I_AC_BW = bwareaopen(I_AC_BW,100); 

% FOV refinement
[I_AC]= fov_ref (I_AC_BW, xc, yc);
figure(21), imshow(I_AC), title('Active Contour segmentation');

%% Visualization
figure (22), subplot (2, 2, 1), imshow (I_O), title ('Otzu thresholding on MR'), ...
    subplot (2, 2, 2), imshow (I_SO), title ('Otzu thresholding on Sobel edge detector & MR'), ...
        subplot (2, 2, 3), imshow (I_M), title ('Otzu thresholding on TopHat & MR & Kirsh'), ...
            subplot (2, 2, 4), imshow (I_AC), title ('Active Contour on MR'); 

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
r.O1=eval_metrics(I_O,hand_lab);    % Otzu on TopHat MFR
r.AC=eval_metrics(I_AC,hand_lab);   % Chan Vese on TopHat MFR

r.SO=eval_metrics(I_SO,hand_lab);   % Otzu on TopHat MFR + Sobel
r.M=eval_metrics(I_M,hand_lab);     % Otzu on TopHat MFR + Kirsh

save (strcat(im, '_EvalMIn'), 'r')
%% Optic disk extaction 
[OD, disk_coord, center]= opt_disk (I(:, :, C)); 

figure (24), subplot (1, 2, 1), imshow (I_AC), title ('Vessel segmentation using Chan Vese'), ...
    subplot (1, 2, 2), imshow (OD),hold on, subplot (1, 2, 2), plot (disk_coord.col,disk_coord.row, '.r', center(1,1),center(1,2), '*r'),...
        title ('Optic disk segmentation'); 