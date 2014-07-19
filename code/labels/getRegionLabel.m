function [ label ] = getRegionLabel( regionList1, regionList2, threshold )
%getRegionLabel Summary of this function goes here
%   Detailed explanation goes here
    numRegions1=size(regionList1,1);
    numRegions2=size(regionList2,1);
    overlap=zeros(numRegions1,numRegions2);
    for i=1:numRegions2
        overlap(:,i)=getOverlap(regionList1,regionList2(i,:));
    end
    label=(overlap>threshold);

end

