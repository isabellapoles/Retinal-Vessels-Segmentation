function I_souce= souce(I, chan, d, size_f, sigma)
% SUACE Speeded-Up Adaptive Contrast Enhancement Function for image enhancement 
% in the process of artifacts removal 

%   The detailed description of the steps followed is taken from: 

%   A. Bandara, K. K. Rajarata, and P. Giragama, 
%   “Super-efficient spatiallyadaptive contrast enhancement algorithm for superficial vein imaging,”
%   in 2017 IEEE international conference on industrial and informationsystems (ICIIS).    
%   IEEE, 2017, pp. 1–6.


% Input control 
if d <=0 & sigma <=0
    error ('Distance and sigma must be greater 0')
end 

gaus_f = fspecial('gaussian',size_f,sigma);
I_f= imfilter (I (:, :, chan), gaus_f, 'conv'); 

for i= 1:size (I, 1)
    for j=1:size (I, 2)
        
        a(i, j)= I_f(i, j)-(d/2); 
        b(i, j)= I_f(i, j)+(d/2); 
       
        if I(i, j, chan)>=a(i, j) && I(i, j, chan)<= b(i,j)
            I_souce(i, j)= (I(i, j, chan)-a(i, j))./d; 
            
        end 
        if I(i, j)>= b(i,j)
                I_souce(i, j)=1; 
        end
        if I(i, j, chan)<= a(i,j)
                I_souce(i, j)= 0; 
        end 
        end 
end 
end

