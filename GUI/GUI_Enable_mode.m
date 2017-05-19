function GUI_Enable_mode( handles,action )
% set(handles.HomeRadioButton,'Enable',action);
% set(handles.QuinticRadioButton,'Enable',action);
% set(handles.Omega7RadioButton,'Enable',action);
% set(handles.MTMRadioButton,'Enable',action);
% set(handles.PathPlanRadioButton,'Enable',action);
set(findall(handles.Mode_sel_panel, '-property', 'enable'), 'enable',action);

end

