function MAKE_PARKER()
current_dir = pwd;
PARKER_DEPENDENCY;

cfg = Simulink.fileGenControl('getConfig');
cfg.CacheFolder = path_Build;
cfg.CodeGenFolder = path_Build;
Simulink.fileGenControl('setConfig', 'config', cfg);   

cd(path_Model);
fprintf('Start to build model.\n');
slbuild('slrt_parker');
cd(current_dir);
end

