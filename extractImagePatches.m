load imagesRegionsLabels

%icdar2003
disp('icdar2003');
icdar2003train=extractAllPatches(icdar2003train);
icdar2003test=extractAllPatches(icdar2003test);

%icdar2011
disp('icdar2011');
icdar2011train=extractAllPatches(icdar2011train);
icdar2011test=extractAllPatches(icdar2011test);

%svt
disp('svt');
svttrain=extractAllPatches(svttrain);
svtest=extractAllPatches(svttest);

save imagesRegionsLabelsPatches
