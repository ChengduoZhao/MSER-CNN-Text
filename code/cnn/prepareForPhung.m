function [ data,label ] = prepareForPhung( data,label )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    data=normalizeData(data);
    labelNew=zeros(1,length(label));
    labelNew(label==1)=1;
    labelNew(label==0)=-1;
    label=labelNew;
    
end
