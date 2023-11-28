function varargout = Prototype(varargin)
% PROTOTYPE MATLAB code for Prototype.fig
%      PROTOTYPE, by itself, creates a new PROTOTYPE or raises the existing
%      singleton*.
%
%      H = PROTOTYPE returns the handle to a new PROTOTYPE or the handle to
%      the existing singleton*.
%
%      PROTOTYPE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROTOTYPE.M with the given input arguments.
%
%      PROTOTYPE('Property','Value',...) creates a new PROTOTYPE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prototype_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prototype_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prototype

% Last Modified by GUIDE v2.5 15-Oct-2022 09:06:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prototype_OpeningFcn, ...
                   'gui_OutputFcn',  @Prototype_OutputFcn, ...
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


% --- Executes just before Prototype is made visible.
function Prototype_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prototype (see VARARGIN)

% Choose default command line output for Prototype
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


axes(handles.axes1);
img=imread('C:\Users\Pallavi\Downloads\harsh.jpg');
imshow(img);
clc;
clear all;
delete(instrfind({'PORT'},{'COM5'}));%used to clear port and screen
global a;
a=arduino('com5','Uno',"Libraries","Ultrasonic")
%global ultra;
%ultra = ultrasonic(a,'D2','D3')%trg pin: D2 and echo pin : D3






% UIWAIT makes Prototype wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Prototype_OutputFcn(hObject, ~, handles) 
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global start_dest;
c=" ";
set(handles.edit1,"String",c);
switch get(handles.popupmenu1,'Value')
    case 1
        start_dest="Ghatkopar";
    case 2
        start_dest="Jagruti Nagar";
    case 3
        start_dest="Asalpha";
    case 4
        start_dest="Saki Naka";
    case 5
        start_dest="Marol Naka";
    case 6
        start_dest="Airport Road";
    case 7
        start_dest="Chakala (J.B.Nagar)";
    case 8
        start_dest="Western Express Highway";
    case 9
        start_dest="Andheri";
    case 10
        start_dest="Azad Nagar";
    case 11
        start_dest="D.N. Nagar";
    case 12
        start_dest="Versova";
end



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, ~, handles)
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
global end_dest;
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

c=" ";
set(handles.edit1,"String",c);
switch get(handles.popupmenu2,'Value')
    case 1
        end_dest="Versova";
    case 2
        end_dest="D.N. Nagar";
    case 3
        end_dest="Azad Nagar";
    case 4
        end_dest="Andheri";
    case 5
        end_dest="Western Express Highway";
    case 6
        end_dest="Chakala (J.B.Nagar)";
    case 7
        end_dest="Airport Road";
    case 8
        end_dest="Marol Naka";
    case 9
        end_dest="Saki Naka";
    case 10
        end_dest="Asalpha";
    case 11
        end_dest="Jagruti Nagar";
    case 12
        end_dest="Ghatkopar";
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
global end_dest;
global start_dest;
global typ_journey;
global cost;
global a;

% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
if (end_dest == start_dest)
    c="Please Pick another station.";
    set(handles.edit1,"String",c);
    writePWMVoltage(a,'D6',0);
    writePWMVoltage(a,'D11',0);
    pause(0.08);
    writePWMVoltage(a,'D6',5);
    writePWMVoltage(a,'D11',5);
    pause(0.08);
    writePWMVoltage(a,'D6',0);
    writePWMVoltage(a,'D11',0);
    pause(0.08);
    writePWMVoltage(a,'D6',05);
    writePWMVoltage(a,'D11',5);
    writePWMVoltage(a,'D6',0);
    writePWMVoltage(a,'D11',0);
else
    c=" ";
    set(handles.edit1,"String",c);
end
switch get(handles.popupmenu3,'Value')
    case 1
        typ_journey="Single Journey";
    case 2
        typ_journey="Return Journey";
end
if ((start_dest=="Ghatkopar"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Jagruti Nagar")
        cost=10;
    elseif (end_dest == "Asalpha")
        cost=10;
    elseif (end_dest == "Saki Naka")
        cost=20;
    elseif(end_dest == "Marol Naka")
        cost=20;
    elseif (end_dest == "Airport Road")
        cost=20;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=30;
    elseif (end_dest == "Western Express Highway")
        cost=30;
    elseif (end_dest == "Andheri")
        cost=30;
    elseif (end_dest == "Azad Nagar")
        cost=40;
    elseif (end_dest == "D.N. Nagar")
        cost=40;
    elseif (end_dest == "Versova")
        cost=40;
    end
end
%for Jagruti Nagar
if ((start_dest=="Jagruti Nagar"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=10;
    elseif (end_dest == "Asalpha")
        cost=10;
    elseif (end_dest == "Saki Naka")
        cost=10;
    elseif(end_dest == "Marol Naka")
        cost=20;
    elseif (end_dest == "Airport Road")
        cost=20;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=20;
    elseif (end_dest == "Western Express Highway")
        cost=30;
    elseif (end_dest == "Andheri")
        cost=30;
    elseif (end_dest == "Azad Nagar")
        cost=30;
    elseif (end_dest == "D.N. Nagar")
        cost=40;
    elseif (end_dest == "Versova")
        cost=40;
    end
end

%for Asalpha 
if ((start_dest=="Asalpha"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=10;
    elseif (end_dest == "Jagruti Nagar")
        cost=10;
    elseif (end_dest == "Saki Naka")
        cost=10;
    elseif(end_dest == "Marol Naka")
        cost=20;
    elseif (end_dest == "Airport Road")
        cost=20;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=20;
    elseif (end_dest == "Western Express Highway")
        cost=20;
    elseif (end_dest == "Andheri")
        cost=30;
    elseif (end_dest == "Azad Nagar")
        cost=30;
    elseif (end_dest == "D.N. Nagar")
        cost=30;
    elseif (end_dest == "Versova")
        cost=40;
    end
end

%for saki naka
if ((start_dest=="Saki Naka"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=20;
    elseif (end_dest == "Jagruti Nagar")
        cost=10;
    elseif (end_dest == "Asalpha")
        cost=10;
    elseif(end_dest == "Marol Naka")
        cost=10;
    elseif (end_dest == "Airport Road")
        cost=10;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=20;
    elseif (end_dest == "Western Express Highway")
        cost=20;
    elseif (end_dest == "Andheri")
        cost=20;
    elseif (end_dest == "Azad Nagar")
        cost=30;
    elseif (end_dest == "D.N. Nagar")
        cost=30;
    elseif (end_dest == "Versova")
        cost=30;
    end
end
%for Marol Naka
if ((start_dest=="Marol Naka"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=10;
    elseif (end_dest == "Jagruti Nagar")
        cost=10;
    elseif (end_dest == "Asalpha")
        cost=20;
    elseif(end_dest == "Saki Naka")
        cost=20;
    elseif (end_dest == "Airport Road")
        cost=20;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=30;
    elseif (end_dest == "Western Express Highway")
        cost=30;
    elseif (end_dest == "Andheri")
        cost=30;
    elseif (end_dest == "Azad Nagar")
        cost=40;
    elseif (end_dest == "D.N. Nagar")
        cost=40;
    elseif (end_dest == "Versova")
        cost=40;
    end
end

%for Airport Road
if ((start_dest=="Airport Road"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=20;
    elseif (end_dest == "Jagruti Nagar")
        cost=20;
    elseif (end_dest == "Asalpha")
        cost=20;
    elseif(end_dest == "Saki Naka")
        cost=10;
    elseif (end_dest == "Marol Naka")
        cost=10;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=10;
    elseif (end_dest == "Western Express Highway")
        cost=20;
    elseif (end_dest == "Andheri")
        cost=20;
    elseif (end_dest == "Azad Nagar")
        cost=20;
    elseif (end_dest == "D.N. Nagar")
        cost=30;
    elseif (end_dest == "Versova")
        cost=30;
    end
end

%for Chakala (J.B.Nagar)
if ((start_dest=="Chakala (J.B.Nagar)"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=30;
    elseif (end_dest == "Jagruti Nagar")
        cost=20;
    elseif (end_dest == "Asalpha")
        cost=20;
    elseif(end_dest == "Saki Naka")
        cost=20;
    elseif (end_dest == "Marol Naka")
        cost=10;
    elseif (end_dest == "Airport Road")
        cost=10;
    elseif (end_dest == "Western Express Highway")
        cost=10;
    elseif (end_dest == "Andheri")
        cost=10;
    elseif (end_dest == "Azad Nagar")
        cost=20;
    elseif (end_dest == "D.N. Nagar")
        cost=20;
    elseif (end_dest == "Versova")
        cost=30;
    end
end

%for western express highway
if ((start_dest=="Western Express Highway"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=30;
    elseif (end_dest == "Jagruti Nagar")
        cost=30;
    elseif (end_dest == "Asalpha")
        cost=20;
    elseif(end_dest == "Saki Naka")
        cost=20;
    elseif (end_dest == "Marol Naka")
        cost=20;
    elseif (end_dest == "Airport Road")
        cost=20;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=10;
    elseif (end_dest == "Andheri")
        cost=10;
    elseif (end_dest == "Azad Nagar")
        cost=20;
    elseif (end_dest == "D.N. Nagar")
        cost=20;
    elseif (end_dest == "Versova")
        cost=20;
    end
end
%for Andheri
if ((start_dest=="Andheri"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=30;
    elseif (end_dest == "Jagruti Nagar")
        cost=30;
    elseif (end_dest == "Asalpha")
        cost=30;
    elseif(end_dest == "Saki Naka")
        cost=20;
    elseif (end_dest == "Marol Naka")
        cost=20;
    elseif (end_dest == "Airport Road")
        cost=20;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=20;
    elseif (end_dest == "Western Express Highway")
        cost=10;
    elseif (end_dest == "Azad Nagar")
        cost=10;
    elseif (end_dest == "D.N. Nagar")
        cost=20;
    elseif (end_dest == "Versova")
        cost=20;
    end
end

%for Azad Nagar
if ((start_dest=="Azad Nagar"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=40;
    elseif (end_dest == "Jagruti Nagar")
        cost=30;
    elseif (end_dest == "Asalpha")
        cost=30;
    elseif(end_dest == "Saki Naka")
        cost=30;
    elseif (end_dest == "Marol Naka")
        cost=20;
    elseif (end_dest == "Airport Road")
        cost=20;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=20;
    elseif (end_dest == "Western Express Highway")
        cost=10;    
    elseif (end_dest == "Andheri")
        cost=40;
    elseif (end_dest == "D.N. Nagar")
        cost=40;
    elseif (end_dest == "Versova")
        cost=20;
    end
end

%for D.N. Nagar
if ((start_dest=="D.N. Nagar"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=40;
    elseif (end_dest == "Jagruti Nagar")
        cost=40;
    elseif (end_dest == "Asalpha")
        cost=30;
    elseif(end_dest == "Saki Naka")
        cost=30;
    elseif (end_dest == "Marol Naka")
        cost=30;
    elseif (end_dest == "Airport Road")
        cost=30;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=20;
    elseif (end_dest == "Western Express Highway")
        cost=20;
    elseif (end_dest == "Andheri")
        cost=20;
    elseif (end_dest == "Azad Nagar")
        cost=10;
    elseif (end_dest == "Versova")
        cost=10;
    end
end

%for versova
if ((start_dest=="Versova"))
    if ((end_dest == start_dest))
        cost=0;
    elseif (end_dest == "Ghatkopar")
        cost=40;
    elseif (end_dest == "Jagruti Nagar")
        cost=40;
    elseif (end_dest == "Asalpha")
        cost=30;
    elseif(end_dest == "Saki Naka")
        cost=30;
    elseif (end_dest == "Marol Naka")
        cost=30;
    elseif (end_dest == "Airport Road")
        cost=30;
    elseif (end_dest == "Chakala (J.B.Nagar)")
        cost=30;
    elseif (end_dest == "Western Express Highway")
        cost=20;
    elseif (end_dest == "Andheri")
        cost=20;
    elseif (end_dest == "Azad Nagar")
        cost=20;
    elseif (end_dest == "D.N. Nagar")
        cost=10;
    end
end

if (typ_journey=="Single Journey")
    cost=cost*1;
    set(handles.edit2,'String',cost);
else
    cost=cost*2;
    set(handles.edit2,'String',cost);
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
global a;
global end_dest;
global start_dest;
%global ultra;
ultra = ultrasonic(a,'D2','D3') %trg pin: D2 and echo pin : D3
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
if (end_dest ~= start_dest)
    switch get(handles.popupmenu4,'Value')
        case 1
            sum=0;
            c="You have chosen to pay with Card";
            set(handles.edit1,'String',c);
            pause(4);
            c="Please insert the card in slot.";
            set(handles.edit1,'String',c);
            pause(6);
            c="Please keep the card for 5 secs.";
            pause(5);
            set(handles.edit1,'String',c);
            acc_val=10;
            itr=0;
            for time_ind=1:5
                tic;
                dist=readDistance(ultra);
                dist=dist*100
                sum=sum+dist;
                itr=itr+1;
            end
            avg=sum/itr
            if avg> acc_val
                c="Payment Unsucessful";
                set(handles.edit1,'String',c);
                writePWMVoltage(a,'D11',5);
                writePWMVoltage(a,'D6',5);
                pause(0.08);
                writePWMVoltage(a,'D11',0);
                writePWMVoltage(a,'D6',0);
              
            else
                c="Payment Sucessful";
                set(handles.edit1,'String',c);
                writePWMVoltage(a,'D11',5);
                writePWMVoltage(a,'D6',5);
                pause(0.04);
                writePWMVoltage(a,'D11',4);
                writePWMVoltage(a,'D6',4);
                pause(0.8);
                writePWMVoltage(a,'D11',0);
                writePWMVoltage(a,'D6',0);
             
            end

        case 2
            c="You have chosen to pay with Cash";
            set(handles.edit1,'String',c);
            writePWMVoltage(a,'D11',5);
            writePWMVoltage(a,'D6',5);
            pause(0.08);
            writePWMVoltage(a,'D11',3);
            writePWMVoltage(a,'D6',3);
            pause(0.08);
            writePWMVoltage(a,'D11',5);
            writePWMVoltage(a,'D6',5);
            pause(0.08);
            writePWMVoltage(a,'D11',0);
            writePWMVoltage(a,'D6',0);

    end
else
    c="Select Valid stations";
    set(handles.edit1,'String',c);
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
