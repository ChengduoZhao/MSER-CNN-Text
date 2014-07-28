function [ imageData ] = normalizeData( imageData )
%normalizeData Summary of this function goes here
%   Detailed explanation goes here
    iamgeData=double(imageData);
    imageMean=mean(imageData,3);
    imageData=bsxfun(@minus,imageData,imageMean);

end
