function [tg] = Parker_Initialize(DoHoming)
%%  By Long Wang, 2016/1/20
%   This code will initialize parker, including homing.
if nargin<1
    DoHoming=1;
end
restoredefaultpath;
Model_Path = getenv('PARKERDIR');
root_dir = fileparts(Model_Path);
addpath(genpath(root_dir));
%%  load and initialize the xPC
tg = parkerLoad;

%%  start robot, unbiasing the forse sensor and homing
tg.start;
%   reset (unbias) force sensor
parkerResetFT(tg);
% homing
if DoHoming
    parkerHoming(tg);
end
end