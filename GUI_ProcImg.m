% Carlos Daniel Díaz Cano

function varargout = GUI_ProcImg(varargin)
% GUI_PROCIMG MATLAB code for GUI_ProcImg.fig
%      GUI_PROCIMG, by itself, creates a new GUI_PROCIMG or raises the existing
%      singleton*.
%
%      H = GUI_PROCIMG returns the handle to a new GUI_PROCIMG or the handle to
%      the existing singleton*.
%
%      GUI_PROCIMG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PROCIMG.M with the given input arguments.
%
%      GUI_PROCIMG('Property','Value',...) creates a new GUI_PROCIMG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ProcImg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ProcImg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ProcImg

% Last Modified by GUIDE v2.5 20-Apr-2015 18:26:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_ProcImg_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_ProcImg_OutputFcn, ...
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


% --- Executes just before GUI_ProcImg is made visible.
function GUI_ProcImg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ProcImg (see VARARGIN)

% Choose default command line output for GUI_ProcImg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_ProcImg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ProcImg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_image.
function load_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%----------> here we load image
clc;
global img orImg imgR I1C I2C
[path,user_cance]=imgetfile();
if user_cance
msgbox(sprintf('Error'),'Error','Error');
return
end
img=imread(path);
%img=im2double(img); %converts to double
orImg=img; %for backup process :)
axes(handles.img1);
imshow(img);
set(handles.reset,'Enable','on');
set(handles.histogram,'Enable','on');
set(handles.stretching,'Enable','on');
set(handles.equalize,'Enable','on');
set(handles.gray_scale,'Enable','on');
set(handles.histogram_rgb,'Enable','on');
set(handles.separate_channels,'Enable','on');
set(handles.add_channels,'Enable','on');
set(handles.duo_channels,'Enable','on');
set(handles.false_color,'Enable','on');
set(handles.submenu,'Enable','on');
set(handles.save_image,'Enable','on');
set(handles.panel_operations,'Visible','on');
I1C=1;
if I2C~=1
    I2C=0;
end

% --- Executes on button press in gray_scale.
function gray_scale_Callback(hObject, eventdata, handles)
% hObject    handle to gray_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
imgray=img;
imgR=imgray;
imgray=rgb2gray(imgray);
axes(handles.axesR);
imshow(imgray)


% --- Executes on button press in separate_channels.
function separate_channels_Callback(hObject, eventdata, handles)
% hObject    handle to separate_channels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
Sep_RGB(img);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orImg imgR
imgR=orImg;
axes(handles.axesR);
imshow(orImg);


% --- Executes on button press in histogram_rgb.
function histogram_rgb_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_rgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
Hist_RGB(img);


% --- Executes on button press in add_channels.
function add_channels_Callback(hObject, eventdata, handles)
% hObject    handle to add_channels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
extra_RGB(img);


% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
%[H,xH]=histGray(img);
axes(handles.axesR)
imgR=imhist(rgb2gray(img));
imhist(rgb2gray(img))


% --- Executes on button press in duo_channels.
function duo_channels_Callback(hObject, eventdata, handles)
% hObject    handle to duo_channels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
Hist_duoCanal(img);


% --- Executes on button press in stretching.
function stretching_Callback(hObject, eventdata, handles)
% hObject    handle to stretching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
[R,H]=streching(img);
axes(handles.axesR)
imshow(R);
imgR=R;

% --- Executes on button press in equalize.
function equalize_Callback(hObject, eventdata, handles)
% hObject    handle to equalize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
R=ecualizar(img);
axes(handles.axesR)
imshow(R);
imgR=R;

% --- Executes on selection change in submenu.
function submenu_Callback(hObject, eventdata, handles)
% hObject    handle to submenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns submenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from submenu
val=get(hObject,'Value');
str=get(hObject,'String');
global op img img2 I2C
switch str{val}
    case 'Binary'
        set(handles.panel_operations,'Title','Binary panel');
        set(handles.panel_operations,'Visible','on');
        set(handles.slider_text,'Visible','on');
        set(handles.slider_value,'Visible','on');
        set(handles.slider_text,'String','Threshold');
        set(handles.text_R,'Visible','off');
        set(handles.text_G,'Visible','off');
        set(handles.text_B,'Visible','off');
        set(handles.field_R,'Visible','off');
        set(handles.field_G,'Visible','off');
        set(handles.field_B,'Visible','off');
        set(handles.execute_button,'Visible','off');
        op=0;
        set(handles.img2,'Visible','off')
        set(handles.panel_img2,'Visible','off')
        set(handles.panel_radio,'Visible','off')
        set(handles.panel_filters,'Visible','off');
        set(handles.panel_colorspace,'Visible','off');
    case 'Sepia'
        set(handles.panel_operations,'Title','Sepia panel');
        set(handles.panel_operations,'Visible','on');
        set(handles.slider_text,'Visible','on');
        set(handles.slider_text,'String','Values[0-255]Only');
        set(handles.slider_value,'Visible','off');
        set(handles.text_R,'Visible','on');
        set(handles.text_G,'Visible','on');
        set(handles.text_B,'Visible','on');
        set(handles.field_R,'Visible','on');
        set(handles.field_G,'Visible','on');
        set(handles.field_B,'Visible','on');
        set(handles.execute_button,'Visible','on');
        op=1;
        set(handles.img2,'Visible','off')
        set(handles.panel_img2,'Visible','off')
        set(handles.panel_radio,'Visible','off')
        set(handles.panel_filters,'Visible','off');
        set(handles.panel_colorspace,'Visible','off');
    case 'Transition'        
        set(handles.panel_operations,'Title','Transition panel');
        set(handles.slider_text,'String','Alpha');
        set(handles.slider_value,'Visible','on');
        set(handles.text_R,'Visible','off');
        set(handles.text_G,'Visible','off');
        set(handles.text_B,'Visible','off');
        set(handles.field_R,'Visible','off');
        set(handles.field_G,'Visible','off');
        set(handles.field_B,'Visible','off');
        set(handles.execute_button,'Visible','off');
        set(handles.panel_radio,'Visible','off')
        set(handles.panel_filters,'Visible','off');
        op=2;
        if I2C==1    
            set(handles.img2,'Visible','on')
            set(handles.panel_img2,'Visible','on')
            set(handles.panel_operations,'Visible','on')
        else
            set(handles.img2,'Visible','on')
            set(handles.panel_img2,'Visible','on')
            set(handles.panel_operations,'Visible','off')
        end
        set(handles.panel_colorspace,'Visible','off');
    case 'Booleans operations'
        set(handles.panel_operations,'Visible','off');
        set(handles.slider_text,'Visible','on');
        set(handles.slider_text,'String','Operation');
        set(handles.slider_value,'Visible','off');
        set(handles.text_R,'Visible','off');
        set(handles.text_G,'Visible','off');
        set(handles.text_B,'Visible','off');
        set(handles.field_R,'Visible','off');
        set(handles.field_G,'Visible','off');
        set(handles.field_B,'Visible','off');
        set(handles.execute_button,'Visible','off');
        op=3;
        set(handles.img2,'Visible','on')
        set(handles.panel_img2,'Visible','on')
        set(handles.panel_radio,'Visible','on')
        set(handles.panel_filters,'Visible','off');
        set(handles.panel_colorspace,'Visible','off');
    case 'Filtering'
        set(handles.panel_operations,'Visible','off');
        set(handles.panel_radio,'Visible','off');
        op=4;
        set(handles.panel_filters,'Visible','on');
        set(handles.panel_colorspace,'Visible','off');
    case 'Color Space'
        set(handles.panel_operations,'Visible','off');
        set(handles.panel_radio,'Visible','off');
        set(handles.panel_filters,'Visible','off');
        op=5;
        set(handles.panel_colorspace,'Visible','on');
end

% --- Executes during object creation, after setting all properties.
function submenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to submenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_value_Callback(hObject, eventdata, handles)
% hObject    handle to slider_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global img op img2
switch op
    case 0
        val=1*get(hObject,'value')+1;
        R=binariza(img,val);
        axes(handles.axesR);
        imshow(R);
    case 2
        val=.004*get(hObject,'value');
        R=val*img+(1-val)*img2;
        axes(handles.axesR);
        imshow(R);
end

% --- Executes during object creation, after setting all properties.
function slider_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function field_R_Callback(hObject, eventdata, handles)
% hObject    handle to field_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of field_R as text
%        str2double(get(hObject,'String')) returns contents of field_R as a double
%x = get(handles.field_R, 'String');
%set(handles.field_R, 'String', handles.field_R(1:end-1))

% --- Executes during object creation, after setting all properties.
function field_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to field_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function field_G_Callback(hObject, eventdata, handles)
% hObject    handle to field_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of field_G as text
%        str2double(get(hObject,'String')) returns contents of field_G as a double


% --- Executes during object creation, after setting all properties.
function field_G_CreateFcn(hObject, eventdata, handles)
% hObject    handle to field_G (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function field_B_Callback(hObject, eventdata, handles)
% hObject    handle to field_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of field_B as text
%        str2double(get(hObject,'String')) returns contents of field_B as a double


% --- Executes during object creation, after setting all properties.
function field_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to field_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in execute_button.
function execute_button_Callback(hObject, eventdata, handles)
% hObject    handle to execute_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img op imgR
switch op
    case 0
    case 1
        [R,X]=transf_color(img,str2double(get(handles.field_R,'string')),str2double(get(handles.field_G,'string')),str2double(get(handles.field_B,'string')));
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 2
        if get(handles.radio_xor,'Value')==1
            R=booleans(3,img,img2);
        end
        axes(handles.axesR);
        imshow(R);
        imgR=R;
        
end


% --- Executes on button press in load_image_2.
function load_image_2_Callback(hObject, eventdata, handles)
% hObject    handle to load_image_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img2 orImg2 img I2C
[path,user_cance]=imgetfile();
if user_cance
msgbox(sprintf('Error'),'Error','Error');
return
end
img2=imread(path);
%img=im2double(img); %converts to double
orImg2=img2;
[X Y Z]=size(img);
img2=imresize(img2,[X Y]);
axes(handles.img2);
imshow(img2);
I2C=1;


% --- Executes on button press in false_color.
function false_color_Callback(hObject, eventdata, handles)
% hObject    handle to false_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img imgR
R=colorFalso(img);
axes(handles.axesR);
imshow(R);
imgR=R;

% --- Executes on button press in save_image.
function save_image_Callback(hObject, eventdata, handles)
% hObject    handle to save_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imgR;
%imwrite(imgR,'Imagen_GUI.jpg');
imsave(handles.axesR)


% --- Executes when selected object is changed in panel_radio.
function panel_radio_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_radio 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img img2 imgR I2C
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radio_and'
        if I2C==1
            R=booleans(img,img2,1);
            axes(handles.axesR);
            imshow(R);
            imgR=R;
        end
    case 'radio_or'
        if I2C==1
            R=booleans(img,img2,2);
            axes(handles.axesR);
            imshow(R);
            imgR=R;
        end
    case 'radio_xor'
        if I2C==1
            R=booleans(img,img2,3);
            axes(handles.axesR);
            imshow(R);
            imgR=R;
        end
    case 'radio_not'
        R=booleans(img,img2,5);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
end


% --- Executes when selected object is changed in panel_filters.
function panel_filters_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_filters 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img img2 imgR I2C
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radio_sobelx'
        R=filtros(img,[-1 0 1; -2 0 2; -1 0 1]);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_sobely'
        R=filtros(img,[-1 -2 -1; 0 0 0; 1 2 1]);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_sobelxy'
        R=sobelxy(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_laplacian'
        R=filtros(img,[-1 -1 -1; -1 8 -1; -1 -1 -1]);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_kirchhoff'
        R=filtroKirschhoff(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
end


% --- Executes when selected object is changed in panel_colorspace.
function panel_colorspace_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_colorspace 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global img img2 imgR I2C
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radio_xyz'
        R=RGBconvXYZ(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_cmy'
        R=RGBconvCMY(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_yuv'
        R=RGBconvYUV(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_yiq'
        R=RGBconvYIQ(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_hsv'
        R=RGBconvHSV(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_hls'
        R=RGBconvHLS(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_lab'
        R=RGBconvLab(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
    case 'radio_luv'
        R=RGBconvLUV(img);
        axes(handles.axesR);
        imshow(R);
        imgR=R;
end
