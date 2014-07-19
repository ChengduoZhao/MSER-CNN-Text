load('imageConfigInitial.mat');

%icdar2003
disp('icdar2003train')
icdar2003train=getAllRegionLists(icdar2003train);
icdar2003train=getAllRegionLabels(icdar2003train,0.75);
disp('icdar2003test')
icdar2003test=getAllRegionLists(icdar2003test);
icdar2003test=getAllRegionLabels(icdar2003test,0.75);

%icdar2011
disp('icdar2011train')
icdar2011train=getAllRegionLists(icdar2011train);
icdar2011train=getAllRegionLabels(icdar2011train,0.75);
disp('icdar2011test')
icdar2011test=getAllRegionLists(icdar2011test);
icdar2011test=getAllRegionLabels(icdar2011test,0.75);

%SVT
disp('svttrain')
svttrain=getAllRegionLists(svttrain);
svttrain=getAllRegionLabels(svttrain,0.75);
disp('svttest')
svttest=getAllRegionLists(svttest);
svttest=getAllRegionLabels(svttest,0.75);

save('imageConfigRegionsLabels.mat');
