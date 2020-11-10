 digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos',...
    'nndatasets','binary');
digitData = imageDatastore(digitDatasetPath,...
        'IncludeSubfolders',true,'LabelSource','foldernames');
    auimds = augmentedImageDatastore([64 64 1],digitData);
figure;
perm = randperm(167,20);
for i = 1:20
    subplot(4,5,i);
    imshow(digitData.Files{perm(i)});
end
digitData.countEachLabel
trainingNumFiles = 15;
rng(1) % For reproducibility
[trainDigitData,testDigitData] = splitEachLabel(digitData,...
				trainingNumFiles,'randomize');
            layers = [imageInputLayer([64 64 1]);
          convolution2dLayer(7,70,'Padding',1,'stride',1);
          batchNormalizationLayer;
          leakyReluLayer();
          dropoutLayer(0.3);
          maxPooling2dLayer(2,'Stride',2);
          convolution2dLayer(7,70,'Padding',1,'stride',1);
          batchNormalizationLayer;
          fullyConnectedLayer(8);
          softmaxLayer();
          classificationLayer()];
      options = trainingOptions('sgdm','MaxEpochs',200,...
	'InitialLearnRate',0.001,'ValidationData',{testDigitData,testDigitData.Labels},'ValidationFrequency',20,'Plots','training-progress');
[convnet]= trainNetwork(auimds,layers,options);
YTest = classify(convnet,testDigitData);
TTest = testDigitData.Labels;
accuracy = sum(YTest == TTest)/numel(TTest)