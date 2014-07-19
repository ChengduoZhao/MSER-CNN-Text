function [ imageConfig ] = getAllRegionLabels( imageConfig, threshold )
%getAllRegionLabels Summary of this function goes here
%   Detailed explanation goes here
    numImages=length(imageConfig);
    numRegions=zeros(numImages,1);
    numLocs=zeros(numImages,1);
    for i=1:numImages
        numRegions(i)=size(imageConfig(i).regions,1);
        numLocs(i)=size(imageConfig(i).groundtruth,1);
        imageConfig(i).labels=zeros(1,numRegions(i));
    end
    parfor i=1:numImages
        labels=getRegionLabel(imageConfig(i).groundtruth,imageConfig(i).regions,threshold);
        imageConfig(i).labels=max(labels,[],1);
    end

end
