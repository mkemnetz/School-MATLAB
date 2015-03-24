%%
close all;
clear all;
clc;
%%
load('plant.mat');

%%
zero = [-3,-22] ;   % rad/sec
pole = [-600, -1];  % rad/sec
k = 1025*((pole(1)*pole(2))/(zero(1)*zero(2))); % N/rad

act_limit = 60;    % V
noise_amp = 0; %0.005;   % mm
noise_freq = 300*2*pi; % rad/sec

%% Run code
time = 0.001:0.001:2;
Ref = generateTriangeWave(time, 1/2, 3);

sim motor_model

% output plot
figure(1)
plot(data_out(:,1), data_out(:,2),'k--', data_out(:,1), data_out(:,3),'b-', 'LineWidth', 1.5)
xlabel ('Time [sec]')
ylabel ('x(t) [mm]')
legend ('x_d(t)','x(t)')

% input plot
figure(2)
plot(data_out(:,1), data_out(:,5),'b-', 'LineWidth', 1.5)
xlabel ('Time [sec]')
ylabel ('V(t) [V]')

% error plot
figure(3)
plot(data_out(:,1), data_out(:,4),'b-', data_out(:,1), data_out(:,2)-data_out(:,3), 'r-', 'LineWidth', 1.5)
xlabel ('Time [sec]')
ylabel ('e(t) [mm]')
legend ('e_m_e_a_s','e_a_c_t')