% mode 1 homing
% mode 2 joint space
% mode 3 task space
function parkerSetJoint(tg,q_des,tf)
    q_des = q_des(:);
    assert(length(q_des)==3,'incorrect q dimension!');
    if nargin<3
        tf = 5;
    end
    tfID = tg.getparamid('Trajectory Planner/Quintic Polynomial/5th Order Polynomial/tf','Value');
    qID=tg.getparamid('Trajectory Planner/Quintic Polynomial/q_des','Value');
    triggerID = tg.getparamid('Trajectory Planner/Quintic Polynomial/Manual','Value');
    tg.setparam(tfID,tf);
    tg.setparam(qID,q_des);
    % create a rising trigger
    tg.setparam(triggerID,0);
    tg.setparam(triggerID,1);
end