function [ data,label ] = prepareForDeepLearn( data,label )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

    numSamples=size(data,3);
    data=normalizeData(data);
    data=reshape(data,32,32,numSamples);
    labelNew=zeros(2,numSamples);
    labelNew(1,:)=label==1;
    labelNew(2,:)=label==0;
    label=labelNew;

end

