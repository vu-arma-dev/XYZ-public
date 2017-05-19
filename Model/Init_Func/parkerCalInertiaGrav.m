function [ B,grav_vector ] = parkerCalInertiaGrav()
%%  By Long Wang, 2015/3/8
%   This func give the ease to adjust the inertia matrix experimentally
loading_mass = 0.7582; % unit in kg
%   this "loading_mass = 0.7582" has been used since ICRA15', up till the meat scan on
%   7/10
mx = 2.271569e-1 + 2*3.6 + 2*0.34 + 3.3435 + loading_mass ;
my = 2.271569e-1 + 3.6 + 3.3435 + loading_mass ;
mz = 2.271569e-1 + loading_mass; % used with 25x25 al profile
pitch = 5e-3/(2*pi); % m/rad
Im = 2.4e-5; % Kgm^2 (input inertia of each stage)
B_nominal = [ mx + Im/pitch^2,                    0,             0
    0, my + Im/pitch^2,             0
    0,                    0,   mz + Im/pitch^2];
B_correction = diag([0,-8,0]);
B = B_nominal + B_correction;
grav_vector = [0;0;-9.81*mz];
end

