function varargout = GUI_ParkerXYZ(varargin)
% GUI_PARKERXYZ MATLAB code for GUI_ParkerXYZ.fig
%      GUI_PARKERXYZ, by itself, creates a new GUI_PARKERXYZ or raises the existing
%      singleton*.
%
%      H = GUI_PARKERXYZ returns the handle to a new GUI_PARKERXYZ or the handle to
%      the existing singleton*.
%
%      GUI_PARKERXYZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PARKERXYZ.M with the given input arguments.
%
%      GUI_PARKERXYZ('Property','Value',...) creates a new GUI_PARKERXYZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ParkerXYZ_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ParkerXYZ_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ParkerXYZ

% Last Modified by GUIDE v2.5 02-May-2016 14:38:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_ParkerXYZ_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_ParkerXYZ_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_ParkerXYZ is made visible.
function GUI_ParkerXYZ_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ParkerXYZ (see VARARGIN)

%% Setup matlab directories
cd('C:\Users\arma\Documents\Parker_XYZ_CMU\');
addpath(genpath(pwd));

% Choose default command line output for GUI_ParkerXYZ
handles.output = hObject;
handles.ModelLoaded = 0;

% Set all the buttons disabled
set(handles.StartButton,'Enable','off');
set(handles.StopButton,'Enable','off');
GUI_Enable_quintic(handles,'off');
GUI_Enable_mode(handles,'off');

% Assign model
fprintf('Initializing target..');
address = '192.168.1.167';
port = '22222';
handles.tg = xpc('TcpIp',address,port);
% handles.tg.TcpIpTargetAddress =address;
fprintf('..[ok]\n');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_ParkerXYZ wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ParkerXYZ_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LoadModelButton.
function LoadModelButton_Callback(hObject, eventdata, handles)
% hObject    handle to LoadModelButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('Loading application..');
Model_Path = getenv('PARKERDIR');


handles.tg.set('CommunicationTimeOut',20);
load(handles.tg,[Model_Path,'/Build/slrt_parker']);
fprintf('..[ok]\n');
% Parker_UDP_Setup(handles.tg);
set(handles.StartButton,'Enable','on');
set(handles.Mode_sel_panel,'SelectedObject',handles.QuinticRadioButton);


% --- Executes on button press in StartButton.
function StartButton_Callback(hObject, eventdata, handles)
% hObject    handle to StartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.tg.start;
set(handles.StopButton,'Enable','on');
GUI_Enable_mode(handles,'on');
GUI_Enable_quintic(handles,'on');
QuinticUpdate_Callback(hObject,eventdata,handles);



% --- Executes on button press in StopButton.
function StopButton_Callback(hObject, eventdata, handles)
% hObject    handle to StopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Set all the buttons disabled
handles.tg.stop;
set(handles.StartButton,'Enable','off');
set(handles.StopButton,'Enable','off');
GUI_Enable_quintic(handles,'off');
GUI_Enable_mode(handles,'off');

% --- Executes on button press in QuinticUpdate.
function QuinticUpdate_Callback(hObject, eventdata, handles)
% hObject    handle to QuinticUpdate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p=parkerGetPcur(handles.tg);
set(handles.QuinticXText,'String',num2str(p(1)));
set(handles.QuinticYText,'String',num2str(p(2)));
set(handles.QuinticZText,'String',num2str(p(3)));

function QuinticXText_Callback(hObject, eventdata, handles)
% hObject    handle to QuinticXText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of QuinticXText as text
%        str2double(get(hObject,'String')) returns contents of QuinticXText as a double

% --- Executes during object creation, after setting all properties.
function QuinticXText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QuinticXText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function QuinticYText_Callback(hObject, eventdata, handles)
% hObject    handle to QuinticYText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of QuinticYText as text
%        str2double(get(hObject,'String')) returns contents of QuinticYText as a double


% --- Executes during object creation, after setting all properties.
function QuinticYText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QuinticYText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QuinticZText_Callback(hObject, eventdata, handles)
% hObject    handle to QuinticZText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QuinticZText as text
%        str2double(get(hObject,'String')) returns contents of QuinticZText as a double


% --- Executes during object creation, after setting all properties.
function QuinticZText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QuinticZText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over LoadModelButton.
function LoadModelButton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to LoadModelButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in QuinticApply.
function QuinticApply_Callback(hObject, eventdata, handles)
% hObject    handle to QuinticApply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
q_des = [   str2double(get(handles.QuinticXText,'String'));...
    str2double(get(handles.QuinticYText,'String'));...
    str2double(get(handles.QuinticZText,'String'));];
tf = str2double(get(handles.QuinticTText,'String'));
if tf==0
    tf = 5;
end
if ~any(isnan(q_des))
    parkerSetJoint(handles.tg,q_des,tf);
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over StartButton.
function StartButton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to StartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function StartButton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in Mode_sel_panel.
function Mode_sel_panel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in Mode_sel_panel
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
panel_enable = {'off';'off';'off';'on';'off';'off'};
% 1->quintic

OptionString = get(eventdata.NewValue,'String');
switch OptionString
    case 'Homing'
        parkerSetMode(handles.tg,1);
    case 'Quintic Joint Control'
        parkerSetMode(handles.tg,2);
        panel_enable{1} = 'on';

end
GUI_Enable_quintic(handles,panel_enable{1});

% --- Executes during object creation, after setting all properties.
function Mode_sel_panel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mode_sel_panel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function QuinticApply_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Quintic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function QuinticTText_Callback(hObject, eventdata, handles)
% hObject    handle to QuinticTText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QuinticTText as text
%        str2double(get(hObject,'String')) returns contents of QuinticTText as a double


% --- Executes during object creation, after setting all properties.
function QuinticTText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QuinticTText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function uipanel6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


