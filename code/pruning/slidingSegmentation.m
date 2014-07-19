function [ regionList ] = slidingSegmentation( regionList )
%slidingWindowSegmentation Summary of this function goes here
%   Detailed explanation goes here
    numRegions=size(regionList,1);
    valid=true(1,numRegions);
    valid( regionList(:,3)>1.5*regionList(:,4) )=0;
    invalidRegions=regionList(~valid,:);
    regionList=regionList(valid,:);
    
    xs=invalidRegions(:,1); ys=invalidRegions(:,2);
    w=invalidRegions(:,3); h=invalidRegions(:,4);
    stepSize=10*ceil((w(:)-h(:))./h(:));
    
    for i=1:size(invalidRegions,1)   
        xSegment=xs(i):stepSize(i):(xs(i)+w(i)-h(i));
        numSegments=length(xSegment);
        ySegment=ys(i)*ones(1,numSegments);
        wSegment=h(i)*ones(1,numSegments);
        hSegment=h(i)*ones(1,numSegments);
        newSegments=[xSegment',ySegment',wSegment',hSegment'];
        regionList=[regionList;newSegments];
    end

end

