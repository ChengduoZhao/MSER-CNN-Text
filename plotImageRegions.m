load('imageConfigRegionsLabels.mat');

%icdar2003
disp('icdar2003train')
plotAllRegions(icdar2003train,'~/Projects/MSER-CNN/results/regions/icdar2003/train/')
disp('icdar2003test')
plotAllRegions(icdar2003test,'~/Projects/MSER-CNN/results/regions/icdar2003/test/')

%icdar2011
disp('icdar2011train')
plotAllRegions(icdar2011train,'~/Projects/MSER-CNN/results/regions/icdar2011/train/')
disp('icdar2011test')
plotAllRegions(icdar2011test,'~/Projects/MSER-CNN/results/regions/icdar2011/test/')

%svt
disp('svttrain')
plotAllRegions(svttrain,'~/Projects/MSER-CNN/results/regions/svt/train/')
disp('svttest')
plotAllRegions(svttest,'~/Projects/MSER-CNN/results/regions/svt/test/')

ccc
