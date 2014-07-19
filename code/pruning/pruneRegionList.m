function [ regionList ] = pruneRegionList( regionList )
%pruneRegionList Summary of this function goes here
%   Detailed explanation goes here
    regionList=aspectRatioPrune(regionList);
    regionList=nonMaximaSuppression(regionList);
    regionList=slidingSegmentation(regionList);

end

