function [ regionList ] = nonMaximaSuppression( regionList )
%regionList Summary of this function goes here
%   Detailed explanation goes here
    regionList(:,5)=regionList(:,3).*regionList(:,4);
    regionList(:,6)=1;

    [~,order]=sort(regionList(:,5),'descend');
    regionList=regionList(order,:); 
    numRegions=size(regionList,1);
    valid=true(1,numRegions);
     
    xs=regionList(:,1); xe=regionList(:,3)+regionList(:,1); 
    ys=regionList(:,2); ye=regionList(:,4)+regionList(:,2);
    
    for i=1:numRegions,
        for j=(i+1):numRegions
            % calculate intersection explicitly instead of using rectint
            % to get faster performance in O(n^2) bottleneck here
            if valid(j)==0, continue; end
            iw=min(xe(i),xe(j))-max(xs(i),xs(j)); 
            if(iw<=0), continue; end 
            ih=min(ye(i),ye(j))-max(ys(i),ys(j)); 
            if(ih<=0), continue; end 
            intersectionArea=iw*ih;
            unionArea=regionList(i,5)+regionList(j,5)-intersectionArea;
            overlap=intersectionArea/unionArea;
            if overlap>0.50,
                valid(j)=0;
            end
        end
    end
    regionList=regionList(valid>0,1:4);
    
end

