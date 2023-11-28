function varargout = Trial_1(varargin)
% TRIAL_1 MATLAB code for Trial_1.fig
%      TRIAL_1, by itself, creates a new TRIAL_1 or raises the existing
%      singleton*.
%
%      H = TRIAL_1 returns the handle to a new TRIAL_1 or the handle to
%      the existing singleton*.
%
%      TRIAL_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRIAL_1.M with the given input arguments.
%
%      TRIAL_1('Property','Value',...) creates a new TRIAL_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Trial_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Trial_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Trial_1

% Last Modified by GUIDE v2.5 08-Oct-2022 22:57:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trial_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Trial_1_OutputFcn, ...
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


% --- Executes just before Trial_1 is made visible.
function Trial_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Trial_1 (see VARARGIN)

% Choose default command line output for Trial_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
delete(instrfind({'PORT'},{'COM5'}));%used to clear port and screen
clc;
clear all;
global a;
a=arduino('com5');
%a.pinMode(11,'output');
%configurePin(a,D11,'DigitalOutput')




% UIWAIT makes Trial_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Trial_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
c=' ';
set(handles.edit1,'String',c);
writePWMVoltage(a,'D11',1);
pause(0.5);
writePWMVoltage(a,'D11',5);
pause(0.5);
writePWMVoltage(a,'D11',1);
pause(0.5);
writePWMVoltage(a,'D11',5);
writeDigitalPin(a,'D11',0);
c='Notification Sent';
set(handles.edit1,'String',c);
