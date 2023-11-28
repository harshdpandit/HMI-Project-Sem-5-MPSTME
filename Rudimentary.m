function varargout = Rudimentary(varargin)
% RUDIMENTARY MATLAB code for Rudimentary.fig
%      RUDIMENTARY, by itself, creates a new RUDIMENTARY or raises the existing
%      singleton*.
%
%      H = RUDIMENTARY returns the handle to a new RUDIMENTARY or the handle to
%      the existing singleton*.
%
%      RUDIMENTARY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUDIMENTARY.M with the given input arguments.
%
%      RUDIMENTARY('Property','Value',...) creates a new RUDIMENTARY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rudimentary_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rudimentary_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rudimentary

% Last Modified by GUIDE v2.5 15-Oct-2022 00:34:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rudimentary_OpeningFcn, ...
                   'gui_OutputFcn',  @Rudimentary_OutputFcn, ...
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


% --- Executes just before Rudimentary is made visible.
function Rudimentary_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rudimentary (see VARARGIN)

% Choose default command line output for Rudimentary
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
guidata(hObject, handles);
delete(instrfind({'PORT'},{'COM5'}));%used to clear port and screen
clc;
clear all;
global a;
a=arduino('com5');
% UIWAIT makes Rudimentary wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rudimentary_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
switch get(handles.popupmenu1,'Value')
    case 1
        c='You have chosen to pay with cash'
        set(handles.edit2,'String',c);
    case 2
        c='You have chosen to pay with Credit Card'
        set(handles.edit2,'String',c);
        global a;
        writePWMVoltage(a,'D11',1);
        pause(0.5);
        writePWMVoltage(a,'D11',5);
        pause(0.5);
        writePWMVoltage(a,'D11',1);
        pause(0.5);
        writePWMVoltage(a,'D11',0);
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global start_dest;
switch get(handles.popupmenu2,'Value')
    case 1
        start_dest='Ghatkopar';
    case 2
        start_dest='Jagruti Nagar';
    case 3
        start_dest='Asalpha';
    case 4
        start_dest='Saki Naka';
    case 5
        start_dest='Marol Naka';
    case 6
        start_dest='Airport Road';
    case 7
        start_dest='Chakala (J.B.Nagar)';
    case 8
        start_dest='Western Express Highway';
    case 9
        start_dest='Andheri';
    case 10
        start_dest='Azad Nagar';
    case 11
        start_dest='D.N. Nagar';
    case 12
        start_dest='Versova';
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
global end_dest
switch get(handles.popupmenu3,'Value')
    case 1
        end_dest='Versova';
    case 2
        end_dest='D.N. Nagar';
    case 3
        end_dest='Azad Nagar';
    case 4
        end_dest='Andheri';
    case 5
        end_dest='Western Express Highway';
    case 6
        end_dest='Chakala (J.B.Nagar)';
    case 7
        end_dest='Airport Road';
    case 8
        end_dest='Marol Naka';
    case 9
        end_dest='Saki Naka';
    case 10
        end_dest='Asalpha';
    case 11
        end_dest='Jagruti Nagar';
    case 12
        end_dest='Ghatkopar';
    
    
        
end

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
global typ_journey;
switch get(handles.popupmenu4,'Value')
    case 1
        typ_journey='Single Journey';
    case 2
        typ_journey='Return Journey';
end

global start_dest;
global end_dest;
global cost;
if ((start_dest=='Ghatkopar'))
    if (end_dest == 'Versova')
        cost=10;
    end
end
if (typ_journey=='Single Journey')
    cost=cost*1;
    set(handles.edit2,'String',cost);
else
    cost=cost*2;
    set(handles.edit2,'String',cost);
end

    
% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

