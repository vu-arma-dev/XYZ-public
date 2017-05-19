function parkerHoming(tg)
%%  By Long Wang, 2016/2/9
%   This func does only swithing mode and some screen print
if nargin<1
    tg = parkerLoad('no_load');
end
if parkerGetMode(tg)==1 % means already homed
    parkerSetMode(tg,2); % if want to force home again, need to switch to other modes first
end
parkerSetMode(tg,1); % change mode to 1 - "homing"
fprintf('Robot is homing ... \n');
reverseStr = [];
fprintf('Processing time:')
tStart = tic;
while parkerGetSysStat(tg,'Homing')~=4
    processtime = toc(tStart);
    msg = sprintf('%.2f second ... homing stage %.0f ...',processtime,parkerGetSysStat(tg,'Homing'));
    fprintf([reverseStr, msg]);
    reverseStr = repmat(sprintf('\b'), 1, length(msg));
end
fprintf(' [ok].\n');
end

