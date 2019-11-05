%% Calibration Data set analysis
clc
clear all
close all

format long
t1=[0:10:120 150:30:420];
phi1=[0.89602 0.82296 0.78869 0.80028 0.76673 0.79029 0.89339 0.77834 0.78821 0.74628 0.73956 0.75348 0.75816 0.75154 0.71044 0.63008 0.63287 0.55477 0.53964 0.51193 0.53160 0.53445 0.51295];
amp1=[1.0434  1.02400 1.04460 1.06860 1.06280 1.02720 1.01260 1.06530 1.05610 1.05080 0.99420 0.99297 0.97732 0.98209 0.99365 0.99098 0.98462 0.98311 0.98084 0.98523 0.99883 0.96526 0.96715];
phi2=[-1.9098 -1.8605 -1.7651 -1.7643 -1.8078 -1.7426 -1.7092 -1.6949 -1.6601 -1.7373 -1.7417 -1.7455 -1.6992 -1.6640 -1.6869 -1.7315 -1.8286 -1.8583 -1.8609 -1.8453 -1.8172 -1.7850 -1.8666];
amp2=[1.1217  1.09980 1.10270 1.10800 1.09270 1.09780 1.11870 1.09530 1.09940 1.08870 1.12280 1.11580 1.11970 1.12760 1.13190 1.12200 1.08880 1.11760 1.10970 1.11760 1.12870 1.10660 1.11480];
phi3=[1.65072 1.79460 2.01940 2.15890 2.11920 2.26160 2.24190 2.25280 2.32150 2.21660 2.26990 2.21640 2.24770 2.23180 2.25150 2.30280 2.32750 2.36410 2.37090 2.44530 2.45550 2.40510 2.48810];
amp3=[0.98342 0.96214 0.95221 0.97062 0.94817 0.95679 0.96657 0.96796 0.96155 0.96202 0.97677 0.96273 0.96246 0.94462 0.96980 0.96821 0.94871 0.96943 0.96609 0.95524 0.95342 0.94715 0.96129];

%% fig 1- smoothed: 0 to 420
plot(t1,smooth(phi1),'-or','linewidth',2)
axis([0 430 -pi pi])
hold on
plot(t1,smooth(phi2),'-vm','linewidth',2)
hold on
plot(t1,smooth(phi3),'-sb','linewidth',2)
legend('\phi_1','\phi_2','\phi_3')

xlabel('time (min)')
ylabel('Angle (rad)')
grid on
title('Smoothed: 0 to 420 min')

%% figure 2- original: 0 to 420;
figure

plot(t1,phi1,'-or','linewidth',2)
axis([0 430 -pi pi])
hold on
plot(t1,phi2,'-vm','linewidth',2)
hold on
plot(t1,phi3,'-sb','linewidth',2)
legend('\phi_1','\phi_2','\phi_3')

xlabel('time (min)')
ylabel('Angle (rad)')
grid on
title('Original: 0 to 420 min')

%% figure 3- the first houre is ignored and smoothed
ph1=phi1(8:end);ph2=phi2(8:end);ph3=phi3(8:end);
am1=amp1(8:end);am2=amp2(8:end);am3=amp3(8:end);
t2=t1(8:end)-60;
figure
plot(t2,smooth(ph1),'-or','linewidth',2)
axis([10 360 -pi pi])
hold on
plot(t2,smooth(ph2),'-vm','linewidth',2)
hold on
plot(t2,smooth(ph3),'-sb','linewidth',2)
legend('\phi_1','\phi_2','\phi_3')

xlabel('time (min)')
ylabel('Angle (rad)')
grid on
title('smoothed: 70 to 420 min')
%% figure 4-the first houre is ignored and original
figure
plot(t2,ph1,'-or','linewidth',2)
axis([10 360 -pi pi])
hold on
plot(t2,ph2,'-vm','linewidth',2)
hold on
plot(t2,ph3,'-sb','linewidth',2)
legend('\phi_1','\phi_2','\phi_3')

xlabel('time (min)')
ylabel('Angle (rad)')
grid on
title('original: 70 to 420 min')

% figure 5- original: ampltude in time

figure

plot(t1,amp1,'-or','linewidth',2)
axis([0 430 0 1.5])
hold on
plot(t1,amp2,'-vm','linewidth',2)
hold on
plot(t1,amp3,'-sb','linewidth',2)
legend('Mag_1','Mag_2','Mag_3')

xlabel('time (min)')
ylabel('Magnitude')
grid on
title('Original: 0 to 420 min')

% figure 6- smoothed and ignored : 70 to 420
figure
plot(t2,smooth(am1),'-or','linewidth',2)
axis([0 370 0 1.5])
hold on
plot(t2,smooth(am2),'-vm','linewidth',2)
hold on
plot(t2,smooth(am3),'-sb','linewidth',2)
legend('Mag_1','Mag_2','Mag_3')

xlabel('time (min)')
ylabel('Magnitude')
grid on
title('Smoothed and Ignored: 0 to 420 min')

figure

plot(t2,am1,'-or','linewidth',2)
axis([0 370 0 1.5])
hold on
plot(t2,am2,'-vm','linewidth',2)
hold on
plot(t2,am3,'-sb','linewidth',2)
legend('Mag_1','Mag_2','Mag_3')

xlabel('time (min)')
ylabel('Magnitude')
grid on
title('Original and ignored: 70 to 420 min')
%% Polar plane
antenna1=am1.*cos(ph1)+1j*am1.*sin(ph1);
antenna2=am1.*cos(ph2)+1j*am2.*sin(ph2);
antenna3=am3.*cos(ph3)+1j*am3.*sin(ph3);
avg=[mean(antenna1) mean(antenna2) mean(antenna3)];
figure
plot(real(antenna1),imag(antenna1),'or','linewidth',1)
axis([-1.5 1.5 -1.5 1.5])
hold on
plot(real(antenna2),imag(antenna2),'om','linewidth',1)
hold on
plot(real(antenna3),imag(antenna3),'ob','linewidth',1)
%plot(avg,'^k','linewidth',3)
legend('Antenna 1','Antenna 2','Antenna 3')%,'Average Coefficient')
title('Original-Distribution of coefficient in polar plane')
%% smoothed
a1=smooth(am1);a2=smooth(am2);a3=smooth(am3);
p1=smooth(ph1);p2=smooth(ph2);p3=smooth(ph3);
antenna1=a1.*cos(p1)+1j*a1.*sin(p1);
antenna2=a1.*cos(p2)+1j*a2.*sin(p2);
antenna3=a3.*cos(p3)+1j*a3.*sin(p3);
figure
plot(real(antenna1),imag(antenna1),'or','linewidth',1)
axis([-1 1 -1.2 1])
hold on
plot(real(antenna2),imag(antenna2),'om','linewidth',1)
hold on
plot(real(antenna3),imag(antenna3),'ob','linewidth',1)
legend('Antenna 1','Antenna 2','Antenna 3')
title('smoothed-Distribution of coefficient in polar plane')

var(ph1)
var(ph2)
var(ph3)
