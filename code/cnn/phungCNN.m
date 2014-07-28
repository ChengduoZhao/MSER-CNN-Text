function [ cnn,error ] = phungCNN( trainData,trainLabel,testData,testLabel, epochs )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    H = 32;    % height of 2-D input
    W = 32;    % width of 2-D input

    cm1 = cnn_cm('full', 1, 2);  % input to layer C1 C1 has 2 planes
    cm2 = cnn_cm('1-to-1', 2);   % C1 to S2
    cm3 = [1 1 0 0 1; 0 0 1 1 1];% S2 to layer C3
    cm4 = cnn_cm('1-to-1', 5);   % C3 to S4
    cm5 = cnn_cm('1-to-1', 5);   % S4 to C5
    cm6 = cnn_cm('full',5,1);    % C5 to F6
    c = {cm1, cm2, cm3, cm4, cm5, cm6};

    rec_size = [5 5;   % C1
                2 2;   % S2
                3 3;   % C3
                2 2;   % S4
                0 0;   % C5 auto calculated
                0 0];  % F6 auto calculated

    tf_fcn = {'tansig',  % layer C1 
              'purelin', % layer S2 
              'tansig',  % layer C3 
              'purelin', % layer S4 
              'tansig',  % layer C5 
              'tansig'};  % layer F6 output

    train_method = 'rprop';

    net = cnn_new([H W], c, rec_size, tf_fcn, train_method);
    
    net.train.epochs = epochs;
    [cnn, tr] = cnn_train(net, trainData, trainLabel); 

    y = cnn_sim(cnn, trainData);
    er_train = 1 - sum((y >0) == (trainLabel >=0))/length(trainLabel);
    fprintf('Classification error (train): cr = %2.2f%%\n',er_train);

    y_test = cnn_sim(cnn,testData); 
    er_test = 1 - sum((y_test >0)==(testLabel>=0))/length(testLabel);
    fprintf('Classification error (test): cr = %2.2f%%\n',er_test);
    
    error=er_test;

end
