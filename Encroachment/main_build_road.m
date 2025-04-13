clc;
clear all;
close all;
%%
imageFolderTrain = fullfile('E:\sai_tech\Pooja\Encroachment\train1');
labelFolderTrain = fullfile('E:\sai_tech\Pooja\Encroachment\PixelLabelData')
%%
imdsTrain = imageDatastore(imageFolderTrain);
%%
classNames = ["road" "building"];
labels = 1:2;
pxdsTrain = pixelLabelDatastore(labelFolderTrain,classNames,labels)
%%
pximdsTrain = pixelLabelImageDatastore(imdsTrain,pxdsTrain);
tbl = countEachLabel(pxdsTrain)
%%
numberPixels = sum(tbl.PixelCount);
frequency = tbl.PixelCount / numberPixels;
classWeights = 0.7561;
%%
inputSize = [256 256 1];
filterSize = 3;
numFilters = 256;
numClasses = numel(classNames);

layers = [
    imageInputLayer(inputSize)
    
    convolution2dLayer(filterSize,numFilters,'DilationFactor',1,'Padding','same')
    batchNormalizationLayer
    reluLayer
    convolution2dLayer(filterSize,numFilters,'DilationFactor',2,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(filterSize,numFilters,'DilationFactor',4,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(1,numClasses)
    softmaxLayer
    pixelClassificationLayer('Classes',classNames)];
options = trainingOptions('sgdm', ...
    'MaxEpochs', 50, ...
    'MiniBatchSize', 64, ... 
    'InitialLearnRate', 1e-3);
net = trainNetwork(pximdsTrain,layers,options);
%%
%testing the image
I = imread('E:\sai_tech\Pooja\Encroachment\saidapet road buf.png');
% I=imresize(I,[256 256]);
% I=rgb2gray(I);
figure
imshow(I)
C1 = semanticseg(I,net,'MiniBatchSize',32);
%C=imread('C:\Users\vinot\Downloads\ML data\ML data\PixelLabelData\Label_1.png');
load C.mat;
B = labeloverlay(I, C);
figure
imshow(B)
