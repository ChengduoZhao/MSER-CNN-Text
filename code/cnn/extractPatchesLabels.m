function [ data, labels] = extractPatchesLabels( imageConfig )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    numImages=length(imageConfig);
    numPatches=0;
    for i=1:numImages
        if size(imageConfig(i).labels,1)==0
            continue
        end
        patches=imageConfig(i).patches;
        numPatches=numPatches+size(patches,3);
    end
    data=zeros(32,32,numPatches);
    labels=zeros(1,numPatches);
    k=1;
    for i=1:numImages
        if size(imageConfig(i).labels,1)==0
            continue
        end
        currentNumPatches=size(imageConfig(i).patches,3);
        data(:,:,k:k+currentNumPatches-1)=imageConfig(i).patches;
        labels(k:k+currentNumPatches-1)=imageConfig(i).labels;
        k=k+currentNumPatches;
    end
    data=uint8(data);
    labels=logical(labels);
end
