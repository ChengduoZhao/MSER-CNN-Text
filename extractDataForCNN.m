load imagesRegionsLabelsPatches
clear icdar2003char icdar2003word

%icdar2003
disp('icdar2003')
[icdar2003trainData,icdar2003trainLabels]=extractPatchesLabels(icdar2003train);
clear icdar2003train
[icdar2003testData,icdar2003testLabels]=extractPatchesLabels(icdar2003test);
clear icdar2003test
save('icdar2003','icdar2003trainData','icdar2003trainLabels','icdar2003testData','icdar2003testLabels');
clear icdar2003testData icdar2003testLabels icdar2003trainData icdar2003trainLabels

%icdar2011
disp('icdar2011')
[icdar2011trainData,icdar2011trainLabels]=extractPatchesLabels(icdar2011train);
clear icdar2011train
[icdar2011testData,icdar2011testLabels]=extractPatchesLabels(icdar2011test);
clear icdar2011test
save('icdar2011','icdar2011trainData','icdar2011trainLabels','icdar2011testData','icdar2011testLabels');
clear icdar2011testData icdar2011testLabels icdar2011trainData icdar2011trainLabels

%svt
disp('svt')
[svttrainData,svttrainLabels]=extractPatchesLabels(svttrain);
clear svttrain
[svttestData,svttestLabels]=extractPatchesLabels(svttest);
clear svttest
save('svt','svttrainData','svttrainLabels','svttestData','svttestLabels');
clear svttestData svttestLabels svttrainData svttrainLabels

ccc
