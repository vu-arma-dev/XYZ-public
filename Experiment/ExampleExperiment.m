function ExampleExperiment(case_id)
if nargin<1
    case_id = 1;
end
%%  This func will execute the experiment using Parker
%%  All the paths
model_path = getenv('PARKERDIR');
root_dir = fileparts(model_path);
SavePath = [root_dir,'/Data/'];
%%  Initialize the robot
tg = Parker_Initialize;
%%  Friction experiment
%   experiment parameters
%   all vectors are in column format
distance_move = 25; %   the travel distance in XY plane, unit mm
direction_move = [-1;0]; %   the moving direction in XY plane planned
direction_move = normc(direction_move);
switch case_id
    case 1  % silicone material, no lubrication
        p_start_above  = [14.7525;-71.4375;-95.6250];%   the reference point above the testing surface
        p_start = [14.7525;-71.4375;-106.4075];       %   the starting point interacting with the surface, roughly give 0.5N force.
    case 2  % silicone material, sticky tape
        p_start_above  = [14.7525;-84.4675;-92.4175];%   the reference point above the testing surface
        p_start = [14.7525;-84.4675;-106.4400];       %   the starting point interacting with the surface, roughly give 0.5N force.     
    case 3  % silicone material, lubrication
        p_start_above  = [15.4975;-52.9575;-83.3150];%   the reference point above the testing surface
        p_start = [15.4975;-52.9575;-106.4175];       %   the starting point interacting with the surface, roughly give 0.5N force.     
end
p_end = p_start + [direction_move*distance_move;0];
p_end_above = [p_end(1:2);p_start_above(3)];
%%  Step 1 - Moving the robot to a point above the surface
parkerSetMode(tg,2);    % set the mode to joint space control
fprintf('Step 1: Moving the robot to a point above the surface\n');
p_cur = parkerGetPcur(tg);
moving_speed = 20;
tf = norm(p_cur-p_start_above)/moving_speed;
if tf<0.5
    tf = 0.5;
end
parkerGoto(tg,p_start_above,tf);
%%  Step 2 - Moving the robot to starting point on surface
parkerSetMode(tg,2);    % set the mode to joint space control
fprintf('Step 2: Moving the robot to starting point on surface\n');
p_cur = parkerGetPcur(tg);
moving_speed = 5;
tf = norm(p_cur-p_start)/moving_speed;
if tf<0.5
    tf = 0.5;
end
parkerGoto(tg,p_start,tf);
%%  Step 3 - Moving the robot to end point while collecting data in file scope
parkerSetMode(tg,2);    % set the mode to joint space control
parkerEnableDynFileScope(tg);   % turn on the file scope recording
fprintf('Step 3: Moving the robot to end point while collecting data in file scope\n');
p_cur = parkerGetPcur(tg);
moving_speed = 2;
tf = norm(p_cur-p_end)/moving_speed;
if tf<0.5
    tf = 0.5;
end
parkerGoto(tg,p_end,tf);
%%  Step 4 - Moving the robot to a point above the end point
parkerSetMode(tg,2);    % set the mode to joint space control
parkerEnableDynFileScope(tg,0);   % turn on the file scope recording
fprintf('Step 4 - Moving the robot to a point above the end point\n');
p_cur = parkerGetPcur(tg);
moving_speed = 5;
tf = norm(p_cur-p_end_above)/moving_speed;
if tf<0.5
    tf = 0.5;
end
parkerGoto(tg,p_end_above,tf);
%%  Step 5 - Stop and download
tg.stop;
% The below code is deprecated - use the function saveMATfiles instead

% % expname = input('Give a name for this experiment:','s');
% % parkerDownloadFSCData('ExpName',expname,'VarName','CUR_001');
% % parkerDownloadFSCData('ExpName',expname,'VarName','DES_001');
% % parkerDownloadFSCData('ExpName',expname,'VarName','WE_001');
% % ProcessDATfiles('ExpName',expname,'FolderPath',[SavePath,'\DynFileScope']);

end

