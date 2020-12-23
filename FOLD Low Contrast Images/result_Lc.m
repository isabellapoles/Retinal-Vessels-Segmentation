% RESULTS Script for the Low Contrast Image Group

% In this script is proposed the computation of the mean values of the 
% evaluation metrics Accuracy, Sensitivity, Specificity and Positive
% Predictive Value between all the images for: 

% Otzu on CLAHE MFR
% Chan Vese on CLAHE MFR
% Otzu on CLAHE MFR + Sobel

clc; close all; clear all; 

load 'im0004_EvalMLc.mat'
acc4_O1= r.O1(1);  DSC4_O1= r.O1(2);sn4_O1= r.O1(3); sp4_O1= r.O1(4); ppv4_O1= r.O1(5);
acc4_AC= r.AC(1);  DSC4_AC= r.AC(2);sn4_AC= r.AC(3); sp4_AC= r.AC(4); ppv4_AC= r.AC(5);
acc4_SO= r.SO(1);  DSC4_SO= r.SO(2);sn4_SO= r.SO(3); sp4_SO= r.SO(4); ppv4_SO= r.SO(5);

load 'im0005_EvalMLc.mat'
acc5_O1= r.O1(1);  DSC5_O1= r.O1(2);sn5_O1= r.O1(3); sp5_O1= r.O1(4); ppv5_O1= r.O1(5);
acc5_AC= r.AC(1);  DSC5_AC= r.AC(2);sn5_AC= r.AC(3); sp5_AC= r.AC(4); ppv5_AC= r.AC(5);
acc5_SO= r.SO(1);  DSC5_SO= r.SO(2);sn5_SO= r.SO(3); sp5_SO= r.SO(4); ppv5_SO= r.SO(5);

load 'im0291_EvalMLc.mat'
acc291_O1= r.O1(1);  DSC291_O1= r.O1(2);sn291_O1= r.O1(3); sp291_O1= r.O1(4); ppv291_O1= r.O1(5);
acc291_AC= r.AC(1);  DSC291_AC= r.AC(2);sn291_AC= r.AC(3); sp291_AC= r.AC(4); ppv291_AC= r.AC(5);
acc291_SO= r.SO(1);  DSC291_SO= r.SO(2);sn291_SO= r.SO(3); sp291_SO= r.SO(4); ppv291_SO= r.SO(5);

load 'im0319_EvalMLc.mat'
acc319_O1= r.O1(1); DSC319_O1= r.O1(2); sn319_O1= r.O1(3); sp319_O1= r.O1(4); ppv319_O1= r.O1(5);
acc319_AC= r.AC(1);  DSC319_AC= r.AC(2);sn319_AC= r.AC(3); sp319_AC= r.AC(4); ppv319_AC= r.AC(5);
acc319_SO= r.SO(1);  DSC319_SO= r.SO(2);sn319_SO= r.SO(3); sp319_SO= r.SO(4); ppv319_SO= r.SO(5);

load 'im0324_EvalMLc.mat'
acc324_O1= r.O1(1);  DSC324_O1= r.O1(2);sn324_O1= r.O1(3); sp324_O1= r.O1(4); ppv324_O1= r.O1(5);
acc324_AC= r.AC(1);  DSC324_AC= r.AC(2);sn324_AC= r.AC(3); sp324_AC= r.AC(4); ppv324_AC= r.AC(5);
acc324_SO= r.SO(1);  DSC324_SO= r.SO(2);sn324_SO= r.SO(3); sp324_SO= r.SO(4); ppv324_SO= r.SO(5);

% Otzu on CLAHE MFR

acc_O1=[acc4_O1, acc5_O1, acc291_O1, acc319_O1, acc324_O1]; 
m_O1(1)= sum (acc_O1)/numel (acc_O1); 

DSC_O1=[DSC4_O1, DSC5_O1, DSC291_O1, DSC319_O1, DSC324_O1]; 
m_O1(2)= sum (DSC_O1)/numel (DSC_O1); 

sn_O1=[sn4_O1, sn5_O1, sn291_O1, sn319_O1, sn324_O1]; 
m_O1(3)= sum (sn_O1)/numel (sn_O1); 

sp_O1=[sp4_O1, sp5_O1, sp291_O1, sp319_O1, sp324_O1]; 
m_O1(4)= sum (sp_O1)/numel (sp_O1); 

ppv_O1=[ppv4_O1, ppv5_O1, ppv291_O1, ppv319_O1, ppv324_O1]; 
m_O1(5)= sum (ppv_O1)/numel (ppv_O1); 

% Chan Vese on CLAHE MFR

acc_AC=[acc4_AC, acc5_AC, acc291_AC, acc319_AC, acc324_AC]; 
m_AC(1)= sum (acc_AC)/numel (acc_AC); 

DSC_AC=[DSC4_AC, DSC5_AC, DSC291_AC, DSC319_AC, DSC324_AC]; 
m_AC(2)= sum (DSC_AC)/numel (DSC_AC);

sn_AC=[sn4_AC, sn5_AC, sn291_AC, sn319_AC, sn324_AC]; 
m_AC(3)= sum (sn_AC)/numel (sn_AC); 

sp_AC=[sp4_AC, sp5_AC, sp291_AC, sp319_AC, sp324_AC]; 
m_AC(4)= sum (sp_AC)/numel (sp_AC); 

ppv_AC=[ppv4_AC, ppv5_AC, ppv291_AC, ppv319_AC, ppv324_AC]; 
m_AC(5)= sum (ppv_AC)/numel (ppv_AC); 

% Otzu on CLAHE MFR + Sobel

acc_SO=[acc4_SO, acc5_SO, acc291_SO, acc319_SO, acc324_SO]; 
m_SO(1)= sum (acc_SO)/numel (acc_SO); 

DSC_SO=[DSC4_SO, DSC5_SO, DSC291_SO, DSC319_SO, DSC324_SO]; 
m_SO(2)= sum (DSC_SO)/numel (DSC_SO);

sn_SO=[sn4_SO, sn5_SO, sn291_SO, sn319_SO, sn324_SO]; 
m_SO(3)= sum (sn_SO)/numel (sn_SO); 

sp_SO=[sp4_SO, sp5_SO, sp291_SO, sp319_SO, sp324_SO]; 
m_SO(4)= sum (sp_SO)/numel (sp_SO); 

ppv_SO=[ppv4_SO, ppv5_SO, ppv291_SO, ppv319_SO, ppv324_SO]; 
m_SO(5)= sum (ppv_SO)/numel (ppv_SO); 

% Final results
method = {'CLAHE+MFR+Otzu'; 'CLAHE+MFR+ChanVese';  'CLAHE+MFR+Sobel'}; 
Accuracy=[m_O1(1);m_AC(1); m_SO(1)]; 
DSC=[m_O1(2);m_AC(2); m_SO(2)]; 
Sensitivity=[m_O1(2);m_AC(2); m_SO(2)]; 
Specificity= [m_O1(3);m_AC(3); m_SO(3)]; 
PPV= [m_O1(4);m_AC(4); m_SO(4)]; 

T= table (method,Accuracy,DSC, Sensitivity, Specificity,PPV)
save  ('T_LC_ValentinaKouznetsova', 'T')