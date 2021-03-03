% Script corresponding to the Part 5 of the exercise
clear all
clc
close all

% Load the radiation measurements
load radiation_measurements.mat
% Load the temperature measurements
load temperature_measurements.mat

% Calculate the numerial vector containing the time data
time_num = datenum(time,'yyyy-mm-dd HH:MM:SS.FFF');

% Create the time vector from 13:15h to 13:25h
xt1 = '2011-07-27 13:15:00';
xt2 = '2011-07-27 13:25:00';
xt1 = datenum(xt1,'yyyy-mm-dd HH:MM:SS');
xt2 = datenum(xt2,'yyyy-mm-dd HH:MM:SS');
% Increment of 1 second between values
dt = 1.1574e-05;
time_vector = (xt1:dt:xt2)';
sec_vector = (0:1:length(time_vector)-1)';
% Obtain the irradiance and temperature measurements corresponding to the
% time vector
G9 = interp1(time_num,splite2_9,time_vector);
G10 = interp1(time_num,splite2_10,time_vector);
G11 = interp1(time_num,splite2_11,time_vector);
G12 = interp1(time_num,splite2_12,time_vector);
T9 = interp1(time_num,pt100_9,time_vector);
T10 = interp1(time_num,pt100_10,time_vector);
T11 = interp1(time_num,pt100_11,time_vector);
T12 = interp1(time_num,pt100_12,time_vector);

% Plot the irradiance profile and module temperature measured by sensor 
% pair 3 between 13:15 and 13:25
figure(1);
plot(sec_vector,G9,sec_vector,G10,sec_vector,G11,sec_vector,G12);
xlim([0 600]);
ylim([0 1200]);
legend('G_{S9}','G_{S10}','G_{S11}','G_{S12}','Location','NorthWest');
grid on;
xlabel('Time (s)');
ylabel('Irradiance (W/m^2)');

figure(2);
plot(sec_vector,T9,sec_vector,T10,sec_vector,T11,sec_vector,T12);
xlim([0 600])
ylim([30 60]);
legend('T_{S9}','T_{S10}','T_{S11}','T_{S12}','Location','NorthWest');
grid on;
xlabel('Time (s)');
ylabel('Module temperature (^{o}C)');

% Temperatures in Kelvin
T9 = T9+273.15;
T10 = T10+273.15;
T11 = T11+273.15;
T12 = T12+273.15;

% Linear interpolation of the irradiance and module temperature
% measurements
g1 = G9;
g2 = (G9+G10)./2;
g3 = G10;
g4 = G11;
g5 = G11+(G12-G11)./9.*1.5;
g6 = G11+(G12-G11)./9.*3.0;
g7 = G11+(G12-G11)./9.*4.5;
g8 = G11+(G12-G11)./9.*6.0;
g9 = G11+(G12-G11)./9.*7.5;
g10 = G12;
t1 = T9;
t2 = (T9+T10)./2;
t3 = T10;
t4 = T11;
t5 = T11+(T12-T11)./9.*1.5;
t6 = T11+(T12-T11)./9.*3.0;
t7 = T11+(T12-T11)./9.*4.5;
t8 = T11+(T12-T11)./9.*6.0;
t9 = T11+(T12-T11)./9.*7.5;
t10 = T12;

% Obtain the simulation vectors to use as input in the Simulink model
SimG1 = [sec_vector g1];
SimG2 = [sec_vector g2];
SimG3 = [sec_vector g3];
SimG4 = [sec_vector g4];
SimG5 = [sec_vector g5];
SimG6 = [sec_vector g6];
SimG7 = [sec_vector g7];
SimG8 = [sec_vector g8];
SimG9 = [sec_vector g9];
SimG10 = [sec_vector g10];
SimT1 = [sec_vector t1];
SimT2 = [sec_vector t2];
SimT3 = [sec_vector t3];
SimT4 = [sec_vector t4];
SimT5 = [sec_vector t5];
SimT6 = [sec_vector t6];
SimT7 = [sec_vector t7];
SimT8 = [sec_vector t8];
SimT9 = [sec_vector t9];
SimT10 = [sec_vector t10];

clear g* t* s* p* c* dt G* T* *d x* h*