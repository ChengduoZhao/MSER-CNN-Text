function [ cnn,error ] = deepLearnCNN( trainData,trainLabel,testData,testLabel,epochs )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    rand('state',0)

    cnn.layers = {
        struct('type', 'i') %input layer
        struct('type', 'c', 'outputmaps', 6, 'kernelsize', 5) %convolution layer
        struct('type', 's', 'scale', 2) %sub sampling layer
        struct('type', 'c', 'outputmaps', 12, 'kernelsize', 5) %convolution layer
        struct('type', 's', 'scale', 2) %subsampling layer
    };

    opts.alpha = 1;
    opts.batchsize = 100;
    opts.numepochs = epochs;

    cnn = cnnsetup(cnn, trainData, trainLabel);
    cnn = cnntrain(cnn, trainData, trainLabel, opts);

    [er_train, ~] = cnntest(cnn, trainData, trainLabel);
    fprintf('Classification error (train): cr = %2.2f%%\n',er_train);
    
    [er_test, ~] = cnntest(cnn, testData, testLabel);
    fprintf('Classification error (test): cr = %2.2f%%\n',er_test);
    
    error=er_test;

end

