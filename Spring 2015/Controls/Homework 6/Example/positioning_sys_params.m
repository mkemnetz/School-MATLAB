%% Evaluation of positioning system design example
 
P = zpk([-2 -100 roots([1 7.108 1263])'], [0 -4 -43 -43 roots([1 12 1600])'], 700);

 lead_zero = -115;   % rad/sec
 lead_pole = -914;  % rad/sec
 lead_k = 46*lead_pole/lead_zero; % N/rad
 
 act_limit = 10;    % V
 noise_amp = 0; %0.005;   % mm
 noise_freq = 300*2*pi; % rad/sec
 
 %% Run code
 
 load Reference.mat
 time = 0.001:0.001:2;
 Ref = sm_step(1751:3750);
 
 sim pos_sys_model
 
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