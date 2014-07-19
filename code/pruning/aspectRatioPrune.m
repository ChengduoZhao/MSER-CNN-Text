function [ regionList ] = aspectRatioPrune( regionList )
%aspectRatioPrune Summary of this function goes here
%   Detailed explanation goes here

    
    low=regionList(:,4)./regionList(:,3)<0.1;
    high=regionList(:,3)./regionList(:,4)>10;
    regionList(low|high,:)=[];
    
end
