function [wrench] = parkerGetForceSensor(tg,option)
%PARKERSETFORCEGAINS Summary of this function goes here
%   Detailed explanation goes here
if nargin>1
    if strcmp(option,'average')
        N = 80;
        T = 0.08;
        WRENCH = zeros(6,N);
        fprintf('Collecting samples every %d seconds and averaging ...\n',T);
        reverseStr = [];
        for i = 1:N
            WRENCH(:,i) = parkerGetForceSensor(tg);
            msg = sprintf('%d  samples collected ... ',i);
            fprintf([reverseStr, msg]);
            reverseStr = repmat(sprintf('\b'), 1, length(msg));
            pause(T);
        end
        wrench = mean(WRENCH,2);
        fprintf('.. [ok].')
    else
        wrench = parkerGetForceSensor(tg);
    end
else
    %% read the current force
    % force
    force = zeros(3,1);
    for i = 1:3
        id = tg.getsignalid(['Force Sensor/force/s',num2str(i)]);
        force(i,1) = tg.getsignal(id);
    end
    % moment
    moment = zeros(3,1);
    for i = 1:3
        id = tg.getsignalid(['Force Sensor/moment/s',num2str(i)]);
        moment(i,1) = tg.getsignal(id);
    end
    wrench = [force;moment];
end
end