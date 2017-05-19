% mode 1 homing
% mode 2 joint space
% mode 3 task space
function parkerSetMode(tg,mode)
    modeID=tg.getparamid('Trajectory Planner/Mode','Value');
    tg.setparam(modeID,mode);
    switch mode
        case 1
%             fprintf('Homing Mode started.');
        case 2
%             fprintf('Quintic Joint Mode started.');
    end
end