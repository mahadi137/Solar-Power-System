% Script corresponding to the Part 4 of the exercise
clear all
clc
close all

% Load the radiation measurements
load radiation_measurements.mat
% Load the temperature measurements
load temperature_measurements.mat

% Calculate the numerial vector containing the time data
time_num = datenum(time,'yyyy-mm-dd HH:MM:SS.FFF');

% Create the time vector from 13:00 to 14:00
xt1 = '2011-07-27 13:00:00';
xt2 = '2011-07-27 14:00:00';
xt1 = datenum(xt1,'yyyy-mm-dd HH:MM:SS');
xt2 = datenum(xt2,'yyyy-mm-dd HH:MM:SS');
% Increment of 1 second between values
dt = 1.1574e-05;
time_vector = (xt1:dt:xt2)';
sec_vector = (0:1:length(time_vector)-1)';
% Obtain the irradiance and temperature measurements corresponding to the
% time vector
G19 = interp1(time_num,splite2_19,time_vector);
T19 = interp1(time_num,pt100_19,time_vector);

% Plot the irradiance profile and module temperature measured by sensor 
% pair 3 between 13:00 and 14:00
figure(1);
plot(sec_vector,G19);
xlim([0 3600]);
ylim([0 1200]);
legend('G19');
grid on;
xlabel('Time (s)');
ylabel('Irradiance (W/m^2)');

figure(2);
plot(sec_vector,T19);
xlim([0 3600])
ylim([35 70]);
legend('T19');
grid on;
xlabel('Time (s)');
ylabel('Module temperature (^{o}C)');

% Obtain the simulation vector to use as input in the Simulink model
G_input = [sec_vector G19];
Time_vector = sec_vector;

clear time dt time_num time_vector x* s* p* c* hmp155_t