function [ B] = parkerGetInertiaMat( tg )
id = tg.getparamid('','B');
B = tg.getparam(id);
end

