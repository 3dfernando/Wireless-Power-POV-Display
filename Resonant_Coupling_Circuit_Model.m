clear;clc;close all;
%This simulation explores the following circuit:
%Vin--ZS--C1--(L1-M)--[M//[(L2-M)--[C2//ZL]]]


%Data for the simulation

C1=100e-9; %F
C2=100e-9; %F
L1=6e-6; %H
L2=5.5e-6; %H
k_list=[0.05 0.1 0.2 0.3 0.4 0.5 0.8 1]; %Mutual inductance coupling factors
ZL=20; %Ohm (Load impedance)
ZS=1; %Ohm (Source impedance)

s=tf('s');

for i=1:size(k_list,2)
    k=k_list(i); %for multiple coupling factor plotting
    
    %Impedances of the components
    M=k*(L1*L2)^(0.5);

    Z_C1=1/(s*C1);
    Z_C2=1/(s*C2);
    Z_L1=s*(L1-M);
    Z_L2=s*(L2-M);
    Z_M=s*M;

    %Impedance Association
    ZA=1/(1/Z_C2+1/ZL); %C2//ZL
    ZB=Z_L2+ZA; %ZA--L2
    ZC=1/(1/ZB+1/Z_M); %ZB//M
    Zequiv=ZS+ZC+Z_C1+Z_L1; %ZC--L1--C1

    %Power delivered tf
    VM_on_Vin=1-(Z_C1+Z_L1+ZS)/Zequiv;
    VC2_on_VM=ZA/ZB;
    VC2_on_Vin=VM_on_Vin*VC2_on_VM;
    VS_on_Vin=ZS/Zequiv;

    PL_on_Pin=(VC2_on_Vin^2)*(Zequiv/ZL);
    PS_on_Pin=(VS_on_Vin^2)*(Zequiv/ZS);
    
    %Gets the transfer functions of interest and stores them
    
    [mag, phi, w]=bode(PL_on_Pin);
    [gpeak, fpeak] = getPeakGain(PL_on_Pin);
    
    eta(i).mag=mag;
    eta(i).phi=phi; 
    eta(i).w=w;  
    eta(i).f0=fpeak/(2*pi);
    eta(i).eta_max=gpeak;
end
    

%Plots the transfer functions for each k

f_min=10e3; %Minimum frequency to plot, Hz
f_max=1000e3; %Minimum frequency to plot, Hz

figure; hold on;
for i=1:size(k_list,2)
   plot(squeeze(eta(i).w)/(2*pi),squeeze(eta(i).mag)*100,'color',rand(1,3), 'Displayname', strcat('k=',num2str(k_list(i)),', \eta_{max}=',num2str(100*eta(i).eta_max),'%'));    
end
hold off;
set(gca,'xscale','log');
xlabel('Frequency [Hz]');
ylabel('\eta [%]');
legend('show');
xlim([f_min f_max]);


%Plots the chart k versus eta_max
for i=1:size(k_list,2)
    etaMax(i)=eta(i).eta_max*100;
end

figure;
plot(k_list,etaMax,'b-');
xlabel('k');
ylabel('\eta [%]');



