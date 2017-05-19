function parkerResetFT(tg)
%%  By Long Wang, 2014
if nargin<1
    tg = parkerLoad('no_load');
end
ID=tg.getparamid('Force Sensor/reset','Value');
tg.setparam(ID,0);
tg.setparam(ID,1);
% unbias forse sensor
fprintf('Force Sensor is being unbiased ... \n');
reverseStr = [];
fprintf('Processing time:')
tStart = tic;
while parkerGetSysStat(tg,'FT_Reset')==1
    processtime = toc(tStart);
    msg = sprintf('%.2f second ... ',processtime);
    fprintf([reverseStr, msg]);
    reverseStr = repmat(sprintf('\b'), 1, length(msg));
end
fprintf(' [ok].\n');
end