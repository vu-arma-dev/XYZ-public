function parkerDisableMotors( tg )
id = tg.getparamid('Motor Enable Subsystem/Enable Motors','Value');
tg.setparam(id,[0 0 0]);

end

