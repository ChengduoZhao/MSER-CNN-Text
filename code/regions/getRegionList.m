function [ regionList ] = getRegionList( image )
%getRegionList Summary of this function goes here
%   Detailed explanation goes here
    [pixelList,~]=getMSERFeatures...
        (image,'ThresholdDelta',1,...
        'RegionAreaRange',[100 int64((size(image,1)*size(image,2))/10)],...
        'MaxAreaVariation',.5);
    numRegions=length(pixelList);
    regionList=zeros(numRegions,4);
    for k=1:length(pixelList)
        regionList(k,:)=getBoundingBox(pixelList{k});
    end
    regionList=pruneRegionList(regionList);
end
