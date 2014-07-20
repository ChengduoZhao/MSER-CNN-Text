function [ imageData ] = normalizeData( imageData )
%normalizeData Summary of this function goes here
%   Detailed explanation goes here

    imageMean=mean(imageData,3);
    imageData=bsxfun(@minus,imageData,imageMean);

end
