function [I_pe] = ill_disom(I,size_m,size_g, sigma,size_bg, C)
% ILL_DISOM Function used to assess the illumination disomogeneities implementing the 
% Top Hat morphological operation.

%   The detailed description of the steps followed is taken from: 

%   D. Mar ́ın, A. Aquino, M. E. Geg ́undez-Arias, and J. M. Bravo, 
%   “A newsupervised  method  for  blood  vessel  segmentation  in  retinal  
%   images  byusing gray-level and moment invariants-based features,
%   ”IEEE Transac-tions on medical imaging, vol. 30, no. 1, pp. 146–158, 2010


% Mean filter 3x3 
mean_filt= fspecial('average',size_m);
I1= imfilter (I(:, :, C), mean_filt, 'conv'); 

% Gaussian filter 9x9
gaus_filt= fspecial('gaussian',size_g, sigma);
I2= imfilter (I1, gaus_filt, 'conv'); 

% Backgroud Image
mean_filt= fspecial('average',size_bg);
I_b= imfilter (I2, mean_filt, 'conv'); 
I_pe=imsubtract(I(:, :, C),I_b);


[COUNTS,X] = imhist(I_pe); 
[M, k]= max (COUNTS); 

for i=1:605
    for j=1:700
         switch I_pe (i,j); 
            case I_pe(i,j)<0 
               I_pe(i,j)=0; 
            case I_pe(i,j)>1 
               I_pe(i,j)=1; 
            otherwise 
               I_pe(i,j)=I_pe(i,j)+0.5-X(k); 
        end 
    end 
end 

I_pe= im2uint8 (I_pe); 
Ic_pe= imcomplement (I_pe); 
SE = strel('disk',8); 
Ic_peo=imopen (Ic_pe, SE); 
I_pe= imsubtract (Ic_pe, Ic_peo); 
figure (66), imshow (I_pe, []), title ('For illumination reduction'); 