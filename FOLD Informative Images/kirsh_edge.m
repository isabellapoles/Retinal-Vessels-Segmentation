function M= kirsh_edge (I)
% KIRSH_EDGE Function used to implement the convolution with the Kirsh
% compass masks

%   The input is the image to be processed.
%   The function starts defining the 8 Kirsh masks. The code proceeed 
%   with the convolution between the input image and each of the 8 masks. 
%   The module response is given taking for each pixel the maximum value
%   obtained from the 8 convolutions. 
%   The phase response is computed assigning a label defined from 1 to 8 
%   defining the mask that has produced the maximum value for each pixel. 
%   The function output is the module response. 


% Kirsh compass masks initialization 
r0= [-3 -3 5; -3 0 5; -3 -3 5]; 
r1= [-3 5 5; -3 0 5; -3 -3 -3]; 
r2= [5 5 5; -3 0 -3; -3 -3 -3]; 
r3= [5 5 -3; 5 0 -3; -3 -3 -3]; 
r4= [5 -3 -3; 5 0 -3; 5 -3 -3]; 
r5= [-3 -3 -3; 5 0 -3; 5 5 -3]; 
r6= [-3 -3 -3;-3 0 -3; 5 5 5];  
r7= [-3 -3 -3;-3 0 5;-3 5 5]; 

% Filtering
I_f1= imfilter (I, r0, 'conv');  
I_f2= imfilter (I, r1, 'conv');
I_f3= imfilter (I, r2, 'conv');
I_f4= imfilter (I, r3, 'conv');
I_f5= imfilter (I, r4, 'conv');
I_f6= imfilter (I, r5, 'conv');
I_f7= imfilter (I, r6, 'conv');
I_f8= imfilter (I, r7, 'conv');

% Module and phase response computation 
label= zeros (size (I)); 
    for i= 1:size (I,1)
        for j=1:size (I,2)
            M(i, j)= max ([I_f1(i, j), I_f2(i, j), I_f3(i, j), I_f4(i, j), ...
                I_f5(i, j), I_f6(i, j), I_f7(i, j), I_f8(i, j)]); 

           if M(i, j)== I_f1 (i, j)
                    label (i, j)=1; 
           else if M(i, j)== I_f2 (i, j)
                 label (i, j)=2; 
               else if  M(i, j)== I_f3 (i, j)
                    label (i, j)=3; 
                   else if M(i, j)== I_f4 (i, j)
                      label (i, j)=4; 
                       else if M(i, j)== I_f5 (i, j)
                          label (i, j)=5;  
                           else if  M(i, j)== I_f6 (i, j)
                             label (i, j)=6; 
                             else if  M(i, j)== I_f7 (i, j)
                                label (i, j)=7; 
                                 else if  M(i, j)== I_f8 (i, j)
                                    label (i, j)=8;
                                     end 
                                 end
                               end
                           end
                       end
                   end
               end
           end
        end 
    end 

