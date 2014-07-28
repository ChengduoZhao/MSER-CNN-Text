function [ cnn,error ] = medalCNN( trainData,trainLabel,testData,testLabel,epochs )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    dataSize = [32,32,1];  % [nY x nX x nChannels]

    arch = {struct('type','input','dataSize',dataSize), ...
            struct('type','conv','filterSize',[9 9], 'nFM', 6), ...
            struct('type','subsample','stride',[2 2]), ...
            struct('type','conv','filterSize',[5 5], 'nFM',12), ...
            struct('type','subsample','stride',2), ...
            struct('type','output', 'nOut', 2)};

    cnn = mlcnn(arch);
    cnn.batchSize = 10;
    cnn.nXVal = 0;  % ADJUST FOR CROSSVALIDATION
    cnn.costFun = 'xent';
    cnn.nEpoch = epochs;

    cnn = cnn.train(trainData,trainLabel);

    er_train= cnn.test(trainData,trainLabel,'classerr');
    fprintf('Classification error (train): cr = %2.2f%%\n',er_train);
    
    er_test = cnn.test(testData,testLabel,'classerr');
    fprintf('Classification error (test): cr = %2.2f%%\n',er_test);
    
    error=er_test;
    
end
