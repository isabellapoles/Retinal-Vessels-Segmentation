% RESULTS Script for the Low Contrast Image Group

% In this script is proposed the computation of the mean values of the 
% evaluation metrics Accuracy, Sensitivity, Specificity and Positive
% Predictive Value between all the images for: 

% Otzu on SAUCE MFR
% Chan Vese on SAUCE MFR
% Otzu on CLAHE MFR + Sobel

clc; close all; clear all; 

load 'im0001_EvalMAr.mat'
acc1_O1= r.O1(1);  DSC1_O1= r.O1(2);sn1_O1= r.O1(3); sp1_O1= r.O1(4); ppv1_O1= r.O1(5);
acc1_AC= r.AC(1);  DSC1_AC= r.AC(2);sn1_AC= r.AC(3); sp1_AC= r.AC(4); ppv1_AC= r.AC(5);
acc1_SO= r.SO(1);  DSC1_SO= r.SO(2);sn1_SO= r.SO(3); sp1_SO= r.SO(4); ppv1_SO= r.SO(5);

load 'im0002_EvalMAr.mat'
acc2_O1= r.O1(1);  DSC2_O1= r.O1(2);sn2_O1= r.O1(3); sp2_O1= r.O1(4); ppv2_O1= r.O1(5);
acc2_AC= r.AC(1);  DSC2_AC= r.AC(2);sn2_AC= r.AC(3); sp2_AC= r.AC(4); ppv2_AC= r.AC(5);
acc2_SO= r.SO(1);  DSC2_SO= r.SO(2);sn2_SO= r.SO(3); sp2_SO= r.SO(4); ppv2_SO= r.SO(5);

load 'im0003_EvalMAr.mat'
acc3_O1= r.O1(1);  DSC3_O1= r.O1(2);sn3_O1= r.O1(3); sp3_O1= r.O1(4); ppv3_O1= r.O1(5);
acc3_AC= r.AC(1);  DSC3_AC= r.AC(2);sn3_AC= r.AC(3); sp3_AC= r.AC(4); ppv3_AC= r.AC(5);
acc3_SO= r.SO(1);  DSC3_SO= r.SO(2);sn3_SO= r.SO(3); sp3_SO= r.SO(4); ppv3_SO= r.SO(5);


% Otzu on CLAHE MFR

acc_O1=[acc1_O1, acc2_O1, acc3_O1]; 
m_O1(1)= sum (acc_O1)/numel (acc_O1); 

DSC_O1=[DSC1_O1, DSC2_O1, DSC3_O1]; 
m_O1(2)= sum (DSC_O1)/numel (DSC_O1); 

sn_O1=[sn1_O1, sn2_O1, sn3_O1]; 
m_O1(3)= sum (sn_O1)/numel (sn_O1); 

sp_O1=[sp1_O1, sp2_O1, sp3_O1]; 
m_O1(4)= sum (sp_O1)/numel (sp_O1); 

ppv_O1=[ppv1_O1, ppv2_O1, ppv3_O1]; 
m_O1(5)= sum (ppv_O1)/numel (ppv_O1); 

% Chan Vese on CLAHE MFR

acc_AC=[acc1_AC, acc2_AC, acc3_AC]; 
m_AC(1)= sum (acc_AC)/numel (acc_AC); 

DSC_AC=[DSC1_AC, DSC2_AC, DSC3_AC]; 
m_AC(2)= sum (DSC_AC)/numel (DSC_AC);

sn_AC=[sn1_AC, sn2_AC, sn3_AC]; 
m_AC(3)= sum (sn_AC)/numel (sn_AC); 

sp_AC=[sp1_AC, sp2_AC, sp3_AC]; 
m_AC(4)= sum (sp_AC)/numel (sp_AC); 

ppv_AC=[ppv1_AC, ppv2_AC, ppv3_AC]; 
m_AC(5)= sum (ppv_AC)/numel (ppv_AC); 

% Otzu on CLAHE MFR + Sobel

acc_SO=[acc1_SO, acc2_SO, acc3_SO]; 
m_SO(1)= sum (acc_SO)/numel (acc_SO); 

DSC_SO=[DSC1_SO, DSC2_SO, DSC3_SO]; 
m_SO(2)= sum (DSC_SO)/numel (DSC_SO);

sn_SO=[sn1_SO, sn2_SO, sn3_SO]; 
m_SO(3)= sum (sn_SO)/numel (sn_SO); 

sp_SO=[sp1_SO, sp2_SO, sp3_SO]; 
m_SO(4)= sum (sp_SO)/numel (sp_SO); 

ppv_SO=[ppv1_SO, ppv2_SO, ppv3_SO]; 
m_SO(5)= sum (ppv_SO)/numel (ppv_SO); 

% Final results
method = {'CLAHE+MFR+Otzu'; 'CLAHE+MFR+ChanVese';  'CLAHE+MFR+Sobel'}; 
Accuracy=[m_O1(1);m_AC(1); m_SO(1)]; 
DSC=[m_O1(2);m_AC(2); m_SO(2)]; 
Sensitivity=[m_O1(2);m_AC(2); m_SO(2)]; 
Specificity= [m_O1(3);m_AC(3); m_SO(3)]; 
PPV= [m_O1(4);m_AC(4); m_SO(4)]; 

T= table (method,Accuracy,DSC, Sensitivity, Specificity,PPV)
save  ('T_AR_ValentinaKouznetsova', 'T')