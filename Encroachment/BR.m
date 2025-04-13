clc;
clear all;
close all;
%%
imageFolderTrain = fullfile('D:\SPAB\Semester 8\THESIS_2020BPLN019\MATLAB\Encroachment\Encroachment\train');
labelFolderTrain = fullfile('D:\SPAB\Semester 8\THESIS_2020BPLN019\MATLAB\Encroachment\Encroachment\PixelLabelData_2');
%%
imdsTrain = imageDatastore(imageFolderTrain);
%%
classNames = ["building" "road" ];
pixelLabelIds = 1:2;
pxdsTrain = pixelLabelDatastore(labelFolderTrain,classNames,pixelLabelIds);
%%
pximdsTrain = pixelLabelImageDatastore(imdsTrain,pxdsTrain);
tbl = countEachLabel(pxdsTrain)
%%
imageSize = [256,256,1];
numClasses = numel(classNames);
lgraph = unetLayers(imageSize, numClasses)
disp(lgraph.Layers)
options = trainingOptions('sgdm', ...
    'InitialLearnRate',1e-3, ...
    'MaxEpochs',15, ...
    'VerboseFrequency',1);
net = trainNetwork(pximdsTrain,lgraph,options);
%%
%testing the image
I = imread('D:\SPAB\Semester 8\THESIS_2020BPLN019\MATLAB\Encroachment\Encroachment\saidapet road buf.png');
I=imresize(I,[256 256]);
figure
imshow(I)
pxdsResults = semanticseg(I,net,"WriteLocation",tempdir);
%%
%original
C1=imread('D:\SPAB\Semester 8\THESIS_2020BPLN019\MATLAB\Encroachment\Encroachment\PixelLabelData_2\Label_1.png');
B = labeloverlay(I, C1);
figure
imshow(B)
%%
%test image
load pxdsresults.mat;
B1 = labeloverlay(I, C);
figure
imshow(B1)
%%
%evaluation
ssimval = ssim(B1,B);
disp('Structural Similarity Value is');
disp(ssimval);
dice_score =( dice(double(B1),double(B)));
disp('The dice score is');
disp(mean(dice_score==1));
jacrd =( jaccard(double(B1),double(B)));
disp('The Jaccard score is');
disp(mean(jacrd==1));
