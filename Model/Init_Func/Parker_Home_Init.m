%% Initialization parameters for homing procedures
%   Long Wang, Jason Pile, 2014/08/06
STROKE = 205;   % this is valid for all three axis, the exact stroke will be slightly larger than this and varies among three axes.
HomingZeroMode = 'JHU';
% Based on different experiment, different robot world zeros are defined.

switch HomingZeroMode 
    case 'CMU'
        HOMING_dx = [-100;-100;-100]; % the relative desired displacement after reaching limit switches
    case 'JHU'
        HOMING_dx = [-100;-100;-55]; % the relative desired displacement after reaching limit switches
end
JOINT_Limits_Postive = - HOMING_dx;
JOINT_Limits_Negative = -(STROKE + HOMING_dx);
HOMING_num_joint= 3; % the number of actuation joints
HOMING_tspan = 10; % time (sec) to plan a 5th order poly to achieve the relative desired displacement after reaching all limit swithces.
HOMING_Vmov = [5;5;5]; % velocities (mm/sec) of each axis when reaching limit switches