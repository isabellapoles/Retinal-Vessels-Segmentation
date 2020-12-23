function ret= tests (size_p, par, T, tmp_label,vess_piece, vess_pix)
ret=100; 


if size_p>30
%     disp ('Test 0 passed: piece as a size >=30 pixel'); 
    
    % Test 1: the size must less than tmax
    if size_p> par.tmax
%         disp ('Test 1 failed')
        ret1=0;
    else 
        ret1=1; 
    end 
     
    
    % Test 2: the threshold must be positive
    if T<=1
%         disp ('Test 2 failed')
        ret2=0; 
    else 
        ret2=1; 
    end  

    % Test 3: the piece cannot touch the vessel-classied pixel
    curr_piece= tmp_label>0; 
    prev_piece= vess_piece>0; 
    res=  curr_piece & prev_piece; 
    if sum (res, 'all')>0
%         disp ('Test 3 failed')
        ret3=0; 
    else 
        ret3=1; 
    end 

    % Test 4
    [h, w]= size (tmp_label); 
    bord= 0; 

    for i= 1:length (vess_pix)
        for j= 1:length (vess_pix)
            y= vess_pix (i,1); 
            x=vess_pix(i,2); 
            
             if x == 0 || y == 0 || x == w-1 || y == h-1
                continue
             else 
                 p= [tmp_label(y-1, x), tmp_label(y-1, x+1),tmp_label(y, x+1),tmp_label(y+1, x+1), ...
                    tmp_label(y+1, x), tmp_label(y+1, x-1),tmp_label(y, x-1),tmp_label(y-1,x-1)]; 

                 p_sum= sum (p, 'all');

                 v= [vess_piece(y-1, x), vess_piece(y-1, x+1),vess_piece(y, x+1),vess_piece(y+1, x+1), ...
                    vess_piece(y+1, x), vess_piece(y+1, x-1),vess_piece(y, x-1),vess_piece(y-1,x-1)]; 

                 v_sum= sum (v, 'all');

                     if p_sum ~=8 && (v_sum~=0 && v_sum~=8)
                         bord=bord+v_sum; 
                     end
             end 
        end  
    end 

    if (bord/sum (tmp_label, 'all'))> par.tfringe
%          disp ('Test 4 failed')
        ret4=0; 
    else 
        ret4=1; 
    end 

    % Test 5
    skl_piece = bwmorph(tmp_label,'skel',Inf);
    [skl_pix_x, skl_pix_y]= find (skl_piece); 
    branch=0; 
    for i= 1:nnz(skl_piece)
       for j= 1:nnz(skl_piece)
           y= skl_pix_x (i,1); 
           x= skl_pix_y(i,1); 
           if x == 0 || y == 0 || x == w-1 || y == h-1
             continue
           else 
             s= [skl_piece(y-1, x), skl_piece(y-1, x+1),skl_piece(y, x+1),skl_piece(y+1, x+1), ...
                skl_piece(y+1, x), skl_piece(y+1, x-1),skl_piece(y, x-1),skl_piece(y-1,x-1)]; 

             s_sum= sum (s, 'all');

                 if s_sum>=3
                     branch= branch+1; 
                 end 
           end 
       end 
    end
    
    if (sum (tmp_label)/branch)< par.ttree
%                      disp ('Test 5 failed')
                     ret5=0;
                 else 
                     ret5=1; 
    end
    
    % Check if all the tests have been passed
    ret= ret1+ret2+ret3+ret4+ret5; 

    switch ret
        case ret==5
%             disp ('All test passed!')  
            ret=1; 
        case ret~=5
%             disp ('Not all the tests passed')
            ret=0; 
    end
    
else if size_p<30
    
%         disp ('Test 0 failed: piece as a size <=30 pixel')
       
           % Test 2: the threshold must be positive
            if T<=1
%                 disp ('Test 2 failed')
                ret2=0; 
            else 
                ret2=1; 
            end  

            % Test 3: the piece cannot touch the vessel-classied pixel
            curr_piece= tmp_label>0; 
            prev_piece= vess_piece>0; 
            res=  curr_piece & prev_piece; 

            if sum (res, 'all')>0
%                 disp ('Test 3 failed')
                ret3=0; 
            else 
                ret3=1; 
            end 

            % Check if all the tests have been passed
            ret= ret2+ret3; 

            switch ret
                case 2
%                     disp ('All test passed!')  
                    ret=1; 
                case 1 
%                     disp ('Not all the tests passed')
                    ret=0; 
                case 0 
%                     disp ('Not all the tests passed')
                    ret=0; 
            end 
        end 
    end 
end 
    
