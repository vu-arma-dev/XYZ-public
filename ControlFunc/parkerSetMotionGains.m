function parkerSetMotionGains( tg,GainName,SetValue)
switch GainName
    case 'Kp'
        ID = tg.getparamid('','Kp');
    case 'Kd'
        ID = tg.getparamid('','Kd');        
    otherwise
        ID = [];
end
if length(SetValue)==3
    K = diag(SetValue);
else
    K = SetValue*eye(3);
end
tg.setparam(ID,K);
end

