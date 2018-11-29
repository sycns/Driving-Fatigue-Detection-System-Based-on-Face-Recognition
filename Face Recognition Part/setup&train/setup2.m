function options = setup2( )
%%  @paths    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cwd=cd;
cwd(cwd=='\')='/';


options.workDir    = cwd;
options.slash      = '/'; %% For linux

%% @library paths %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~isdeployed
    
    %training
    addpath([cwd '/source/train/']);
    
    %testing
    addpath([cwd '/source/test/']);
    
    %common
    addpath([cwd '/common/io/']);
    addpath([cwd '/common/align/']);
    addpath([cwd '/common/string/']);
    addpath([cwd '/common/manifold/']);
    addpath([cwd '/common/err/']);
    addpath([cwd '/common/graphic/']);
    addpath([cwd '/common/vec/']);
    addpath([cwd '/common/desc/']);
    addpath([cwd '/common/regression/']);
    addpath([cwd '/common/flip/']);
    addpath([cwd '/common/eval/']);
    addpath([cwd '/common/fea/hog']);
    %libs
    addpath([cwd '/libs/liblinear-1.93/matlab']);
    
end

%%  @data preparation  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

options.datasetName ='helen'; %%'lfw'; %'lfpw'; %'helen';  %% 'helen' or 'w300'
% addpath('model/lfw/pts');
% load('fs');load('ind');
% 
% pl=1:size(fs,1);
% sind=setdiff(pl,ind);
% 
% options.lfwind = sind;
% options.sts = fs;
% options.trainingImageDataPath = '/home/zhao/lfpw/trainset/';
% options.trainingTruthDataPath = '/home/zhao/lfpw/trainset/';
%                                  
% options.testingImageDataPath  = '/home/hao/lfpw/testset/';
% options.testingTruthDataPath  = '/home/hao/lfpw/testset/';

options.trainingImageDataPath = ['D:/Projects_Face_Detection/Datasets/' options.datasetName '/trainset/'];
options.trainingTruthDataPath = ['D:/Projects_Face_Detection/Datasets/' options.datasetName '/trainset/'];
    
options.testingImageDataPath  = 'D:/Projects_Face_Detection/Datasets/helen/testset/';
options.testingTruthDataPath  = 'D:/Projects_Face_Detection/Datasets/helen/testset/';
%options.testingImageDataPath  = ['D:/Projects_Face_Detection/Datasets/' options.datasetName '/testset/'];
%options.testingTruthDataPath  = ['D:/Projects_Face_Detection/Datasets/' options.datasetName '/testset/'];

options.learningShape     = 0;
options.learningVariation = 0;

options.usedetector = 1;
faceDetector = vision.CascadeObjectDetector();
faceDetector.MinSize = [30 30];
faceDetector.ScaleFactor = 1.2;
faceDetector.MergeThreshold = 3;
options.faceDetector = faceDetector;
options.flipFlag          = 1;   % the flag of flipping

%%  @other folders  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

options.tempPath      = 'temp';
options.modelPath     = 'model';

            
%%  @training configuration  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

options.canvasSize  = [250 250];
options.scaleFactor = 1;
%options.lambda     = [1 2 3 4 5 6 7] * 100;
options.lambda      = [1 1 1 1] * 0.005;

%%  @feature configuration  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

options.descType  = 'xx_sift';
options.descSize  = [20 20 20 20];
options.descScale = [0.16 0.16 0.16 0.16];
options.descBins  =  4;
            
%%  @cascade regression %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

options.n_cascades     = 4;         % the number of cascades

options.n_init_randoms = 10;        % the number of initial randoms

options.n_init_randoms_test = 1;    % the number of initial randoms

%%  @evaluation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%options.pts_eval = [1 3 2 4 9 17 11 12 18 10 19 20 21 23 24 25 28];
%options.pts_eval = 1:49;
%options.pts_eval = 1:68;
options.pts_eval = 1:66;
%options.pts_eval = 1:51;
%options.pts_eval = 1:29;

%% 300-W(LFPW 68 || LFW 66 || helen) dataset (68)
options.inter_ocular_left_eye_idx  = 37:42;
options.inter_ocular_right_eye_idx = 43:48;

%% 300-W dataset (51)
%options.inter_ocular_left_eye_idx  = 20:25;
%options.inter_ocular_right_eye_idx = 26:31;

%options.inter_ocular_left_eye_idx  = 20;
%options.inter_ocular_right_eye_idx = 29;

%% LFPW dataset
% options.inter_ocular_left_eye_idx  = [9 11 13 14 17];
% options.inter_ocular_right_eye_idx = [10 12 15 16 18];



