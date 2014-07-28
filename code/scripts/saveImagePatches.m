load imagesRegionsLabelsPatches

%icdar2003
disp('icdar2003')
savePatches(icdar2003train,'results/patches/icdar2003/train/');
savePatches(icdar2003test,'results/patches/icdar2003/test/');

%icdar2011
disp('icdar2011')
savePatches(icdar2011train,'results/patches/icdar2011/train/');
savePatches(icdar2011test,'results/patches/icdar2011/test/');

%svt
disp('svt')
savePatches(svttrain,'results/patches/svt/train/');
savePatches(svttest,'results/patches/svt/test/');

ccc
