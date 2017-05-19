function success = parkerGoto(tg,position,tf)
%%  By Long Wang, 2015/7/31
%   this function will command parker to do "Goto" using quintic polynomial
%   The only difference from parkerSetJoint is that this func is synced
%   with host command line.
%%  check if there is system error before running
if parkerGetSysStat(tg,'Error')
    fprintf('System error occured before running "goto", please check the error while the control is locked!\n');
    pause;
end

%%  Run the "Go to"
parkerSetJoint(tg,position(:),tf);
tStart = tic;
reverseStr = [];
fprintf('Robot is moving to [%.3f,%.3f,%.3f] \n',position(:)');
fprintf('Processing time:')
processtime = toc(tStart);
while parkerGetSysStat(tg,'Quintic')||(processtime<tf)
    processtime = toc(tStart);
    msg = sprintf('%.2f second ... ',processtime);
    fprintf([reverseStr, msg]);
    reverseStr = repmat(sprintf('\b'), 1, length(msg));
end
fprintf('[ok].\n');

%% Check if there is system error after set the go
if parkerGetSysStat(tg,'Error')
    fprintf('System error occured after running "goto", please check the error while the control is locked!\n');
    pause;
end

end

