function A = Generate_Cal_Matrix(FT_SENSOR_MODEL)
% Generate Cal Matrix Creates the Calibration Matrix from the supplied
% information in the calibration file. Note this method of parsing is
% explicitly unsupported by ATI.

% The calibration method is generated as follows:
% 1. Temporary Matrix B created by the individual rows of the calibration matrix are divided by the scale given for the row.
% 2. Calibration Matix A = T^-1 * B

switch FT_SENSOR_MODEL
    case 'gamma'
        %%  The original .cal file
        % <?xml version="1.0" encoding="utf-8"?>
        % <!-- NOTE: To parse this file for your own software, use the "UserAxis" elements     -->
        % <!-- to construct the calibration matrix.  The "Axis" elements contain a scaled and  -->
        % <!-- transformed version of the matrix used for ATI's internal purposes only.  When  -->
        % <!-- you send your sensor back for recalibration, or replace your sensor with a new  -->
        % <!-- one, you will receive a new calibration file with a different matrix.  Make     -->
        % <!-- sure any custom software you write stays up to date with the latest version of  -->
        % <!-- the calibration matrix.                                                         -->
        % <FTSensor  Serial="FT8578" BodyStyle="Gamma" Family="DAQ" NumGages="6" CalFileVersion="1.1">
        % 	<Calibration  PartNumber="SI-130-10" CalDate="3/5/2014" ForceUnits="N" TorqueUnits="N-m" DistUnits="m" OutputMode="Ground Referenced Differential" OutputRange="20" HWTempComp="True" GainMultiplier="1" CableLossDetection="False" OutputBipolar="True">
        % 		<Axis Name="Fx" values=" -0.27053  -0.14278   0.35224 -32.30108  -0.22111  32.83006 " max="130" scale="2.33993181642138"/>
        % 		<Axis Name="Fy" values="  0.21616  37.46357   0.05722 -18.83819   0.35126 -18.85998 " max="130" scale="2.33993181642138"/>
        % 		<Axis Name="Fz" values=" 18.48980  -0.25078  18.75502  -0.41293  18.60017  -0.58878 " max="400" scale="0.747981765296576"/>
        % 		<Axis Name="Tx" values="  0.05325   0.15667 -32.28492   0.82744  32.26505  -1.25235 " max="10" scale="44.8196831994584"/>
        % 		<Axis Name="Ty" values=" 37.31421  -0.62445 -18.43472   0.63319 -18.48677   0.60638 " max="10" scale="44.8196831994584"/>
        % 		<Axis Name="Tz" values=" -0.13536 -18.46474   0.04406 -18.57097   0.27123 -18.80438 " max="10" scale="43.1398206760749"/>
        % 		<BasicTransform Dx="0" Dy="0" Dz="0.0120142" Rx="0" Ry="0" Rz="0"/>
        % 		<UserAxis Name="Fx" values=" -0.11562  -0.06102   0.15054 -13.80428  -0.09449  14.03035 " max="130"/>
        % 		<UserAxis Name="Fy" values="  0.09238  16.01054   0.02446  -8.05074   0.15012  -8.06005 " max="130"/>
        % 		<UserAxis Name="Fz" values=" 24.71959  -0.33527  25.07417  -0.55206  24.86714  -0.78715 " max="400"/>
        % 		<UserAxis Name="Tx" values="  0.00230   0.19585  -0.72004  -0.07826   0.72169  -0.12478 " max="10"/>
        % 		<UserAxis Name="Ty" values="  0.83393  -0.01320  -0.41312   0.17997  -0.41133  -0.15503 " max="10"/>
        % 		<UserAxis Name="Tz" values=" -0.00314  -0.42802   0.00102  -0.43048   0.00629  -0.43589 " max="10"/>
        % 	</Calibration>
        % </FTSensor>
        %% Matrix for Gamma Sensor
        B = zeros(6,6);
        B(1,:) = [-0.27053  -0.14278   0.35224 -32.30108  -0.22111  32.83006]/2.33993181642138;
        B(2,:) = [0.21616  37.46357   0.05722 -18.83819   0.35126 -18.85998]/2.33993181642138;
        B(3,:) = [18.48980  -0.25078  18.75502  -0.41293  18.60017  -0.5887]/0.747981765296576;
        B(4,:) = [0.05325   0.15667 -32.28492   0.82744  32.26505  -1.25235]/44.8196831994584;
        B(5,:) = [37.31421  -0.62445 -18.43472   0.63319 -18.48677   0.60638]/44.8196831994584;
        B(6,:) = [-0.13536 -18.46474   0.04406 -18.57097   0.27123 -18.80438]/43.1398206760749;
        % See ATI_Force_Sensor_NotesV2_0 for explanation of transform
        % - Note negative of Basic Cartesian Transform taken
        p = [0;0;-0.0134355078];
    case 'nano17'
        %%  The original .cal file
        % <?xml version="1.0" encoding="utf-8"?>
        % <!-- NOTE: To parse this file for your own software, use the "UserAxis" elements     -->
        % <!-- to construct the calibration matrix.  The "Axis" elements contain a scaled and  -->
        % <!-- transformed version of the matrix used for ATI's internal purposes only.  When  -->
        % <!-- you send your sensor back for recalibration, or replace your sensor with a new  -->
        % <!-- one, you will receive a new calibration file with a different matrix.  Make     -->
        % <!-- sure any custom software you write stays up to date with the latest version of  -->
        % <!-- the calibration matrix.                                                         -->
        % <FTSensor  Serial="FT8577" BodyStyle="Nano17" Family="DAQ" NumGages="6" CalFileVersion="1.1">
        % 	<Calibration  PartNumber="SI-25-0.25" CalDate="3/5/2014" ForceUnits="N" TorqueUnits="N-mm" DistUnits="mm" OutputMode="Ground Referenced Differential" OutputRange="20" HWTempComp="True" GainMultiplier="1" CableLossDetection="False" OutputBipolar="True">
        % 		<Axis Name="Fx" values=" -0.06744  -0.06253   0.34834  37.34247   1.90538 -37.39899 " max="25" scale="11.3650042049178"/>
        % 		<Axis Name="Fy" values="  0.55821 -45.57953  -0.51071  22.00831  -0.39426  21.28868 " max="25" scale="11.3650042049178"/>
        % 		<Axis Name="Fz" values=" 22.07572   0.66524  22.64229   0.15088  21.81132  -0.64550 " max="35" scale="5.89341666193018"/>
        % 		<Axis Name="Tx" values="  0.25495   0.07335  38.61586   0.30585 -38.71584   1.08341 " max="250" scale="1.82292883446332"/>
        % 		<Axis Name="Ty" values="-43.12768  -1.34402  23.17737   0.13073  21.67933  -0.58572 " max="250" scale="1.82292883446332"/>
        % 		<Axis Name="Tz" values="  0.23141 -23.28809  -0.53681 -22.47927   1.56779 -22.44391 " max="250" scale="1.57420173377595"/>
        % 		<BasicTransform Dx="0" Dy="0" Dz="6.096" Rx="0" Ry="0" Rz="0"/>
        % 		<UserAxis Name="Fx" values=" -0.00593  -0.00550   0.03065   3.28574   0.16765  -3.29072 " max="25"/>
        % 		<UserAxis Name="Fy" values="  0.04912  -4.01052  -0.04494   1.93650  -0.03469   1.87318 " max="25"/>
        % 		<UserAxis Name="Fz" values="  3.74583   0.11288   3.84196   0.02560   3.70096  -0.10953 " max="35"/>
        % 		<UserAxis Name="Tx" values="  0.43927 -24.40787  20.90948  11.97267 -21.44973  12.01322 " max="250"/>
        % 		<UserAxis Name="Ty" values="-23.62228  -0.70375  12.52751 -19.95816  10.87057  19.73889 " max="250"/>
        % 		<UserAxis Name="Tz" values="  0.14700 -14.79358  -0.34100 -14.27979   0.99593 -14.25733 " max="250"/>
        % 	</Calibration>
        % </FTSensor>
        %
        %% Matrix for Nano17 using Axis
        %
        B = zeros(6,6);
        B(1,:) = [-0.06744  -0.06253   0.34834  37.34247   1.90538 -37.39899]/11.3650042049178;
        B(2,:) = [0.55821 -45.57953  -0.51071  22.00831  -0.39426  21.28868]/11.3650042049178;
        B(3,:) = [22.07572   0.66524  22.64229   0.15088  21.81132  -0.64550]/5.89341666193018;
        B(4,:) = [0.25495   0.07335  38.61586   0.30585 -38.71584   1.08341]/1.82292883446332;
        B(5,:) = [-43.12768  -1.34402  23.17737   0.13073  21.67933  -0.58572]/1.82292883446332;
        B(6,:) = [0.23141 -23.28809  -0.53681 -22.47927   1.56779 -22.44391]/1.57420173377595;
        % trying use useraxis, not big difference
        %         B = zeros(6,6);
        %         B(1,:) = [-0.00593  -0.00550   0.03065   3.28574   0.16765  -3.29072];
        %         B(2,:) = [0.04912  -4.01052  -0.04494   1.93650  -0.03469   1.87318];
        %         B(3,:) = [3.74583   0.11288   3.84196   0.02560   3.70096  -0.10953];
        %         B(4,:) = [0.43927 -24.40787  20.90948  11.97267 -21.44973  12.01322];
        %         B(5,:) = [-23.62228  -0.70375  12.52751 -19.95816  10.87057  19.73889];
        %         B(6,:) = [0.14700 -14.79358  -0.34100 -14.27979   0.99593 -14.25733];
        %% See ATI_Force_Sensor_NotesV2_0 for explanation of transform
        % - Note negative of Basic Cartesian Transform taken
        p = [0;0;-6.096];
    case 'nano43'
        %%  The original .cal file
        %         <?xml version="1.0" encoding="utf-8"?>
        % <!-- NOTE: To ensure compatibility between your software and future F/T calibrations -->
        % <!-- (such as recalibrations of your transducer or future purchases),                -->
        % <!-- ATI does not support parsing of this file.  The only supported methods for      -->
        % <!-- loading calibration data are the ATIDAQFT ActiveX component, the ATI DAQ F/T C  -->
        % <!-- Library, and the ATICombinedDAQFT .NET Assembly.                                -->
        % <FTSensor  Serial="FT9439" BodyStyle="Nano43" Family="DAQ" NumGages="6" CalFileVersion="1.0">
        % 	<Calibration  PartNumber="SI-18-0.25" CalDate="10/16/2012" ForceUnits="N" TorqueUnits="N-mm" DistUnits="mm" OutputMode="Ground Referenced Differential" OutputRange="20" HWTempComp="True" GainMultiplier="1" CableLossDetection="False" OutputBipolar="True">
        % 		<Axis Name="Fx" values="  0.26829   0.83185  -0.76352 -34.93559  -0.00592  35.27227 " max="18" scale="16.3268754027456"/>
        % 		<Axis Name="Fy" values="  0.65836  43.24881  -0.36365 -21.10389  -0.05304 -20.32988 " max="18" scale="16.3268754027456"/>
        % 		<Axis Name="Fz" values="-20.43476  -0.74697 -20.74167   0.32902 -20.96078  -0.08043 " max="18" scale="13.8694114323035"/>
        % 		<Axis Name="Tx" values=" -0.32288   1.64739 -36.04715  -0.69550  36.13648  -0.24453 " max="250" scale="1.65167278491634"/>
        % 		<Axis Name="Ty" values=" 40.45634   1.99834 -21.41018   1.33549 -20.93308  -1.58067 " max="250" scale="1.65167278491634"/>
        % 		<Axis Name="Tz" values="  0.28649  21.36061   0.56318  20.37979  -0.02774  21.45104 " max="250" scale="1.14951433321416"/>
        % 		<BasicTransform Dx="0" Dy="0" Dz="4.3434" Rx="0" Ry="0" Rz="0"/>
        % 	</Calibration>
        % </FTSensor>
        %%  Matrix for Nano43 using Axis
        B = zeros(6,6);
        B(1,:) = [0.26829   0.83185  -0.76352 -34.93559  -0.00592  35.27227]/16.3268754027456;
        B(2,:) = [0.65836  43.24881  -0.36365 -21.10389  -0.05304 -20.32988]/16.3268754027456;
        B(3,:) = [-20.43476  -0.74697 -20.74167   0.32902 -20.96078  -0.08043]/13.8694114323035;
        B(4,:) = [-0.32288   1.64739 -36.04715  -0.69550  36.13648  -0.24453]/1.65167278491634;
        B(5,:) = [40.45634   1.99834 -21.41018   1.33549 -20.93308  -1.58067]/1.65167278491634;
        B(6,:) = [0.28649  21.36061   0.56318  20.37979  -0.02774  21.45104]/1.14951433321416;
        %% See ATI_Force_Sensor_NotesV2_0 for explanation of transform
        % - Note negative of Basic Cartesian Transform taken
        p = [0;0;-4.3434];
end
p_cross = [0,-p(3),p(2);p(3),0,-p(1);-p(2),p(1),0];
T = [eye(3),zeros(3,3);p_cross,eye(3)];
A = T*B;
end