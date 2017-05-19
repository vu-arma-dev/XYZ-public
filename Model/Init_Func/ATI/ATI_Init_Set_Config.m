function ATI_Init_Set_Config(tg,FT_NAME)
%%  By Long Wang, 2015/7/14
%%  This func will be used to change force sensor settings.
%   With this func, no need to recompile code if you change force sensor.
%   Note that different force sensor, the only different part is the matrix
%   "A"
if nargin<2
    FT_NAME = 'gamma';
end
A = Generate_Cal_Matrix(FT_NAME);
id = tg.getparamid('Sensors/ATI Force Torque Sensor/Calibration Matrix','Value');
tg.setparam(id,A);
id = tg.getparamid('Sensors/ATI Force Torque Sensor/ATI_torque_convert_to_Nmm','Gain');
switch FT_NAME
    case 'gamma'
        tg.setparam(id,1000);
    case 'nano17'
        tg.setparam(id,1);
end
end

