load imagesRegionsLabelsPatches
clear icdar2003char icdar2003word

%icdar2003
disp('icdar2003')
[trainData,trainLabels]=extractPatchesLabels(icdar2003train);
clear icdar2003train
[testData,testLabels]=extractPatchesLabels(icdar2003test);
clear icdar2003test
save('icdar2003','trainData','trainLabels','testData','testLabels');

%icdar2011
disp('icdar2011')
[trainData,trainLabels]=extractPatchesLabels(icdar2011train);
clear icdar2011train
[testData,testLabels]=extractPatchesLabels(icdar2011test);
clear icdar2011test
save('icdar2011','trainData','trainLabels','testData','testLabels');

%svt
disp('svt')
[trainData,trainLabels]=extractPatchesLabels(svttrain);
clear svttrain
[testData,testLabels]=extractPatchesLabels(svttest);
clear svttest
save('svt','trainData','trainLabels','testData','testLabels');

ccc
