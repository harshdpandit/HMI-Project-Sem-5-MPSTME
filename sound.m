function varargout = sound(varargin)
% SOUND MATLAB code for sound.fig
%      SOUND, by itself, creates a new SOUND or raises the existing
%      singleton*.
%
%      H = SOUND returns the handle to a new SOUND or the handle to
%      the existing singleton*.
%
%      SOUND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOUND.M with the given input arguments.
%
%      SOUND('Property','Value',...) creates a new SOUND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sound_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sound_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sound

% Last Modified by GUIDE v2.5 14-Oct-2022 20:45:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sound_OpeningFcn, ...
                   'gui_OutputFcn',  @sound_OutputFcn, ...
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


% --- Executes just before sound is made visible.
function sound_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sound (see VARARGIN)

% Choose default command line output for sound
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
guidata(hObject, handles);
delete(instrfind({'PORT'},{'COM5'}));%used to clear port and screen
clc;
clear all;
global a;
a=arduino('com5');
writePWMVoltage(a,'D11',0);
% UIWAIT makes sound wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sound_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%a.pinMode(11,'output');
%configurePin(a,D11,'DigitalOutput')


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writePWMVoltage(a,'D11',5);
pause(1);
writePWMVoltage(a,'D11',0);
