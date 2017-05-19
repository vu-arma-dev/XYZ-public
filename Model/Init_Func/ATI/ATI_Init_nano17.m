%--------Generate the Calibration Matrix A---------------------------------
A = Generate_Cal_Matrix('nano17');
%---------Probe Transformation Vector-------------------------------------
% p = [0;0;.045];                    % See ATI_Force_Sensor_NotesV2_0 for explanation of transform
p = [0;0;0];                 
p_cross = [0,-p(3),p(2);p(3),0,-p(1);-p(2),p(1),0];
T = [eye(3),zeros(3,3);p_cross,eye(3)];
inv_T = inv(T);
%--------Filter Initialization---------------------------------------------
N_ATI = 40;
filter_coeffs_ATI = ones(N_ATI,1);
N_ATI_bias = 6000;
filter_coeffs_ATI_bias = ones(N_ATI_bias,1);
fprintf('The ATI nano17 sensor model has been initialized\n');
ATI_torque_convert_to_Nmm = 1;