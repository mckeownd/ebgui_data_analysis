%FINAL PROSTATE TG43MC VS TG186MC
clear all;close all;

%requires file path for ebgui outputs for loc variable

%eg where my files were backupped
loc='C:\Users\dakot\Dropbox\Dakota\UBCO-Masters\Project\Prostate Patients\';

%PT0043 U_D1cc=0?
noU=[8,11,12,16,27,29,31,43,49,54,57,58,59,72,73,75,79,83,84,90,91];
Rx_110 = [8,11,17,19,23,27,34,37,49];
for pt = [1:29,31:43,45,46,49:52,54:60:63,65:86,89:93]%51,69,70

    if pt < 10
        dest=[loc,'PT000',num2str(pt),'\'];
        %fscanf(fopen([dest,'TG43\plan\PT000',num2str(pt),'.log']),'%c')
    else
        dest = [loc,'PT00',num2str(pt),'\'];
        %fscanf(fopen([dest,'TG43\plan\PT00',num2str(pt),'.log']),'%c')
    end

for hist = 8

T2=readtable([dest,'1e',num2str(hist),'\Prostate_metrics.csv']);
if ~ismember(pt,noU)
    T3=readtable([dest,'1e',num2str(hist),'\Urethra_metrics.csv']);
else
end
T4=readtable([dest,'1e',num2str(hist),'\Bladder_metrics.csv']);
T5=readtable([dest,'1e',num2str(hist),'\Rectum_metrics.csv']);

T7=readtable([dest,'1e',num2str(hist),'2\Prostate_metrics.csv']);
if ~ismember(pt,noU)
    T8=readtable([dest,'1e',num2str(hist),'2\Urethra_metrics.csv']);
else
end
T9=readtable([dest,'1e',num2str(hist),'2\Bladder_metrics.csv']);
T10=readtable([dest,'1e',num2str(hist),'2\Rectum_metrics.csv']);

if ~ismember(pt,Rx_110)
    CTV_D90_43(pt,hist) = T2.Prostate(7);
    CTV_D90_err_43(pt,hist) = T2.Var3(7);
    CTV_D99_43(pt,hist) = T2.Prostate(8);
    CTV_D99_err_43(pt,hist) = T2.Var3(8);
else
end
CTV_V100_43(pt,hist) = T2.Prostate(10);
CTV_V100_err_43(pt,hist) = T2.Var3(10);
CTV_V150_43(pt,hist) = T2.Prostate(11);
CTV_V150_err_43(pt,hist) = T2.Var3(11);
CTV_V200_43(pt,hist) = T2.Prostate(12);
CTV_V200_err_43(pt,hist) = T2.Var3(12);

if ~ismember(pt,Rx_110)
    B_D1cc_43(pt,hist) = T4.Bladder(7);
    B_D2cc_43(pt,hist) = T4.Bladder(8);
    
    R_D01cc_43(pt,hist) = T5.Rectum(7);
    R_D1cc_43(pt,hist) = T5.Rectum(8);
    R_D2cc_43(pt,hist) = T5.Rectum(9);
    
    if ~ismember(pt,noU)
        U_D01cc_43(pt,hist) = T3.Urethra(9);
        U_D01cc_err_43(pt,hist) = T3.Var3(9);
        U_D1cc_43(pt,hist) = T3.Urethra(10);
        U_D1cc_err_43(pt,hist) = T3.Var3(10);
        U_Dmax_43(pt,hist) = T3.Urethra(1);
    else
    end
else
end

if ~ismember(pt,Rx_110)
    CTV_D90_186(pt,hist) = T7.Prostate(7);
    CTV_D90_err_186(pt,hist) = T7.Var3(7);
    CTV_D99_186(pt,hist) = T7.Prostate(8);
    CTV_D99_err_186(pt,hist) = T7.Var3(8);
else
end
CTV_V100_186(pt,hist) = T7.Prostate(10);
CTV_V100_err_186(pt,hist) = T7.Var3(10);
CTV_V150_186(pt,hist) = T7.Prostate(11);
CTV_V150_err_186(pt,hist) = T7.Var3(11);
CTV_V200_186(pt,hist) = T7.Prostate(12);
CTV_V200_err_186(pt,hist) = T7.Var3(12);

if ~ismember(pt,Rx_110)
    B_D1cc_186(pt,hist) = T9.Bladder(7);
    B_D2cc_186(pt,hist) = T9.Bladder(8);
    
    R_D01cc_186(pt,hist) = T10.Rectum(7);
    R_D1cc_186(pt,hist) = T10.Rectum(8);
    R_D2cc_186(pt,hist) = T10.Rectum(9);
    
    if ~ismember(pt,noU)
    U_D01cc_186(pt,hist) = T8.Urethra(9);
    U_D01cc_err_186(pt,hist) = T8.Var3(9);
    U_D1cc_186(pt,hist) = T8.Urethra(10);
    U_D1cc_err_186(pt,hist) = T8.Var3(10);
    U_Dmax_186(pt,hist) = T8.Urethra(1);
    else
    end

else
end

end
end

CTV_V100_43=CTV_V100_43(:,8);
CTV_V100_43=CTV_V100_43(CTV_V100_43~=0);
CTV_V150_43=CTV_V150_43(:,8);
CTV_V150_43=CTV_V150_43(CTV_V150_43~=0);
CTV_V200_43=CTV_V200_43(:,8);
CTV_V200_43=CTV_V200_43(CTV_V200_43~=0);
CTV_D90_43=CTV_D90_43(:,8);
CTV_D90_43=CTV_D90_43(CTV_D90_43~=0);
CTV_D99_43=CTV_D99_43(:,8);
CTV_D99_43=CTV_D99_43(CTV_D99_43~=0);

U_D01cc_43=U_D01cc_43(:,8);
U_D01cc_43=U_D01cc_43(U_D01cc_43~=0);
U_D1cc_43=U_D1cc_43(:,8);
U_D1cc_43=U_D1cc_43(U_D1cc_43~=0);
U_Dmax_43=U_Dmax_43(:,8);
U_Dmax_43=U_Dmax_43(U_Dmax_43~=0);

B_D1cc_43=B_D1cc_43(:,8);
B_D1cc_43=B_D1cc_43(B_D1cc_43~=0);
B_D2cc_43=B_D2cc_43(:,8);
B_D2cc_43=B_D2cc_43(B_D2cc_43~=0);

R_D01cc_43=R_D01cc_43(:,8);
R_D01cc_43=R_D01cc_43(R_D01cc_43~=0);
R_D1cc_43=R_D1cc_43(:,8);
R_D1cc_43=R_D1cc_43(R_D1cc_43~=0);
R_D2cc_43=R_D2cc_43(:,8);
R_D2cc_43=R_D2cc_43(R_D2cc_43~=0);

CTV_D90_186=CTV_D90_186(:,8);
CTV_D90_186=CTV_D90_186(CTV_D90_186~=0);
CTV_D99_186=CTV_D99_186(:,8);
CTV_D99_186=CTV_D99_186(CTV_D99_186~=0);
CTV_V100_186=CTV_V100_186(:,8);
CTV_V100_186=CTV_V100_186(CTV_V100_186~=0);
CTV_V150_186=CTV_V150_186(:,8);
CTV_V150_186=CTV_V150_186(CTV_V150_186~=0);
CTV_V200_186=CTV_V200_186(:,8);
CTV_V200_186=CTV_V200_186(CTV_V200_186~=0);

U_D01cc_186=U_D01cc_186(:,8);
U_D01cc_186=U_D01cc_186(U_D01cc_186~=0);
U_D1cc_186=U_D1cc_186(:,8);
U_D1cc_186=U_D1cc_186(U_D1cc_186~=0);
U_Dmax_186=U_Dmax_186(:,8);
U_Dmax_186=U_Dmax_186(U_Dmax_186~=0);

B_D1cc_186=B_D1cc_186(:,8);
B_D1cc_186=B_D1cc_186(B_D1cc_186~=0);
B_D2cc_186=B_D2cc_186(:,8);
B_D2cc_186=B_D2cc_186(B_D2cc_186~=0);

R_D01cc_186=R_D01cc_186(:,8);
R_D01cc_186=R_D01cc_186(R_D01cc_186~=0);
R_D1cc_186=R_D1cc_186(:,8);
R_D1cc_186=R_D1cc_186(R_D1cc_186~=0);
R_D2cc_186=R_D2cc_186(:,8);
R_D2cc_186=R_D2cc_186(R_D2cc_186~=0);

%{
figure()
boxplot([CTV_D90_43,CTV_D90_186,CTV_D99_43,CTV_D99_186])
title('CTV')
set(gca,'FontSize',24,'xtick',1:4,'XTickLabels',{'TG43MC','TG186MC','TG43MC','TG186MC'})
ylabel('Dose (Gy)')
xlabel('D90                       D99')
%}

[p_CTV_D90,h_CTV_D90]=ranksum(CTV_D90_186,CTV_D90_43);
[p_CTV_D99,h_CTV_D99]=ranksum(CTV_D99_186,CTV_D99_43);

med_CTV_D90_186 = median(CTV_D90_186);
iqr_CTV_D90_186 = iqr(CTV_D90_186);
med_CTV_D90_43 = median(CTV_D90_43);
iqr_CTV_D90_43 = iqr(CTV_D90_43);

med_CTV_D99_186 = median(CTV_D99_186);
iqr_CTV_D99_186 = iqr(CTV_D99_186);
med_CTV_D99_43 = median(CTV_D99_43);
iqr_CTV_D99_43 = iqr(CTV_D99_43);

figure()
boxplot([CTV_V100_43,CTV_V100_186,CTV_V150_43,CTV_V150_186,CTV_V200_43,CTV_V200_186])
title('CTV')
set(gca,'FontSize',24,'xtick',1:6,'XTickLabels',{'TG43MC','TG186MC','TG43MC','TG186MC','TG43MC','TG186MC'})
ylabel('Volume (%)')
xlabel('V100                       V150                       V200')
ylim([5,115])

[p_CTV_V100,h_CTV_V100]=ranksum(CTV_V100_186,CTV_V100_43);
[p_CTV_V150,h_CTV_V150]=ranksum(CTV_V150_186,CTV_V150_43);
[p_CTV_V200,h_CTV_V200]=ranksum(CTV_V200_186,CTV_V200_43);

med_CTV_V100_186 = median(CTV_V100_186);
iqr_CTV_V100_186 = iqr(CTV_V100_186);
med_CTV_V100_43 = median(CTV_V100_43);
iqr_CTV_V100_43 = iqr(CTV_V100_43);

med_CTV_V150_186 = median(CTV_V150_186);
iqr_CTV_V150_186 = iqr(CTV_V150_186);
med_CTV_V150_43 = median(CTV_V150_43);
iqr_CTV_V150_43 = iqr(CTV_V150_43);

med_CTV_V200_186 = median(CTV_V200_186);
iqr_CTV_V200_186 = iqr(CTV_V200_186);
med_CTV_V200_43 = median(CTV_V200_43);
iqr_CTV_V200_43 = iqr(CTV_V200_43);

figure()
boxplot([U_D01cc_43,U_D01cc_186,U_D1cc_43,U_D1cc_186])
title('Urethra')
set(gca,'FontSize',24,'xtick',1:4,'XTickLabels',{'TG43MC','TG186MC','TG43MC','TG186MC'})
ylabel('Dose (Gy)')
xlabel('D0.1cc                                       D1cc')

[p_U_D01cc,h_U_D01cc]=ranksum(U_D01cc_186,U_D01cc_43);
[p_U_D1cc,h_U_D1cc]=ranksum(U_D1cc_186,U_D1cc_43);
[p_U_Dmax,h_U_Dmax]=ranksum(U_Dmax_186,U_Dmax_43);

med_U_D01cc_186 = median(U_D01cc_186);
iqr_U_D01cc_186 = iqr(U_D01cc_186);
med_U_D01cc_43 = median(U_D01cc_43);
iqr_U_D01cc_43 = iqr(U_D01cc_43);

med_U_D1cc_186 = median(U_D1cc_186);
iqr_U_D1cc_186 = iqr(U_D1cc_186);
med_U_D1cc_43 = median(U_D1cc_43);
iqr_U_D1cc_43 = iqr(U_D1cc_43);

med_U_Dmax_186 = median(U_Dmax_186);
iqr_U_Dmax_186 = iqr(U_Dmax_186);
med_U_Dmax_43 = median(U_Dmax_43);
iqr_U_Dmax_43 = iqr(U_Dmax_43);

%{
figure()
boxplot([B_D1cc_186,B_D1cc_43,B_D2cc_186,B_D2cc_43])
title('Bladder')
set(gca,'FontSize',24,'xtick',1:4,'XTickLabels',{'1e7','1e8','1e7','1e8'})
ylabel('Dose (Gy)')
xlabel('D1cc                                         D2cc')
%}

[p_B_D1cc,h_B_D1cc]=ranksum(B_D1cc_186,B_D1cc_43);
[p_B_D2cc,h_B_D2cc]=ranksum(B_D2cc_186,B_D2cc_43);

med_B_D1cc_186 = median(B_D1cc_186);
iqr_B_D1cc_186 = iqr(B_D1cc_186);
med_B_D1cc_43 = median(B_D1cc_43);
iqr_B_D1cc_43 = iqr(B_D1cc_43);
med_B_D2cc_186 = median(B_D2cc_186);
iqr_B_D2cc_186 = iqr(B_D2cc_186);
med_B_D2cc_43 = median(B_D2cc_43);
iqr_B_D2cc_43 = iqr(B_D2cc_43);

%{
figure()
boxplot([R_D01cc_186,R_D01cc_43,R_D1cc_186,R_D1cc_43,R_D2cc_186,R_D2cc_43])
title('Rectum')
set(gca,'FontSize',24,'xtick',1:6,'XTickLabels',{'1e7','1e8','1e7','1e8','1e7','1e8'})
ylabel('Dose (Gy)')
xlabel('D0.1cc                      D1cc                       D2cc')
%}

[p_R_D01cc,h_R_D01cc]=ranksum(R_D01cc_186,R_D01cc_43);
[p_R_D1cc,h_R_D1cc]=ranksum(R_D1cc_186,R_D1cc_43);
[p_R_D2cc,h_R_D2cc]=ranksum(R_D2cc_186,R_D2cc_43);

med_R_D01cc_186 = median(R_D01cc_186);
iqr_R_D01cc_186 = iqr(R_D01cc_186);
med_R_D01cc_43 = median(R_D01cc_43);
iqr_R_D01cc_43 = iqr(R_D01cc_43);
med_R_D1cc_186 = median(R_D1cc_186);
iqr_R_D1cc_186 = iqr(R_D1cc_186);
med_R_D1cc_43 = median(R_D1cc_43);
iqr_R_D1cc_43 = iqr(R_D1cc_43);
med_R_D2cc_186 = median(R_D2cc_186);
iqr_R_D2cc_186 = iqr(R_D2cc_186);
med_R_D2cc_43 = median(R_D2cc_43);
iqr_R_D2cc_43 = iqr(R_D2cc_43);

headings = ["Prostate";"";"";"";"";"Urethra";"";"";"Bladder";"";"Rectum";"";""];
metrics = ["D90";"D99";"V100";"V150";"V200";"D0.1cc";"D1cc";"Dmax";"D1cc";"D2cc";"D0.1cc";"D1cc";"D2cc"];
med186= [med_CTV_D90_186;med_CTV_D99_186;med_CTV_V100_186;med_CTV_V150_186;med_CTV_V200_186;med_U_D01cc_186;med_U_D1cc_186;med_U_Dmax_186;med_B_D1cc_186;med_B_D2cc_186;med_R_D01cc_186;med_R_D1cc_186;med_R_D2cc_186];
med43= [med_CTV_D90_43;med_CTV_D99_43;med_CTV_V100_43;med_CTV_V150_43;med_CTV_V200_43;med_U_D01cc_43;med_U_D1cc_43;med_U_Dmax_43;med_B_D1cc_43;med_B_D2cc_43;med_R_D01cc_43;med_R_D1cc_43;med_R_D2cc_43];
iqr186= [iqr_CTV_D90_186;iqr_CTV_D99_186;iqr_CTV_V100_186;iqr_CTV_V150_186;iqr_CTV_V200_186;iqr_U_D01cc_186;iqr_U_D1cc_186;iqr_U_Dmax_186;iqr_B_D1cc_186;iqr_B_D2cc_186;iqr_R_D01cc_186;iqr_R_D1cc_186;iqr_R_D2cc_186];
iqr43= [iqr_CTV_D90_43;iqr_CTV_D99_43;iqr_CTV_V100_43;iqr_CTV_V150_43;iqr_CTV_V200_43;iqr_U_D01cc_43;iqr_U_D1cc_43;iqr_U_Dmax_43;iqr_B_D1cc_43;iqr_B_D2cc_43;iqr_R_D01cc_43;iqr_R_D1cc_43;iqr_R_D2cc_43];

T6 = table(headings,metrics,med186,med43,iqr186,iqr43);
