function [ imageConfig ] = extractAllPatches( imageConfig )
%extractAllPatches Summary of this function goes here
%   Detailed explanation goes here
    numImages=length(imageConfig);
    for i=1:numImages
        disp(i)
        image=imread(imageConfig(i).name);
        image=rgb2gray(image);
        imageConfig(i).patches=extractPatch(image,imageConfig(i).regions);
    end

end

