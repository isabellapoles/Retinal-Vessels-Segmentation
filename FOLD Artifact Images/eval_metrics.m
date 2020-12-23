function r=eval_metrics(bw,ref_bw)
% EVAL_METRICS Function that allows the evaluation metrics computation
%   
%     The inputs are the segmented image and the ground-truth hand labelled
%     image. 
%     The function computes: 
%     Accuracy 
%     Dice coefficient 
%     True Positive Rate (sensitivity/recall/hit rate)
%     False Positive Rate (specificity=1-FPR)
%     Positive predictive value (precision)

bw= im2bw(bw); 
ref_bw= im2bw(ref_bw); 

TP_image=ref_bw&bw;
TP=sum(TP_image(:));% # of hits (True Positive)
FN_image=ref_bw&~bw;
FN=sum(FN_image(:));% # of misses (False Negative\Type 2 Error)

FP_image=~ref_bw&bw;
FP=sum(FP_image(:));% # of false alarms (False Positive/Type 1 Error)
TN_image=~ref_bw&~bw;
TN=sum(TN_image(:));% # of correct rejections (True Negative)

accuracy=(TP+TN)/(TP+FN+FP+TN);
DSC= (2*TP)/(FP+2*TP+FN); 
sn=TP/(TP+FN);% True Positive Rate (sensitivity/recall/hit rate)
FPR=FP/(FP+TN);% False Positive Rate (specificity=1-FPR)
PPV=TP/(TP+FP);%positive predictive value (precision)
sp= 1-FPR; 
r=[accuracy;DSC;sn;sp;PPV];