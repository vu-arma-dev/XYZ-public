function [Kp,Kd] = parkerGetMotionGains( tg)
KpID = tg.getparamid('','Kp');
KdID = tg.getparamid('','Kd');        
Kp = diag(tg.getparam(KpID));
Kd = diag(tg.getparam(KdID));
end

