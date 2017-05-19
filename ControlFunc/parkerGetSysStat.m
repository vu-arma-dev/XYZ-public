function FlagValue = parkerGetSysStat(tg,FlagName)
%%  By Long Wang
%   This function will fetch the Flag current value as requested.
%   The order in system status flags are:
%   1 - Homing
%   2 - Enc_Reset
%   3 - mode
%   4 - QuinticMoving
%   5 - Error
%   6 - FT_Reset

switch FlagName
    case 'Homing'
        id = tg.getsignalid('Scopes/sys_stat/s1');
    case 'Enc'
        id = tg.getsignalid('Scopes/sys_stat/s2');
    case 'mode'
        id = tg.getsignalid('Scopes/sys_stat/s3');
    case 'Quintic'
        id = tg.getsignalid('Scopes/sys_stat/s4');
    case 'Error'
        id = tg.getsignalid('Scopes/sys_stat/s5');
    case 'FT_Reset'
        id = tg.getsignalid('Scopes/sys_stat/s6');
end
FlagValue = tg.getsignal(id);
end

