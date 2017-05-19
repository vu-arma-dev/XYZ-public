% This M-file generates the initialized data for the Parker Linear Stage

%Created on 09/17/2008 by Roger Goldman
clc
clear all
%----------Target Sample Time----------------------------------------------
dt = 0.001; % main control loop sampling rate
dts = 0.001; % 5 kHz force sensor sampling rate
dt_ENC = 0.001; % 10 KHz

%%  Resolved Rate Algorithm
position_epsilon = 0.05; % [mm]
Vmax = 50; % [mm/s]
Vmin = 2; % [m/s]
lin_vel_scale = 20; %lambda, this value must > 1
orientation_epsilon = 0.5*pi/180; %rad
OmegaMax = 90*pi/180;   %rad/s
OmegaMin = 1*pi/180;   %rad/s
ang_vel_scale = 3; %lambda
ResRateVelLimits = [Vmin;Vmax;OmegaMin;OmegaMax];
ResRateVelRatios = [lin_vel_scale;ang_vel_scale];
ResRateEpsilon = [position_epsilon;orientation_epsilon];

%% Controller Parameters

%----------PID Control Gains-----------------------------------------------
Kp = diag([10000,10000,20000]);
Kd = diag([0.1,0.1,5]);

%----------Velocity Filter-------------------------------------------------
N_velocity = 6*dt/dt_ENC; %
vel_filter_coeffs = ones(N_velocity,1); %weights of position data points

N_obs_velocity = 6; %
vel_obs_filter_coeffs = ones(N_obs_velocity,1);

N_acceleration = 6 ; %
accel_filter_coeffs = ones(N_acceleration,1); %weights of position data points

N_ENC_obs_filter = 1*dt/dt_ENC; %
ENC_obs_filter_coeffs = ones(N_ENC_obs_filter,1); %weights of position data points

% used to calculate filter velocity
%----------Counter Offset--------------------------------------------------
counter_offset = 2147483647;
quadrature_mode = 4;
encoder_counts = 500;

%% Break Away Feedforawrd
break_away = diag([2.3,-1.5,0.5]);

%% Motor Torque Constant
torque_constant = 1/0.0525; % Amp/Nm

%% Inertia Matrix & Gravitation Vector
[B,grav_vector] = parkerCalInertiaGrav;

%% Viscous friction
F=diag([200,200,200])/1000; %Nmsec

%% Feedforward
feed_forward = diag([3,-3,3]);

%----------Linear Stage----------------------------------------------------
screw_pitch = 5;      % 5mm/rotation
pitch = (screw_pitch/1000)/(2*pi); % m/rad

%----------Motor Enable Switches-------------------------------------------
%  Set Enables to 1 to have the switches start on program start
Enable_Ch1 = 1;
Enable_Ch2 = 1;
Enable_Ch3 = 1;

%%
% % % CNT_bus = [3 6];
% % % MC_bus = [3 7];
%%
%------Start Configuration------------------------------------------
start_vec = [0;0;0];


fprintf('The Parker XYZ Stage has been initialized!\n');

%--------Filter Initialization---------------------------------------------
N = 25; % 25 ms @ 1 kHz
filter_coeffs = ones(N,1);
N_bias = 1000; % 1 ms @ 1 kHz
filter_coeffs_bias = ones(N_bias,1);
FT_unbias_time = 2; % the averaging filter needs only 1 sec
% Filter design (butterworth)
ftOrder=5;
ftCutoff=200; % frequency cutoff (Hz)
ftFreq=1/dts;
ftWn=2*ftCutoff/ftFreq; % normalized frequency cutoff, between 0 and 1 where 1 is Nyquist i.e. 1/(2*dt)
[z,p,k]=butter(ftOrder,ftWn,'low');
[ftsos,ftg] = zp2sos(z,p,k);
ftHd = dfilt.df2tsos(ftsos,ftg);   % Create a dfilt object
[ftFilterNumerator,ftFilterDenominator]=zp2tf(z,p,k);
