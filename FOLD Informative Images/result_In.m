% RESULTS Script for the Informative Image Group

% In this script is proposed the computation of the mean values of the 
% evaluation metrics Accuracy, Sensitivity, Specificity and Positive
% Predictive Value between all the images for: 

% Otzu on TopHat MFR
% Chan Vese on TopHat MFR
% Otzu on TopHat MFR + Sobel
% Otzu on TopHat MFR + Kirsh

clc; close all; clear all; 

load 'im0044_EvalMIn.mat'
acc44_O1= r.O1(1);  DSC44_O1= r.O1(2); sn44_O1= r.O1(3); sp44_O1= r.O1(4); ppv44_O1= r.O1(5);
acc44_AC= r.AC(1);  DSC44_AC= r.AC(2); sn44_AC= r.AC(3); sp44_AC= r.AC(4); ppv44_AC= r.AC(5);
acc44_SO= r.SO(1);  DSC44_SO= r.SO(2); sn44_SO= r.SO(3); sp44_SO= r.SO(4); ppv44_SO= r.SO(5);
acc44_M= r.M(1);  DSC44_M= r.M(2); sn44_M= r.M(3); sp44_M= r.M(4); ppv44_M= r.M(5);

load 'im0077_EvalMIn.mat'
acc77_O1= r.O1(1);  DSC77_O1= r.O1(2);sn77_O1= r.O1(3); sp77_O1= r.O1(4); ppv77_O1= r.O1(5);
acc77_AC= r.AC(1);  DSC77_AC= r.AC(2);sn77_AC= r.AC(3); sp77_AC= r.AC(4); ppv77_AC= r.AC(5);
acc77_SO= r.SO(1);  DSC77_SO= r.SO(2);sn77_SO= r.SO(3); sp77_SO= r.SO(4); ppv77_SO= r.SO(5);
acc77_M= r.M(1);  DSC77_M= r.M(2);sn77_M= r.M(3); sp77_M= r.M(4); ppv77_M= r.M(5);

load 'im0081_EvalMIn.mat'
acc81_O1= r.O1(1);  DSC81_O1= r.O1(2);sn81_O1= r.O1(3); sp81_O1= r.O1(4); ppv81_O1= r.O1(5);
acc81_AC= r.AC(1);  DSC81_AC= r.AC(2);sn81_AC= r.AC(3); sp81_AC= r.AC(4); ppv81_AC= r.AC(5);
acc81_SO= r.SO(1);  DSC81_SO= r.SO(2);sn81_SO= r.SO(3); sp81_SO= r.SO(4); ppv81_SO= r.SO(5);
acc81_M= r.M(1);  DSC81_M= r.M(2);sn81_M= r.M(3); sp81_M= r.M(4); ppv81_M= r.M(5);

load 'im0082_EvalMIn.mat'
acc82_O1= r.O1(1);  DSC82_O1= r.O1(2);sn82_O1= r.O1(3); sp82_O1= r.O1(4); ppv82_O1= r.O1(5);
acc82_AC= r.AC(1);  DSC82_AC= r.AC(2);sn82_AC= r.AC(3); sp82_AC= r.AC(4); ppv82_AC= r.AC(5);
acc82_SO= r.SO(1);  DSC82_SO= r.SO(2);sn82_SO= r.SO(3); sp82_SO= r.SO(4); ppv82_SO= r.SO(5);
acc82_M= r.M(1);  DSC82_M= r.M(2);sn82_M= r.M(3); sp82_M= r.M(4); ppv82_M= r.M(5);

load 'im0139_EvalMIn.mat'
acc139_O1= r.O1(1);  DSC139_O1= r.O1(2);sn139_O1= r.O1(3); sp139_O1= r.O1(4); ppv139_O1= r.O1(5);
acc139_AC= r.AC(1);  DSC139_AC= r.AC(2);sn139_AC= r.AC(3); sp139_AC= r.AC(4); ppv139_AC= r.AC(5);
acc139_SO= r.SO(1);  DSC139_SO= r.SO(2);sn139_SO= r.SO(3); sp139_SO= r.SO(4); ppv139_SO= r.SO(5);
acc139_M= r.M(1);  DSC139_M= r.M(2);sn139_M= r.M(3); sp139_M= r.M(4); ppv139_M= r.M(5);

load 'im0162_EvalMIn.mat'
acc162_O1= r.O1(1);  DSC162_O1= r.O1(2);sn162_O1= r.O1(3); sp162_O1= r.O1(4); ppv162_O1= r.O1(5);
acc162_AC= r.AC(1);  DSC162_AC= r.AC(2);sn162_AC= r.AC(3); sp162_AC= r.AC(4); ppv162_AC= r.AC(5);
acc162_SO= r.SO(1);  DSC162_SO= r.SO(2);sn162_SO= r.SO(3); sp162_SO= r.SO(4); ppv162_SO= r.SO(5);
acc162_M= r.M(1);  DSC162_M= r.M(2);sn162_M= r.M(3); sp162_M= r.M(4); ppv162_M= r.M(5);

load 'im0163_EvalMIn.mat'
acc163_O1= r.O1(1);  DSC163_O1= r.O1(2);sn163_O1= r.O1(3); sp163_O1= r.O1(4); ppv163_O1= r.O1(5);
acc163_AC= r.AC(1);  DSC163_AC= r.AC(2);sn163_AC= r.AC(3); sp163_AC= r.AC(4); ppv163_AC= r.AC(5);
acc163_SO= r.SO(1);  DSC163_SO= r.SO(2);sn163_SO= r.SO(3); sp163_SO= r.SO(4); ppv163_SO= r.SO(5);
acc163_M= r.M(1);  DSC163_M= r.M(2);sn163_M= r.M(3); sp163_M= r.M(4); ppv163_M= r.M(5);

load 'im0235_EvalMIn.mat'
acc235_O1= r.O1(1);  DSC235_O1= r.O1(2);sn235_O1= r.O1(3); sp235_O1= r.O1(4); ppv235_O1= r.O1(5);
acc235_AC= r.AC(1);  DSC235_AC= r.AC(2);sn235_AC= r.AC(3); sp235_AC= r.AC(4); ppv235_AC= r.AC(5);
acc235_SO= r.SO(1);  DSC235_SO= r.SO(2);sn235_SO= r.SO(3); sp235_SO= r.SO(4); ppv235_SO= r.SO(5);
acc235_M= r.M(1);  DSC235_M= r.M(2);sn235_M= r.M(3); sp235_M= r.M(4); ppv235_M= r.M(5);

load 'im0236_EvalMIn.mat'
acc236_O1= r.O1(1);  DSC236_O1= r.O1(2);sn236_O1= r.O1(3); sp236_O1= r.O1(4); ppv236_O1= r.O1(5);
acc236_AC= r.AC(1);  DSC236_AC= r.AC(2);sn236_AC= r.AC(3); sp236_AC= r.AC(4); ppv236_AC= r.AC(5);
acc236_SO= r.SO(1);  DSC236_SO= r.SO(2);sn236_SO= r.SO(3); sp236_SO= r.SO(4); ppv236_SO= r.SO(5);
acc236_M= r.M(1);  DSC236_M= r.M(2);sn236_M= r.M(3); sp236_M= r.M(4); ppv236_M= r.M(5);

load 'im0239_EvalMIn.mat'
acc239_O1= r.O1(1);  DSC239_O1= r.O1(2);sn239_O1= r.O1(3); sp239_O1= r.O1(4); ppv239_O1= r.O1(5);
acc239_AC= r.AC(1);  DSC239_AC= r.AC(2);sn239_AC= r.AC(3); sp239_AC= r.AC(4); ppv239_AC= r.AC(5);
acc239_SO= r.SO(1);  DSC239_SO= r.SO(2);sn239_SO= r.SO(3); sp239_SO= r.SO(4); ppv239_SO= r.SO(5);
acc239_M= r.M(1);  DSC239_M= r.M(2);sn239_M= r.M(3); sp239_M= r.M(4); ppv239_M= r.M(5);

load 'im0240_EvalMIn.mat'
acc240_O1= r.O1(1);  DSC240_O1= r.O1(2);sn240_O1= r.O1(3); sp240_O1= r.O1(4); ppv240_O1= r.O1(5);
acc240_AC= r.AC(1);  DSC240_AC= r.AC(2);sn240_AC= r.AC(3); sp240_AC= r.AC(4); ppv240_AC= r.AC(5);
acc240_SO= r.SO(1);  DSC240_SO= r.SO(2);sn240_SO= r.SO(3); sp240_SO= r.SO(4); ppv240_SO= r.SO(5);
acc240_M= r.M(1);  DSC240_M= r.M(2);sn240_M= r.M(3); sp240_M= r.M(4); ppv240_M= r.M(5);

load 'im0255_EvalMIn.mat'
acc255_O1= r.O1(1);  DSC255_O1= r.O1(2);sn255_O1= r.O1(3); sp255_O1= r.O1(4); ppv255_O1= r.O1(5);
acc255_AC= r.AC(1);  DSC255_AC= r.AC(2);sn255_AC= r.AC(3); sp255_AC= r.AC(4); ppv255_AC= r.AC(5);
acc255_SO= r.SO(1);  DSC255_SO= r.O1(2);sn255_SO= r.SO(3); sp255_SO= r.SO(4); ppv255_SO= r.SO(5);
acc255_M= r.M(1);  DSC255_M= r.O1(2);sn255_M= r.M(3); sp255_M= r.M(4); ppv255_M= r.M(5);

% Otzu on TopHat MFR
acc_O1=[acc44_O1, acc77_O1, acc81_O1, acc82_O1, acc139_O1, acc162_O1, acc163_O1,...
    acc235_O1, acc236_O1, acc239_O1, acc240_O1, acc255_O1]; 
m_O1(1)= sum (acc_O1)/numel (acc_O1); 
std_O1 (1)= std (acc_O1); 

DSC_O1=[DSC44_O1, DSC77_O1, DSC81_O1, DSC82_O1, DSC139_O1, DSC162_O1, DSC163_O1,...
    DSC235_O1, DSC236_O1, DSC239_O1, DSC240_O1, DSC255_O1]; 
m_O1(2)= sum (DSC_O1)/numel (DSC_O1); 
std_O1 (2)= std (DSC_O1); 

sn_O1=[sn44_O1, sn77_O1, sn81_O1, sn82_O1, sn139_O1, sn162_O1, sn163_O1,...
    sn235_O1, sn236_O1, sn239_O1, sn240_O1, sn255_O1]; 
m_O1(3)= sum (sn_O1)/numel (sn_O1); 
std_O1 (3)= std (sn_O1); 

sp_O1=[sp44_O1, sp77_O1, sp81_O1, sp82_O1, sp139_O1, sp162_O1, sp163_O1,...
    sp235_O1, sp236_O1, sp239_O1, sp240_O1, sp255_O1]; 
m_O1(4)= sum (sp_O1)/numel (sp_O1); 
std_O1 (4)= std (sp_O1); 

ppv_O1=[ppv44_O1, ppv77_O1, ppv81_O1, ppv82_O1, ppv139_O1, ppv162_O1, ppv163_O1,...
    ppv235_O1, ppv236_O1, ppv239_O1, ppv240_O1, ppv255_O1]; 
m_O1(5)= sum (ppv_O1)/numel (ppv_O1); 
std_O1 (5)= std (ppv_O1); 

% Chan Vese on TopHat MFR

acc_AC=[acc44_AC, acc77_AC, acc81_AC, acc82_AC, acc139_AC, acc162_AC, acc163_AC,...
    acc235_AC, acc236_AC, acc239_AC, acc240_AC, acc255_AC]; 
m_AC(1)= sum (acc_AC)/numel (acc_AC); 
std_AC (1)= std (acc_AC); 

DSC_AC=[DSC44_AC, DSC77_AC, DSC81_AC, DSC82_AC, DSC139_AC, DSC162_AC, DSC163_AC,...
    DSC235_AC, DSC236_AC, DSC239_AC, DSC240_AC, DSC255_AC]; 
m_AC(2)= sum (DSC_AC)/numel (DSC_AC); 
std_AC (2)= std (DSC_AC); 

sn_AC=[sn44_AC, sn77_AC, sn81_AC, sn82_AC, sn139_AC, sn162_AC, sn163_AC,...
    sn235_AC, sn236_AC, sn239_AC, sn240_AC, sn255_AC]; 
m_AC(3)= sum (sn_AC)/numel (sn_AC); 
std_AC (3)= std (sn_AC); 

sp_AC=[sp44_AC, sp77_AC, sp81_AC, sp82_AC, sp139_AC, sp162_AC, sp163_AC,...
    sp235_AC, sp236_AC, sp239_AC, sp240_AC, sp255_AC]; 
m_AC(4)= sum (sp_AC)/numel (sp_AC); 
std_AC (4)= std (sp_AC); 

ppv_AC=[ppv44_AC, ppv77_AC, ppv81_AC, ppv82_AC, ppv139_AC, ppv162_AC, ppv163_AC,...
    ppv235_AC, ppv236_AC, ppv239_AC, ppv240_AC, ppv255_AC]; 
m_AC(5)= sum (ppv_AC)/numel (ppv_AC); 
std_AC (5)= std (ppv_AC); 

% Otzu on TopHat MFR + Sobel

acc_SO=[acc44_SO, acc77_SO, acc81_SO, acc82_SO, acc139_SO, acc162_SO, acc163_SO,...
    acc235_SO, acc236_SO, acc239_SO, acc240_SO, acc255_SO]; 
m_SO(1)= sum (acc_SO)/numel (acc_SO); 
std_SO(1)= std (acc_SO); 

DSC_SO=[DSC44_SO, DSC77_SO, DSC81_SO, DSC82_SO, DSC139_SO, DSC162_SO, DSC163_SO,...
    DSC235_SO, DSC236_SO, DSC239_SO, DSC240_SO, DSC255_SO]; 
m_SO(2)= sum (DSC_SO)/numel (DSC_SO); 
std_SO(2)= std (DSC_SO); 

sn_SO=[sn44_SO, sn77_SO, sn81_SO, sn82_SO, sn139_SO, sn162_SO, sn163_SO,...
    sn235_SO, sn236_SO, sn239_SO, sn240_SO, sn255_SO]; 
m_SO(3)= sum (sn_SO)/numel (sn_SO); 
std_SO(3)= std (sn_SO); 

sp_SO=[sp44_SO, sp77_SO, sp81_SO, sp82_SO, sp139_SO, sp162_SO, sp163_SO,...
    sp235_SO, sp236_SO, sp239_SO, sp240_SO, sp255_SO]; 
m_SO(4)= sum (sp_SO)/numel (sp_SO); 
std_SO(4)= std (sp_SO); 

ppv_SO=[ppv44_SO, ppv77_SO, ppv81_SO, ppv82_SO, ppv139_SO, ppv162_SO, ppv163_SO,...
    ppv235_SO, ppv236_SO, ppv239_SO, ppv240_SO, ppv255_SO]; 
m_SO(5)= sum (ppv_SO)/numel (ppv_SO); 
std_SO(5)= std (ppv_SO); 

% Otzu on TopHat MFR + Kirsh

acc_M=[acc44_M, acc77_M, acc81_M, acc82_M, acc139_M, acc162_M, acc163_M,...
    acc235_M, acc236_M, acc239_M, acc240_M, acc255_M]; 
m_M(1)= sum (acc_M)/numel (acc_M);
std_M(1)= std (acc_M); 

DSC_M=[DSC44_M, DSC77_M, DSC81_M, DSC82_M, DSC139_M, DSC162_M, DSC163_M,...
    DSC235_M, DSC236_M, DSC239_M, DSC240_M, DSC255_M]; 
m_M(2)= sum (DSC_M)/numel (DSC_M); 
std_M(2)= std (DSC_M); 

sn_M=[sn44_M, sn77_M, sn81_M, sn82_M, sn139_M, sn162_M, sn163_M,...
    sn235_M, sn236_M, sn239_M, sn240_M, sn255_M]; 
m_M(3)= sum (sn_M)/numel (sn_M); 
std_M(3)= std (sn_M); 

sp_M=[sp44_M, sp77_M, sp81_M, sp82_M, sp139_M, sp162_M, sp163_M,...
    sp235_M, sp236_M, sp239_M, sp240_M, sp255_M]; 
m_M(4)= sum (sp_M)/numel (sp_M); 
std_M(4)= std (sp_M); 

ppv_M=[ppv44_M, ppv77_M, ppv81_M, ppv82_M, ppv139_M, ppv162_M, ppv163_M,...
    ppv235_M, ppv236_M, ppv239_M, ppv240_M, ppv255_M]; 
m_M(5)= sum (ppv_M)/numel (ppv_M); 
std_M(5)= std (ppv_M); 

% Final results
method = {'TopHat+MFR+Otzu'; 'TopHat+MFR+ChanVese';  'TopHat+MFR+Sobel+Otzu';  'TopHat+MFR+Kirsh+Otzu'}; 
Accuracy=[m_O1(1);m_AC(1); m_SO(1); m_M(1)]; 
std_Accuracy=[std_O1(1);std_AC(1); std_SO(1); std_M(1)]; 

DSC=[m_O1(2);m_AC(2); m_SO(2); m_M(2)]; 
std_DSC=[std_O1(2);std_AC(2); std_SO(2); std_M(2)]; 

Sensitivity= [m_O1(3);m_AC(3); m_SO(3); m_M(3)]; 
std_Sensitivity= [std_O1(3);std_AC(3); std_SO(3); std_M(3)]; 

Specificity= [m_O1(4);m_AC(4); m_SO(4); m_M(4)]; 
std_Specificity= [std_O1(4);std_AC(4); std_SO(4); std_M(4)]; 

PPV= [m_O1(5);m_AC(5); m_SO(5); m_M(5)]; 
std_PPV= [std_O1(5);std_AC(5); std_SO(5); std_M(5)]; 

T= table (method,Accuracy,DSC, Sensitivity, Specificity,PPV)
T_std= table (method,std_Accuracy,std_DSC, std_Sensitivity, std_Specificity,std_PPV)
save  ('T_INF_ValentinaKouznetsova', 'T')