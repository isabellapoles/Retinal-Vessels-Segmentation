function [queue] = queue_init(I_MF,  par)
% QUEUE_INIT Function used to define the queue of points corresponding to 
% the initial and final pixels of each vessels in the vasculature tree. 

%   The detailed description of the steps followed is taken from:
%   A. Hoover, V. Kouznetsova, and M. Goldbaum, 
%   “Locating blood vesselsin  retinal  images  by  piecewise  threshold  probing  of  a  matched  filter response,
%   ”IEEE Transactions on Medical imaging,  vol.  19,  no.  3,  pp.203–210, 2000.


T_th= par.thresh; 
h= size (I_MF, 1); 
w= size (I_MF, 2); 

% Initialization of the pixels queue
% Histogram of MFR
[counts, bin_loc]= imhist (I_MF); 

for i=1:length (counts)
    if counts (i)> T_th
        counts (i)=0; 
    end 
end 

for y= 1:h
    for x=1:w
        if counts (I_MF (y,x)+1)==0
            I_MF (y,x)=0; 
        else 
            I_MF (y,x)=1; 
        end 
    end
end 

% Thinning the thresholded image
th_MF= bwmorph(I_MF,'thin', Inf); 
figure (16), imshow (th_MF), title ('Thinned thresholded image'); 

% Erase the branchpoints 
ebranch = []; 
ep = zeros (1,8); 
i=1;
for y=2:h-1
    for x=2:w-1
            ep= [th_MF(y-1, x), th_MF(y-1, x+1),th_MF(y, x+1),th_MF(y+1, x+1), ...
                th_MF(y+1, x), th_MF(y+1, x-1),th_MF(y, x-1),th_MF(y-1,x-1)]; 
            
            trans= sum (ep, 'all'); 
            if trans>=3
                th_MF(y,x)=0; 
                ebranch(i).x_coord= x; 
                ebranch(i).y_coord= y;
                i=i+1;
            end 
        end 
    end 

bp_erased_MF= th_MF; 

figure (17), imshow (bp_erased_MF), title ('Thinned thresholded image without branches'); 

% Discard segments with <10 pixels 
[L,num] = bwlabel(bp_erased_MF,8); 

p=1; 
for i=1:num
        [r,c] = find(L==i); 
        R(i).row= r; 
        C(i).col=c; 
        
        if length (R(i).row)<=10 
            bp_erased_MF(R(i).row,C(i).col)=0; 
        end 
end 


I_diseg= bp_erased_MF; 

max (max(L))
figure (18), imshow (I_diseg), title ('No branches, no <10 pixels segments image'); 
hold on 

% Probe queue
queue=[]; 
i=1; 
for y=2:h-1
    for x=2:w-1
        ep= [I_diseg(y-1, x), I_diseg(y-1, x+1),I_diseg(y, x+1),I_diseg(y+1, x+1), ...
                I_diseg(y+1, x), I_diseg(y+1, x-1),I_diseg(y, x-1),I_diseg(y-1,x-1)]; 
            
            trans= sum (ep, 'all');
            
            if  trans==1 && I_diseg(y, x)==1
                queue(i).x_coord= x; 
                queue(i).y_coord= y; 
                i=i+1; 
                
            end 
    end 
        
end
figure (18), imshow (I_diseg), title ('No branches, no <10 pixels segments image'); 
for i=1:size(queue, 2)
    plot (queue(i).x_coord,queue(i).y_coord, '*r')  
end 

end 


