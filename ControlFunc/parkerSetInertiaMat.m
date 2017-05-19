function [ B] = parkerSetInertiaMat( tg )
id = tg.getparamid('','B');
[B,~] = parkerCalInertiaGrav;
tg.setparam(id,B);
end

