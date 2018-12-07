function varargout = demo_app(varargin)
% DEMO_APP MATLAB code for demo_app.fig
%      DEMO_APP, by itself, creates a new DEMO_APP or raises the existing
%      singleton*.
%
%      H = DEMO_APP returns the handle to a new DEMO_APP or the handle to
%      the existing singleton*.
%
%      DEMO_APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO_APP.M with the given input arguments.
%
%      DEMO_APP('Property','Value',...) creates a new DEMO_APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo_app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo_app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo_app

% Last Modified by GUIDE v2.5 26-Jul-2018 03:08:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo_app_OpeningFcn, ...
                   'gui_OutputFcn',  @demo_app_OutputFcn, ...
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


% --- Executes just before demo_app is made visible.
function demo_app_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo_app (see VARARGIN)

% Choose default command line output for demo_app
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo_app wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo_app_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namafile, formatfile] = uigetfile('*.wav');
%nwavfile{1,1} = fullfile(formatfile, filesep, namafile);
fullpathname = strcat(formatfile, namafile);
[sample fs] = audioread(fullpathname);
sideinfo = audioinfo(fullpathname); 

%ekstraksi chroma
[c, s_info] = chroma(sample, fs, sideinfo, 55);
crp = transpose(c);
n = c(:,1:15); 
codeindex_new = n;

%% Inisialisasi
nCodebook = 256; %N Codebook
Coeff = 55; %Coefficient to Keep on CRP
fn = 15; %frame to keep on features
st_tr = xlsread('train.xlsx');
load('Chroma_best');
load('Codeindex_best');

 %% Visualisasi`
    parameter.featureRate = s_info.CRP.featureRate;
    parameter.xlabel = 'Frame [n]';
    parameter.title = 'CRP chromagram';
    visualizeCRP(n,parameter);
    

[Codebook] = Generate_Codeword(Chromas,nCodebook); %pembentukan codeword data latih
save('Codebook_demo','Codebook');

n = transpose(n);  
for i=1:length(n(:,1))
  for j=1:length(Codebook(:,1))
      euqlid(i,j) = sqrt(sum((n(i,:) - Codebook(j,:)) .^ 2));
  end
end

for i=1:length(n(:,1))
  minValue = min(euqlid(i,:));
  [row, column] = find(euqlid == minValue);
  Codeindex_new(1,i) = column(1,1);
end
  Codeindex_neww = repmat(Codeindex_new,60,1);

%% Klasifikasi 
    for i=1:length(codeindex_new)
        [row column] = max(codeindex_new(:,i));
        tone_seq = column;
    end
     likelystates_new = mode(tone_seq);
    
if likelystates_new==1
    class = 'C';
elseif likelystates_new==2
    class = 'C#';
elseif likelystates_new==3
    class = 'D';
elseif likelystates_new==4
    class = 'D#';
elseif likelystates_new==5
    class = 'E';
elseif likelystates_new==6
    class = 'F';
elseif likelystates_new==7
    class = 'F#';
elseif likelystates_new==8
    class = 'G';
elseif likelystates_new==9
    class = 'G#';
elseif likelystates_new==10
    class = 'A';
elseif likelystates_new==11
    class = 'A#';
else 
    class = 'B';
end
set(handles.text10,'string',class);
