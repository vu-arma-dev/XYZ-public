% Turns on and off manual recording of force/torque and position data

function switchFileRec(target)
fileSwitchId=target.getparamid('Scopes/FT_File_scope','Value');

curVal=target.getparam(fileSwitchId);
if curVal==0
    target.setparam(fileSwitchId,1);
else
    target.setparam(fileSwitchId,0);
end
end