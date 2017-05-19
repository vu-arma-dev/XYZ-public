function  parkerFTFilter_Enable( tg,flag )
%PARKERFTFILTER_ENABLE Summary of this function goes here
%   Detailed explanation goes here
id = tg.getparamid('Force Sensor/filter_sel','Value');
if flag
    tg.setparam(id,1);
else
    tg.setparam(id,0);
end
end

