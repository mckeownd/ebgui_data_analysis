% plot Prostate dose metric differences MC TG43 and TG186
% requires entering path to default ebgui repository or backup location for loc variable

%eg where my files were backupped
loc = 'C:\Users\dakot\Dropbox\Dakota\UBCO-Masters\Project\Breast Patients\';

%preallocate arrays with n zeros
n=100;
ETV_V9043=zeros(1,n);ETV_V90186=zeros(1,n);B_D1cc43=zeros(1,n);B_V15043=zeros(1,n);B_Dmax43=zeros(1,n);B_D1cc186=zeros(1,n);B_V150186=zeros(1,n);B_Dmax186=zeros(1,n);C_Dmax43=zeros(1,n);C_Dmax186=zeros(1,n);CTV_D9043=zeros(1,n);CTV_V10043=zeros(1,n);CTV_V15043=zeros(1,n);CTV_V20043=zeros(1,n);CTV_Dmax43=zeros(1,n);CTV_D90186=zeros(1,n);CTV_V100186=zeros(1,n);CTV_V150186=zeros(1,n);CTV_V200186=zeros(1,n);CTV_Dmax186=zeros(1,n);ETV_D9043=zeros(1,n);ETV_V10043=zeros(1,n);ETV_V15043=zeros(1,n);ETV_V20043=zeros(1,n);ETV_Dmax43=zeros(1,n);ETV_D90186=zeros(1,n);ETV_V100186=zeros(1,n);ETV_V150186=zeros(1,n);ETV_V200186=zeros(1,n);ETV_Dmax186=zeros(1,n);H_D1cc43=zeros(1,n);H_Dmax43=zeros(1,n);H_D1cc186=zeros(1,n);H_Dmax186=zeros(1,n);L_V543=zeros(1,n);L_Dmax43=zeros(1,n);L_V5186=zeros(1,n);L_Dmax186=zeros(1,n);R_Dmax43=zeros(1,n);R_Dmax186=zeros(1,n);S_D02cc43=zeros(1,n);S_D05cc43=zeros(1,n);S_D1cc43=zeros(1,n);S_V543=zeros(1,n);S_Dmax43=zeros(1,n);S_D02cc186=zeros(1,n);S_D05cc186=zeros(1,n);S_D1cc186=zeros(1,n);S_V5186=zeros(1,n);S_Dmax186=zeros(1,n);

%loop over PTs
%excluding PTs not treated with LDR 51,56,58,81
for pt = [2:50,52:55,57,59:80,82:84]%[1:50,52:55,57,59:80,82:84]1:84

    %file destinations for differing patient number magnitude
    if pt<10
    dest=[loc,'PT0',num2str(pt),'\'];
    else
    dest=[loc,'PT',num2str(pt),'\'];
    end

    %Read metric data from GUI
    T_B43=readtable([dest,'TG43\Breast_metrics.csv']);
    T_B186=readtable([dest,'TG186\Breast_metrics.csv']);
    T_C43=readtable([dest,'TG43\Chest_metrics.csv']);
    T_C186=readtable([dest,'TG186\Chest_metrics.csv']);
    T_CTV43=readtable([dest,'TG43\CTV_metrics.csv']);
    T_CTV186=readtable([dest,'TG186\CTV_metrics.csv']);
    T_ETV43=readtable([dest,'TG43\ETV_metrics.csv']);
    T_ETV186=readtable([dest,'TG186\ETV_metrics.csv']);
    T_H43=readtable([dest,'TG43\Heart_metrics.csv']);
    T_H186=readtable([dest,'TG186\Heart_metrics.csv']);
    T_L43=readtable([dest,'TG43\Lung_metrics.csv']);
    T_L186=readtable([dest,'TG186\Lung_metrics.csv']);
    T_R43=readtable([dest,'TG43\Ribs_metrics.csv']);
    T_R186=readtable([dest,'TG186\Ribs_metrics.csv']);
    T_S43=readtable([dest,'TG43\Skin_metrics.csv']);
    T_S186=readtable([dest,'TG186\Skin_metrics.csv']);

    %{
    T_ETV2 = readtable([loc2,num2str(pt)]);
    ETV2=T_ETV2.(2);
    ETV_V9043(pt)=ETV2(7);
    ETV2=T_ETV2.(4);
    ETV_V90186(pt)=ETV2(7);
    %}

    B_D1cc43(pt)=T_B43.Breast(7);
    B_V15043(pt)=T_B43.Breast(8);

    B_D1cc186(pt)=T_B186.Breast(7);
    B_V150186(pt)=T_B186.Breast(8);

    CTV_D9043(pt)=T_CTV43.CTV(7);
    CTV_V10043(pt)=T_CTV43.CTV(8);
    CTV_V15043(pt)=T_CTV43.CTV(9);
    CTV_V20043(pt)=T_CTV43.CTV(10);

    CTV_D90186(pt)=T_CTV186.CTV(7);
    CTV_V100186(pt)=T_CTV186.CTV(8);
    CTV_V150186(pt)=T_CTV186.CTV(9);
    CTV_V200186(pt)=T_CTV186.CTV(10);

    ETV_D9043(pt)=T_ETV43.ETV(7);
    ETV_V10043(pt)=T_ETV43.ETV(8);
    ETV_V15043(pt)=T_ETV43.ETV(9);
    ETV_V20043(pt)=T_ETV43.ETV(10);

    ETV_D90186(pt)=T_ETV186.ETV(7);
    ETV_V100186(pt)=T_ETV186.ETV(8);
    ETV_V150186(pt)=T_ETV186.ETV(9);
    ETV_V200186(pt)=T_ETV186.ETV(10);

    H_D1cc43(pt)=T_H43.Heart(7);

    H_D1cc186(pt)=T_H186.Heart(7);

    L_V543(pt)=T_L43.Lung(7);

    L_V5186(pt)=T_L186.Lung(7);

    R_Dmax43(pt)=T_R43.Ribs(1);

    R_Dmax186(pt)=T_R186.Ribs(1);

    S_D02cc43(pt)=T_S43.Skin(7);
    S_D05cc43(pt)=T_S43.Skin(8);
    S_D1cc43(pt)=T_S43.Skin(9);

    S_D02cc186(pt)=T_S186.Skin(7);
    S_D05cc186(pt)=T_S186.Skin(8);
    S_D1cc186(pt)=T_S186.Skin(9);
    
end

    B_D1cc43=B_D1cc43(B_D1cc43~=0);
    B_V15043=B_V15043(B_V15043~=0);

    B_D1cc186=B_D1cc186(B_D1cc186~=0);
    B_V150186=B_V150186(B_V150186~=0);

    CTV_D9043=CTV_D9043(CTV_D9043~=0);
    CTV_V10043=CTV_V10043(CTV_V10043~=0);
    CTV_V15043=CTV_V15043(CTV_V15043~=0);
    CTV_V20043=CTV_V20043(CTV_V20043~=0);

    CTV_D90186=CTV_D90186(CTV_D90186~=0);
    CTV_V100186=CTV_V100186(CTV_V100186~=0);
    CTV_V150186=CTV_V150186(CTV_V150186~=0);
    CTV_V200186=CTV_V200186(CTV_V200186~=0);

    ETV_D9043=ETV_D9043(ETV_D9043~=0);
    ETV_V9043=ETV_V9043(ETV_V9043~=0);
    ETV_V10043=ETV_V10043(ETV_V10043~=0);
    ETV_V15043=ETV_V15043(ETV_V15043~=0);
    ETV_V20043=ETV_V20043(ETV_V20043~=0);

    ETV_D90186=ETV_D90186(ETV_D90186~=0);
    ETV_V90186=ETV_V90186(ETV_V90186~=0);
    ETV_V100186=ETV_V100186(ETV_V100186~=0);
    ETV_V150186=ETV_V150186(ETV_V150186~=0);
    ETV_V200186=ETV_V200186(ETV_V200186~=0);

    H_D1cc43=H_D1cc43(H_D1cc43~=0);

    H_D1cc186=H_D1cc186(H_D1cc186~=0);

    L_V543=L_V543(L_V543~=0);

    L_V5186=L_V5186(L_V5186~=0);

    R_Dmax43=R_Dmax43(R_Dmax43~=0);

    R_Dmax186=R_Dmax186(R_Dmax186~=0);

    S_D02cc43=S_D02cc43(S_D02cc43~=0);
    S_D05cc43=S_D05cc43(S_D05cc43~=0);
    S_D1cc43=S_D1cc43(S_D1cc43~=0);

    S_D02cc186=S_D02cc186(S_D02cc186~=0);
    S_D05cc186=S_D05cc186(S_D05cc186~=0);
    S_D1cc186=S_D1cc186(S_D1cc186~=0);

%all possible metrics
%

%{
figure()
boxplot([B_V15043',B_V150186',L_V543',L_V5186'])
title('Breast                                       Lung')
set(gca,'FontSize',24,'xtick',1:4,'XTickLabels',{'TG43','MC','TG43','MC'})
ylabel('Volume (%)')
xlabel('V150                                         V5')
ylim([-1,17])
%}

%Lung only
figure()
boxplot([L_V543',L_V5186'])
title('Lung')
set(gca,'FontSize',24,'xtick',1:4,'XTickLabels',{'TG43','MC'})
ylabel('Volume (%)')
xlabel('V5')
ylim([-1,17])

[p_B_V150,h_B_V150]=ranksum(B_V15043,B_V150186);
[p_L_V5,h_L_V5]=ranksum(L_V543,L_V5186);

%{
figure()
boxplot([CTV_D9043',CTV_D90186',ETV_D9043',ETV_D90186'])
title('CTV                                         ETV')
set(gca,'FontSize',24,'xtick',1:4,'XTickLabels',{'TG43','MC','TG43','MC'})
ylabel('Dose (Gy)')
xlabel('D90')
ylim([35,220])
%}

[p_CTV_D90,h_CTV_D90]=ranksum(CTV_D9043,CTV_D90186);
[p_ETV_D90,h_ETV_D90]=ranksum(ETV_D9043,ETV_D90186);

figure()
boxplot([CTV_V10043',CTV_V100186',CTV_V15043',CTV_V150186',CTV_V20043',CTV_V200186',ETV_V10043',ETV_V100186',ETV_V15043',ETV_V150186',ETV_V20043',ETV_V200186'])
title('CTV                                        ETV')
set(gca,'FontSize',24,'xtick',1:14,'XTickLabels',{'TG43','MC','TG43','MC','TG43','MC','TG43','MC','TG43','MC','TG43','MC'})
ylabel('Volume (%)')
xlabel('V100       V150       V200       V100       V150       V200')
ylim([0,110])

[p_CTV_V100,h_CTV_V100]=ranksum(CTV_V10043,CTV_V100186);
[p_CTV_V150,h_CTV_V150]=ranksum(CTV_V15043,CTV_V150186);
[p_CTV_V200,h_CTV_V200]=ranksum(CTV_V20043,CTV_V200186);
[p_ETV_V90,h_ETV_V90]=ranksum(ETV_V9043,ETV_V90186);
[p_ETV_V100,h_ETV_V100]=ranksum(ETV_V10043,ETV_V100186);
[p_ETV_V150,h_ETV_V150]=ranksum(ETV_V15043,ETV_V150186);
[p_ETV_V200,h_ETV_V200]=ranksum(ETV_V20043,ETV_V200186);

%{
figure()
boxplot([H_D1cc43',H_D1cc186'])
title('Heart')
set(gca,'FontSize',24,'xtick',1:2,'XTickLabels',{'TG43','MC'})
ylabel('Dose (Gy)')
xlabel('D1cc')
ylim([-1,9])
%}

[p_H_D1cc,h_H_D1cc]=ranksum(H_D1cc43,H_D1cc186);

figure()
boxplot([S_D02cc43',S_D02cc186',S_D05cc43',S_D05cc186',S_D1cc43',S_D1cc186'])
title('Skin')
set(gca,'FontSize',24,'xtick',1:6,'XTickLabels',{'TG43','MC','TG43','MC','TG43','MC'})
ylabel('Dose (Gy)')
xlabel('D0.2cc                       D0.5cc                      D1cc')
ylim([-10,150])

[p_S_D02cc,h_S_D02cc]=ranksum(S_D02cc43,S_D02cc186);
[p_S_D05cc,h_S_D05cc]=ranksum(S_D05cc43,S_D05cc186);
[p_S_D1cc,h_S_D1cc]=ranksum(S_D1cc43,S_D1cc186);

%%%

%{
figure()
boxplot([B_D1cc43',B_D1cc186',R_Dmax43',R_Dmax186'])
title('Breast                                     Ribs')
set(gca,'FontSize',24,'xtick',1:4,'XTickLabels',{'TG43','MC','TG43','MC'})
ylabel('Dose (Gy)')
xlabel('D1cc                                       Dmax')
ylim([-50,1500])
%}

[p_B_D1cc,h_B_D1cc]=ranksum(B_D1cc43,B_D1cc186);
[p_R_Dmax,h_R_Dmax]=ranksum(R_Dmax43,R_Dmax186);

%diff = TG43-TG186 / TG43 * 100

diff_B_D1cc=(B_D1cc186-B_D1cc43)./B_D1cc186*100;
avg_diff_B_D1cc=mean(diff_B_D1cc);
std_diff_B_D1cc=std(diff_B_D1cc);

diff_B_V150=(B_V150186-B_V15043)./B_V150186*100;
avg_diff_B_V150=mean(diff_B_V150);
std_diff_B_V150=std(diff_B_V150);

diff_CTV_D90=(CTV_D90186-CTV_D9043)./CTV_D90186*100;
avg_diff_CTV_D90=mean(diff_CTV_D90);
std_diff_CTV_D90=std(diff_CTV_D90);

diff_CTV_V100=(CTV_V100186-CTV_V10043)./CTV_V100186*100;
avg_diff_CTV_V100=mean(diff_CTV_V100);
std_diff_CTV_V100=std(diff_CTV_V100);

diff_CTV_V150=(CTV_V150186-CTV_V15043)./CTV_V150186*100;
avg_diff_CTV_V150=mean(diff_CTV_V150);
std_diff_CTV_V150=std(diff_CTV_V150);

diff_CTV_V200=(CTV_V200186-CTV_V20043)./CTV_V200186*100;
avg_diff_CTV_V200=mean(diff_CTV_V200);
std_diff_CTV_V200=std(diff_CTV_V200);

diff_ETV_D90=(ETV_D90186-ETV_D9043)./ETV_D90186*100;
avg_diff_ETV_D90=mean(diff_ETV_D90);
std_diff_ETV_D90=std(diff_ETV_D90);

diff_ETV_V100=(ETV_V100186-ETV_V10043)./ETV_V100186*100;
avg_diff_ETV_V100=mean(diff_ETV_V100);
std_diff_ETV_V100=std(diff_ETV_V100);

diff_ETV_V150=(ETV_V150186-ETV_V15043)./ETV_V150186*100;
avg_diff_ETV_V150=mean(diff_ETV_V150);
std_diff_ETV_V150=std(diff_ETV_V150);

diff_ETV_V200=(ETV_V200186-ETV_V20043)./ETV_V200186*100;
avg_diff_ETV_V200=mean(diff_ETV_V200);
std_diff_ETV_V200=std(diff_ETV_V200);

diff_H_D1cc=(H_D1cc186-H_D1cc43)./H_D1cc186*100;
avg_diff_H_D1cc=mean(diff_H_D1cc);
std_diff_H_D1cc=std(diff_H_D1cc);

diff_L_V5=(L_V5186-L_V543)./L_V5186*100;
diff_L_V5=diff_L_V5(~isnan(diff_L_V5));
avg_diff_L_V5=mean(diff_L_V5);
std_diff_L_V5=std(diff_L_V5);

diff_R_Dmax=(R_Dmax186-R_Dmax43)./R_Dmax186*100;
avg_diff_R_Dmax=mean(diff_R_Dmax);
std_diff_R_Dmax=std(diff_R_Dmax);

diff_S_D02cc=(S_D02cc186-S_D02cc43)./S_D02cc186*100;
avg_diff_S_D02cc=mean(diff_S_D02cc);
std_diff_S_D02cc=std(diff_S_D02cc);

diff_S_D05cc=(S_D05cc186-S_D05cc43)./S_D05cc186*100;
avg_diff_S_D05cc=mean(diff_S_D05cc);
std_diff_S_D05cc=std(diff_S_D05cc);

diff_S_D1cc=(S_D1cc186-S_D1cc43)./S_D1cc186*100;
avg_diff_S_D1cc=mean(diff_S_D1cc);
std_diff_S_D1cc=std(diff_S_D1cc);

% create table of info

headings = ["CTV";"";"";"";"ETV";"";"";"";"Breast";"";"Ribs";"Skin";"";"";"Heart";"Lung"];
metrics = ["D90";"V100";"V150";"V200";"D90";"V100";"V150";"V200";"D1cc";"V150";"Dmax";"D0.2cc";"D0.5cc";"D1cc";"D1cc";"V5"];
avg_diff = [avg_diff_CTV_D90;avg_diff_CTV_V100;avg_diff_CTV_V150;avg_diff_CTV_V200;avg_diff_ETV_D90;avg_diff_ETV_V100;avg_diff_ETV_V150;avg_diff_ETV_V200;avg_diff_B_D1cc;avg_diff_B_V150;avg_diff_R_Dmax;avg_diff_S_D02cc;avg_diff_S_D05cc;avg_diff_S_D1cc;avg_diff_H_D1cc;avg_diff_L_V5];
std_diff = [std_diff_CTV_D90;std_diff_CTV_V100;std_diff_CTV_V150;std_diff_CTV_V200;std_diff_ETV_D90;std_diff_ETV_V100;std_diff_ETV_V150;std_diff_ETV_V200;std_diff_B_D1cc;std_diff_B_V150;std_diff_R_Dmax;std_diff_S_D02cc;std_diff_S_D05cc;std_diff_S_D1cc;std_diff_H_D1cc;std_diff_L_V5];

T = table(headings,metrics,avg_diff,std_diff);

% mean values
avg_B_D1cc43=mean(B_D1cc43);
std_B_D1cc43=std(B_D1cc43);
med_B_D1cc43=median(B_D1cc43);
iqr_B_D1cc43=iqr(B_D1cc43);
avg_B_D1cc186=mean(B_D1cc186);
std_B_D1cc186=std(B_D1cc186);
med_B_D1cc186=median(B_D1cc186);
iqr_B_D1cc186=iqr(B_D1cc186);

avg_B_V15043=mean(B_V15043);
std_B_V15043=std(B_V15043);
med_B_V15043=median(B_V15043);
iqr_B_V15043=iqr(B_V15043);
avg_B_V150186=mean(B_V150186);
std_B_V150186=std(B_V150186);
med_B_V150186=median(B_V150186);
iqr_B_V150186=iqr(B_V150186);

avg_CTV_D9043=mean(CTV_D9043);
std_CTV_D9043=std(CTV_D9043);
med_CTV_D9043=median(CTV_D9043);
iqr_CTV_D9043=iqr(CTV_D9043);
avg_CTV_D90186=mean(CTV_D90186);
std_CTV_D90186=std(CTV_D90186);
med_CTV_D90186=median(CTV_D90186);
iqr_CTV_D90186=iqr(CTV_D90186);

avg_CTV_V10043=mean(CTV_V10043);
std_CTV_V10043=std(CTV_V10043);
med_CTV_V10043=median(CTV_V10043);
iqr_CTV_V10043=iqr(CTV_V10043);
avg_CTV_V100186=mean(CTV_V100186);
std_CTV_V100186=std(CTV_V100186);
med_CTV_V100186=median(CTV_V100186);
iqr_CTV_V100186=iqr(CTV_V100186);

avg_CTV_V15043=mean(CTV_V15043);
std_CTV_V15043=std(CTV_V15043);
med_CTV_V15043=median(CTV_V15043);
iqr_CTV_V15043=iqr(CTV_V15043);
avg_CTV_V150186=mean(CTV_V150186);
std_CTV_V150186=std(CTV_V150186);
med_CTV_V150186=median(CTV_V150186);
iqr_CTV_V150186=iqr(CTV_V150186);

avg_CTV_V20043=mean(CTV_V20043);
std_CTV_V20043=std(CTV_V20043);
med_CTV_V20043=median(CTV_V20043);
iqr_CTV_V20043=iqr(CTV_V20043);
avg_CTV_V200186=mean(CTV_V200186);
std_CTV_V200186=std(CTV_V200186);
med_CTV_V200186=median(CTV_V200186);
iqr_CTV_V200186=iqr(CTV_V200186);

avg_ETV_D9043=mean(ETV_D9043);
std_ETV_D9043=std(ETV_D9043);
med_ETV_D9043=median(ETV_D9043);
iqr_ETV_D9043=iqr(ETV_D9043);
avg_ETV_D90186=mean(ETV_D90186);
std_ETV_D90186=std(ETV_D90186);
med_ETV_D90186=median(ETV_D90186);
iqr_ETV_D90186=iqr(ETV_D90186);

avg_ETV_V9043=mean(ETV_V9043);
std_ETV_V9043=std(ETV_V9043);
med_ETV_V9043=median(ETV_V9043);
iqr_ETV_V9043=iqr(ETV_V9043);
avg_ETV_V90186=mean(ETV_V90186);
std_ETV_V90186=std(ETV_V90186);
med_ETV_V90186=median(ETV_V90186);
iqr_ETV_V90186=iqr(ETV_V90186);

avg_ETV_V10043=mean(ETV_V10043);
std_ETV_V10043=std(ETV_V10043);
med_ETV_V10043=median(ETV_V10043);
iqr_ETV_V10043=iqr(ETV_V10043);
avg_ETV_V100186=mean(ETV_V100186);
std_ETV_V100186=std(ETV_V100186);
med_ETV_V100186=median(ETV_V100186);
iqr_ETV_V100186=iqr(ETV_V100186);

avg_ETV_V15043=mean(ETV_V15043);
std_ETV_V15043=std(ETV_V15043);
med_ETV_V15043=median(ETV_V15043);
iqr_ETV_V15043=iqr(ETV_V15043);
avg_ETV_V150186=mean(ETV_V150186);
std_ETV_V150186=std(ETV_V150186);
med_ETV_V150186=median(ETV_V150186);
iqr_ETV_V150186=iqr(ETV_V150186);

avg_ETV_V20043=mean(ETV_V20043);
std_ETV_V20043=std(ETV_V20043);
med_ETV_V20043=median(ETV_V20043);
iqr_ETV_V20043=iqr(ETV_V20043);
avg_ETV_V200186=mean(ETV_V200186);
std_ETV_V200186=std(ETV_V200186);
med_ETV_V200186=median(ETV_V200186);
iqr_ETV_V200186=iqr(ETV_V200186);

avg_H_D1cc43=mean(H_D1cc43);
std_H_D1cc43=std(H_D1cc43);
med_H_D1cc43=median(H_D1cc43);
iqr_H_D1cc43=iqr(H_D1cc43);
avg_H_D1cc186=mean(H_D1cc186);
std_H_D1cc186=std(H_D1cc186);
med_H_D1cc186=median(H_D1cc186);
iqr_H_D1cc186=iqr(H_D1cc186);

L_V543=L_V543(~isnan(L_V543));
L_V5186=L_V5186(~isnan(L_V5186));
avg_L_V543=mean(L_V543);
std_L_V543=std(L_V543);
med_L_V543=median(L_V543);
iqr_L_V543=iqr(L_V543);
avg_L_V5186=mean(L_V5186);
std_L_V5186=std(L_V5186);
med_L_V5186=median(L_V5186);
iqr_L_V5186=iqr(L_V5186);

avg_R_Dmax43=mean(R_Dmax43);
std_R_Dmax43=std(R_Dmax43);
med_R_Dmax43=median(R_Dmax43);
iqr_R_Dmax43=iqr(R_Dmax43);
avg_R_Dmax186=mean(R_Dmax186);
std_R_Dmax186=std(R_Dmax186);
med_R_Dmax186=median(R_Dmax186);
iqr_R_Dmax186=iqr(R_Dmax186);

avg_S_D02cc43=mean(S_D02cc43);
std_S_D02cc43=std(S_D02cc43);
med_S_D02cc43=median(S_D02cc43);
iqr_S_D02cc43=iqr(S_D02cc43);
avg_S_D02cc186=mean(S_D02cc186);
std_S_D02cc186=std(S_D02cc186);
med_S_D02cc186=median(S_D02cc186);
iqr_S_D02cc186=iqr(S_D02cc186);

avg_S_D05cc43=mean(S_D05cc43);
std_S_D05cc43=std(S_D05cc43);
med_S_D05cc43=median(S_D05cc43);
iqr_S_D05cc43=iqr(S_D05cc43);
avg_S_D05cc186=mean(S_D05cc186);
std_S_D05cc186=std(S_D05cc186);
med_S_D05cc186=median(S_D05cc186);
iqr_S_D05cc186=iqr(S_D05cc186);

avg_S_D1cc43=mean(S_D1cc43);
std_S_D1cc43=std(S_D1cc43);
med_S_D1cc43=median(S_D1cc43);
iqr_S_D1cc43=iqr(S_D1cc43);
avg_S_D1cc186=mean(S_D1cc186);
std_S_D1cc186=std(S_D1cc186);
med_S_D1cc186=median(S_D1cc186);
iqr_S_D1cc186=iqr(S_D1cc186);

%creat table of inf0

headings = ["CTV";"";"";"";"ETV";"";"";"";"";"Breast";"";"Ribs";"Skin";"";"";"Heart";"Lung"];
metrics = ["D90";"V100";"V150";"V200";"D90";"V90";"V100";"V150";"V200";"D1cc";"V150";"Dmax";"D0.2cc";"D0.5cc";"D1cc";"D1cc";"V5"];
avg43 = [avg_CTV_D9043;avg_CTV_V10043;avg_CTV_V15043;avg_CTV_V20043;avg_ETV_D9043;avg_ETV_V9043;avg_ETV_V10043;avg_ETV_V15043;avg_ETV_V20043;avg_B_D1cc43;avg_B_V15043;avg_R_Dmax43;avg_S_D02cc43;avg_S_D05cc43;avg_S_D1cc43;avg_H_D1cc43;avg_L_V543];
std43 = [std_CTV_D9043;std_CTV_V10043;std_CTV_V15043;std_CTV_V20043;std_ETV_D9043;std_ETV_V9043;std_ETV_V10043;std_ETV_V15043;std_ETV_V20043;std_B_D1cc43;std_B_V15043;std_R_Dmax43;std_S_D02cc43;std_S_D05cc43;std_S_D1cc43;std_H_D1cc43;std_L_V543];
med43 = [med_CTV_D9043;med_CTV_V10043;med_CTV_V15043;med_CTV_V20043;med_ETV_D9043;med_ETV_V9043;med_ETV_V10043;med_ETV_V15043;med_ETV_V20043;med_B_D1cc43;med_B_V15043;med_R_Dmax43;med_S_D02cc43;med_S_D05cc43;med_S_D1cc43;med_H_D1cc43;med_L_V543];
avg186 = [avg_CTV_D90186;avg_CTV_V100186;avg_CTV_V150186;avg_CTV_V200186;avg_ETV_D90186;avg_ETV_V90186;avg_ETV_V100186;avg_ETV_V150186;avg_ETV_V200186;avg_B_D1cc186;avg_B_V15043;avg_R_Dmax186;avg_S_D02cc186;avg_S_D05cc186;avg_S_D1cc186;avg_H_D1cc186;avg_L_V5186];
std186 = [std_CTV_D90186;std_CTV_V100186;std_CTV_V150186;std_CTV_V200186;std_ETV_D90186;std_ETV_V90186;std_ETV_V100186;std_ETV_V150186;std_ETV_V200186;std_B_D1cc186;std_B_V15043;std_R_Dmax186;std_S_D02cc186;std_S_D05cc186;std_S_D1cc186;std_H_D1cc186;std_L_V5186];
med186 = [med_CTV_D90186;med_CTV_V100186;med_CTV_V150186;med_CTV_V200186;med_ETV_D90186;med_ETV_V90186;med_ETV_V100186;med_ETV_V150186;med_ETV_V200186;med_B_D1cc186;med_B_V15043;med_R_Dmax186;med_S_D02cc186;med_S_D05cc186;med_S_D1cc186;med_H_D1cc186;med_L_V5186];

T2 = table(headings,metrics,avg43,avg186,std43,std186,med43,med186);
