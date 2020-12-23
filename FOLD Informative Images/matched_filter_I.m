function [I_MF, k_mean, k] = matched_filter_I(I, dev_std, length, resol, orient)
% MATCHED_FILTER Function used to implement the matched filter convolution for the informative images. 

%   The detailed description of the steps followed is taken from: 

%   S.  Chaudhuri,  S.  Chatterjee,  N.  Katz,  M.  Nelson,  and  M.  Goldbaum,
%   “Detection  of  blood  vessels  in  retinal  images  using  two-dimensional matched filters,
%   ”IEEE Transactions on medical imaging, vol. 8, no. 3,pp. 263–269, 1989


theta = 0:resol: resol* orient-1; %different rotations (-1 because I start from 0)

I_MF = zeros(size(I)); % filtered image initialization 

lim = max(ceil(3*dev_std),(length-1)/2);
[x,y] = meshgrid(-lim:lim,-lim:lim); 

    for rad = theta
       rad = rad*pi/180;       

       u = cos(rad).*x - sin(rad).*y; 
       v = sin(rad).*x + cos(rad).*y; 

       k = exp(-u.^2/(2*dev_std.^2));

           for i=1:size (u, 1)
               for j=1:size (u, 2)


                    if (abs(u (i,j))<= 3*dev_std) & (abs(v(i,j)) <= length/2)
                      nn_d (i,j)=1; 
                    else 
                      nn_d(i,j) = 0; 
                    end 

               end 
           end 
           
   % Mean computation on the kernel values inside the domain        
   k_nnd=k.*nn_d;
   k_mean= sum (k_nnd, 'all')/nnz (k_nnd); 
   
   k = k -k_mean; 
   k=round(k.*10.*nn_d); 
   
   % Setting to 0 of the values outside the domain 
   k=k.*nn_d; 
   
   conv = conv2(I,k,'same');
   I_MF = max(I_MF,conv);
   
   end 
    
I_MF = I_MF/max(I_MF(:)); 
I_MF= im2double (I_MF); 

end 