function [ imageConfig ] = renameImageConfig( imageConfig )
%renameImageConfig Summary of this function goes here
%   Detailed explanation goes here
    numImages=length(imageConfig);
    for i=1:numImages
        name=strsplit(imageConfig(i).name,'MSER-CNN');
        imageConfig(i).name=name{2};
    end
end

