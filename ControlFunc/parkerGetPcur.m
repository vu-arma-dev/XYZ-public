function [ p_cur] = parkerGetPcur( tg )
p_cur = zeros(3,1);
for i=1:3
id = tg.getsignalid(['Parker 404XR/Count to Position/Add/s',num2str(i)]);
p_cur(i) = tg.getsignal(id);
end
end

