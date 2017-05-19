FT_SENSOR_MODEL = 'nano43';
A = Generate_Cal_Matrix(FT_SENSOR_MODEL);
%% ---------Probe Transformation Vector-------------------------------------
p_sensor_offset = [0;0;0];
p_cross = [0,-p_sensor_offset(3),p_sensor_offset(2);p_sensor_offset(3),0,-p_sensor_offset(1);-p_sensor_offset(2),p_sensor_offset(1),0];
T = [eye(3),zeros(3,3);p_cross,eye(3)];
inv_T = inv(T);
% R_sensor =   [ 0,-1, 0;...
%               -1, 0, 0;...
%                0, 0,-1]; % Rotation matrix between force sensor and world
% W_limits = [8;8;8;100;100;100]; % Limits of force sensor in [N;N;N;Nmm;Nmm;Nmm]
% fprintf('The Nano17 Force Sensor has been initialized\n');
%
% dead_band_threshold = 0.05; % N
% % FIR Filter for Force
% N_force = 30;
% fir_force_filter_coeffs = ones(N_force,1);
% N_bias = 6000;
% filter_coeffs_bias = ones(N_bias,1);
% N_hi_freq = (dt/dt_sensor)*10;
% filter_coeffs_hi_frequency = ones(N_hi_freq,1);

%% Frame Transformation & safety parameters
switch FT_SENSOR_MODEL
    case 'gamma'
        ATI_torque_Nmm = 1000;
        % a_R_f=[0 0 -1;
        %        0 1 0;
        %        1 0 0]; % force frame in moving platform frame, this was defined
        %        by Jason & Aditya for their experiment for Dremel test
        R_FT2robot = [1 0 0;
            0 -1 0;
            0 0 -1];
        Wrench_max=[300;
            300;
            380;
            3200;
            3200;
            4600];
        SafetyMargin=0.3;
    case 'nano17'
        ATI_torque_Nmm = 1;
        R_FT2robot =[ 1 0 0;
                    0 -1 0;
                    0 0 -1];
        Wrench_max=[25;
            25;
            35;
            400;
            400;
            400];
        SafetyMargin=0.8;
    case 'nano43'
        ATI_torque_Nmm = 1;
        R_FT2robot =[ -1, 0, 0;
                    0, 1,  0;
                    0, 0,  -1];
        Wrench_max=[18;
            18;
            18;
            250;
            250;
            250];
        SafetyMargin=0.8;
end
