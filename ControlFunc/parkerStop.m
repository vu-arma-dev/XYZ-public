function parkerStop( )
%PARKERSTOP Summary of this function goes here
%   Detailed explanation goes here
address = '192.168.1.167';
port = '22222';
parker = xpc('TcpIp',address,port);
parker.stop;

end

