% Rashid Yasin
% June 10 2016

% This function saves a MAT file from filescope data on the target
% The save folder is Parker_XYZ/Data/FileScope

% Usage:
% saveMatfiles('toSave','fname1.dat','fname2.dat','name3.dat',...)
% where 'toSave' is a suffix on the save data filenames
% 'fname#.dat' represents the name of the dat file saved on the target as
% specified within the model

% Any number of files can be saved at the same time
% Or call saveMatfiles and you will be prompted for both savename and the
% filename on the target

function saveMATfiles(varargin)
%% Set file path for saving
root_dir='C:\Users\arma\Documents\Parker_XYZ_CMU';
SavePath = [root_dir,'/Data/FileScope/'];

%%  input
if nargin<2
    expname = input('Pick an experiment name:(e.g. exp1)','s');
    filenames{1} = input('Give the dat file:(e.g. PC_001)','s');
    Nfile=1;
else
    expname= varargin{1};
    filenames=varargin(2:end);
    Nfile=numel(varargin)-1;
end

for i=1:Nfile
    % Extract the data from the target
    f=SimulinkRealTime.fileSystem;
    h=fopen(f,[filenames{i} '.dat']);
    rawdata=fread(f,h);
    f.fclose(h);

    DATA=SimulinkRealTime.utils.getFileScopeData(rawdata).data;
    
    loc=strfind(filenames{i},'_');
    title=filenames{i}(1:loc-1);

    switch title
        case 'CUR'
            CUR.mode = DATA(:,1);
            CUR.P = DATA(:,2:4);
            CUR.PD = DATA(:,5:7);
            CUR.PDD = DATA(:,8:10);
            CUR.sysT = DATA(:,11);
            save([SavePath,'CUR_',expname],'CUR');
        case 'DES'
            DES.mode = DATA(:,1);
            DES.P = DATA(:,2:4);
            DES.PD = DATA(:,5:7);
            DES.PDD = DATA(:,8:10);
            DES.sysT = DATA(:,11);
            save([SavePath,'DES_',expname],'DES');
        case 'WE'
            WE.mode = DATA(:,1);
            WE.F = DATA(:,2:4);
            WE.M = DATA(:,5:7);
            WE.sysT = DATA(:,8);
            save([SavePath,'WE_',expname],'WE');
        case 'PC'
            PC.pos=DATA(:,1:3);
            PC.vel=DATA(:,1:3);
            PC.acc=DATA(:,1:3);
            PC.sysT=DATA(:,end);
            save([SavePath,'PC_',expname],'PC');
        case 'FT'
            FT.F=DATA(:,1:3);
            FT.T=DATA(:,4:6);
            FT.sysT=DATA(:,end);
            save([SavePath,'FT_',expname],'FT');
    end
    
end