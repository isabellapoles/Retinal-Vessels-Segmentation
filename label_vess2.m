function [vess_pix, tmp_label,size_p, k_tmp]=label_vess2 (I_MF,tmp_label,T, tx, ty, size_p, vess_tmp, k_tmp,m)
    if I_MF(tx, ty)>= T && tmp_label (tx,ty)==0
        
        im_height= size (I_MF, 1); 
        im_width=size (I_MF, 2); 
        xc= ceil (size (I_MF, 1)/2); 
        yc= ceil (size (I_MF, 2)/2); 
        
        mask= ones (im_height, im_width); 
       
        r=round (652/2-3);
        dc= drawcircle ('Center',[yc-8,xc+5],'Radius',r); 
        BW= createMask (dc);
        m_C= BW.*mask; 

        
        dr= drawrectangle ('AspectRatio',0.8258, 'Position',[7.2452 17.4540 662.5268 547.1092]); 
        BW= createMask (dr);
        m_CR= imbinarize(BW.*m_C); 

        m= bwperim (m_CR); 
        m(tx,ty)=1;   
        bw = activecontour(I_MF,m,'Chan-Vese','ContractionBias',-0.2);
        tmp_label=bw; 
         
        
        vess_tmp(1:length (i),1)= i;  
        vess_tmp(1:length (j),2)= j;  
        k_tmp=k_tmp+length (i); 

        size_p=size_p+length (i); 
        vess_pix= vess_tmp; 
         
    else 
        
        vess_pix= vess_tmp; 
        tmp_label (tx,ty)==0; 
         k_tmp=k_tmp; 

    end 
end 
        