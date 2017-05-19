% PARKER_DEPENDENCY
%%  Long Wang, 2014/10/28
%   This func will exclusively setup the denpendency for ParkerXYZ xPC model
%   (Matlab 2014 version).
%   There will be generally two libraries needed for any ARMA robot.
%       1) Embedded Common Library
%       2) Custom robot emebedded library, (e.g. in this case, Embedded_Func_Parker)

%% Path of Model and Base Folder
path_Base = 'C:\Users\arma\Documents\Parker_XYZ_CMU\';
path_Model=[path_Base 'Model'];

%%  Other dependencies
path_Init = [path_Model,'\Init_Func'];
path_Build = [path_Model,'\Build'];

%%  Adding all the path
restoredefaultpath;
addpath(  genpath(path_Init),...
          path_Build);
