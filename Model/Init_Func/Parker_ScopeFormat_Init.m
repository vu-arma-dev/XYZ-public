
%% Scope Readout Format--------------------------------------------
Scope_Samples = 50;


p_cmd_scope_format = 'DesPose x: %8.6f,y: %8.6f,z: %8.6f,xd: %8.6f,yd: %8.6f,zd: %8.6f,xdd: %8.6f,ydd: %8.6f,zdd: %8.6f';
Control_Vals_format = 'u1 (V) %10.4f,u2 (V) %10.4f,u3 (V) %10.4f,u4 (V) %10.4f,u5 (V) %10.4f,u6 (V) %10.4f,us (V) %10.4f,';
Current_Position_Vals_format = 'CurrPose (mm): x: %7.3f ,y: %22.3f ,z: %22.3f,xd: %7.3f ,yd: %22.3f ,zd: %22.3f,xdd: %7.3f ,ydd: %22.3f ,zdd: %22.3f';
Scope_format_sys_stat = 'Homing: %2.0f,ENC Res: %2.0f,Mode: %2.0f,QuinticRecord: %2.0f,Error: %2.0f,FT Res: %2.0f';
forceFormat='Fx (N) %12.4f,Fy (N) %12.4f,Fz (N) %12.4f,Mx (Nmm) %12.4f,My (Nmm) %12.4f,Mz (Nmm) %12.4f';



% Interp_Position_Vals_format = 'InterpPose (mm): %6.3f ,%22.3f ,%22.3f';
% % Omni_t_ref_Vals_format = ' %10.4f t_ref, %10.4f, %10.4f, %10.4f, %10.4f, %10.4f';
% RR_t_des_Vals_format = ' %10.4f t_des x, %10.4f t_des y, %10.4f t_des z, %10.4f x_des x, %10.4f x_des y, %10.4f x_des z';
% Desired_Pose_Vals_format = ' %10.4f Desired q (mm), %10.4f, %10.4f, %10.4f, %10.4f, %10.4f';
% Error_Vals_format = 'e1 (mm) %10.4f,e2 (mm) %10.4f,e3 (mm) %10.4f,e4 (mm) %10.4f,e5 (mm) %10.4f,e6 (mm) %10.4f,es (mm) %10.4f';
% Encoder_Vals_format = ' %10.4f Encoder (mm), %10.4f, %10.4f, %10.4f, %10.4f, %10.4f';
% Actual_Pose_Vals_format = ' %10.4f Actual q (mm), %10.4f, %10.4f, %10.4f, %10.4f, %10.4f';
% Insertion_format = ' %10.4f ixdes (mm),  %10.4f iydes (mm),  %10.4f izdes (mm),  %10.4f iqs (mm),  %4.1f Stage of Insertion,  %10.4f dist (mm)';
% limitSwitchFormat='switch 1: %2.1f,switch 2: %2.1f,switch 3: %2.1f,switch 4: %2.1f,switch 5: %2.1f,switch 6: %2.1f';
% omniFormat='B: %2.1f,px: %10.5f,py: %10.5f,pz: %10.5f,q0: %10.5f,qx: %10.5f,qy: %10.5f,qz: %10.5f';
% forceAdmitFormat='Admit Fx (N) %8.5f,Admit Fy (N) %8.5f,Admit Fz (N) %8.5f,dpx (mm) %8.5f,dpy (mm) %8.5f,dpz (mm) %8.5f';
% Voltage_Vals_format = 'Voltage [V]: %10.4f, %22.4f, %22.4f, %22.4f ,%23.4f ,%23.4f';
% poseFormat='x_cur: %8.5f,y_cur: %8.5f,z_cur: %8.5f,nx_cur: %7.5f,ny_cur: %7.5f,nz_cur: %7.5f,theta:  %7.5f';
% accelerationFormat='x accel: %8.6f g,y accel: %8.6f g,z accel: %8.6f g, Magnitude %8.6f g';
% homing_logic_scope_format = 'h: %8.6f, status: %8.6f, conf: %8.6f, to: %8.6f';
% % MTM_udp_scope_format = 'MTM: MSG: %2.1f,x: %8.6f,y: %8.6f,z: %8.6f,q0: %8.6f,qx: %8.6f,qy: %8.6f,qz: %8.6f,time: %8.6f,delay: %8.6f';
% % CMU_force_scope = 'CMU: error: %8.6f, Contact: %8.6f,fx: %8.6f,fy: %8.6f,fz: %8.6f,dx: %8.6f,dy: %8.6f,dz: %8.6f,delay: %8.6f';
% % temp_debug_scope = 'debug: fx: %8.6f,fy: %8.6f,fz: %8.6f,dx: %8.6f,dy: %8.6f,dz: %8.6f,error: %8.6f';
% % Scope_format_tau = 'tau x (N) %10.4f,tau y (N) %10.4f,tau z (N) %10.4f';
% % Scope_format_x_cur_update = 'x update x (mm) %10.4f,y (mm) %10.4f,z (mm) %10.4f';
% % Scope_format_Path = 'PATH  dState %2.1f,cState %2.1f,x: %10.4f,y: %10.4f,z: %10.4f,t: %10.4f,s: %10.4f';
% ForceControlAct_Scope = 'ForceControl efx: %10.4f,efy: %10.4f,efz: %10.4f,Ix: %10.4f,Iy: %10.4f,Iz: %10.4f,Fx: %10.4f,Fy: %10.4f,Fz: %10.4f';
% Scope_format_TASK_cmd = 'TASK[mm]: OM.x: %7.3f ,OM.y: %22.3f ,OM.z: %22.3f,MTM.x: %7.3f ,MTM.y: %22.3f ,MTM.z: %22.3f,Path.x: %7.3f ,Path.y: %22.3f ,Path.z: %22.3f';


% Scope_format_superim = 'SuperIm[mm]: Px: %7.3f ,Py: %22.3f ,Pz: %22.3f,Ctr.x: %7.3f ,Ctr.y: %22.3f ,Ctr.z: %22.3f';
% Scope_format_AxisAngle_Temp = 'nx: %7.3f ,ny: %22.3f ,nz: %22.3f,theta: %7.3f';
% Scope_format_velocityTemp = 'vx: %7.3f ,vy: %22.3f ,vz: %22.3f';
% Scope_format_LowForceContact = 'LFC count: %2.0f,px: %2.3f,py: %2.3f,pz: %2.3f,Fx: %2.3f,Fy: %2.3f,Fz: %2.3f';
% Scope_format_Tracker_BallCenter = 'TK Ball Cent.: px: %2.3f,py: %2.3f,pz: %2.3f,lost: %0.0f';