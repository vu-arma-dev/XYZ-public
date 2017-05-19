function [ mode ] = parkerGetMode( tg )
%%  Mode description
%   1 - Homing
%   2 - Joint Space

modeID=tg.getparamid('Trajectory Planner/Mode','Value');
mode = tg.getparam(modeID);

end

