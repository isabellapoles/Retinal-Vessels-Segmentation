function [OD, disk_coord, center]= opt_disk (I)
% OPT_DISK Function used to extract the optic disk. 

%   The input is the segmented binary image from which we want to extract
%   the optic disk. 
%   The function implements the extended maxima trasform to detect connected
%   pixels that define local maxima into the image. 
%   The boundaries and the centroid of the optic disk are computed for the
%   region found.
%   The function gives in output the binary mask showing the extracted
%   optic disk, the coordinates of the boundary of the optic disk and the
%   centroid optic disk coordinates. 

opt_disk = imcomplement(imextendedmin(I,0.8)) ; 
opt_disk= imfill (opt_disk, 'holes'); 
opt_disk= bwareaopen(opt_disk,30); 
[L, NUM]= bwlabel (opt_disk); 

stats = regionprops(opt_disk,'Area','Circularity', 'Centroid', ...
                             'MajorAxisLength','MinorAxisLength'); 
idx= find ([stats.Area]>200); 
opt_disk= ismember (L, idx); 
stats = regionprops(opt_disk,'Area','Circularity', 'Centroid'); 
                       
center = stats.Centroid;
per= bwperim(opt_disk); 
[r,c]= find (per); 
disk_coord.row=r; 
disk_coord.col=c; 

% Plot the circles
figure (23), imshow (opt_disk),hold on, plot (disk_coord.col,disk_coord.row, '.r'),...
    hold on, plot (center(1,1),center(1,2), '*r' ), title ('Optic disk extraction'), hold off; 
OD= opt_disk; 

end 



