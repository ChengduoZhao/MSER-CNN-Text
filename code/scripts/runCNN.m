
dataset='icdar2003';
library='medal';
epochs=500;

fprintf('Dataset: %s\tLibrary Used: %s\tEpochs: %d\n\n',dataset,library,epochs);

switch dataset
    case 'icdar2003'
        load icdar2003
    case 'icdar2011'
        load icdar2011
    case 'svt'
        load svt
end

switch library
    case 'phung'
        prepareHandle=@prepareForPhung;
        cnnHandle=@phungCNN;
    case 'medal'
        prepareHandle=@prepareForMedal;
        cnnHandle=@medalCNN;
    case 'deeplearn'
        prepareHandle=@prepareForDeepLearn;
        cnnHandle=@deepLearnCNN;
end

[trainData,trainLabels]=prepareHandle(trainData,trainLabels);
[testData,testLabels]=prepareHandle(testData,testLabels);

[cnn,error]=cnnHandle(trainData,trainLabels,testData,testLabels,epochs);

save(['cnn' '_' dataset '_' library '_' num2str(epochs)],'dataset','library','epochs','cnn','error');
