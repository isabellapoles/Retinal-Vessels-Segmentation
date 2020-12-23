function [I_fov]= fov_ref (I, xc, yc)
% FOV_REF Function used to remove the external parts of the image in order to refine the
% visualization of the FOV

I=im2double (I); 

% Extraction of the circle 
figure, imshow (I), title ('Input image')

r=round (652/2-20); 
dc= drawcircle ('Center',[yc+2,xc-20],'Radius',r); 
BW= createMask (dc); 
I_C= BW.*I; 

% Extraction of the rectangle
figure, imshow (I_C, []),title ('Otzu thresholding')
%  H=drawrectangle
dr= drawrectangle ('AspectRatio',0.7659, 'Position',[5.7463 20.4518 694.7537 532.1199]);
% [0.5000 38.4390 699.2505 520.1285]
% 0.7438
BW1= createMask(dr); 
I_fov= BW1.*I_C; 

end 