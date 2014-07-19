function [ patches ] = extractPatch( image, regions )
%extractPatch Summary of this function goes here
%   Detailed explanation goes here
    numRegions=size(regions,1);
    patches=zeros(32,32,numRegions);
    for i=1:numRegions
        imagePatch=imcrop(image,regions(i,:));
        imagePatch=imresize(imagePatch,[32 32]);
        imagePatch=reshape(imagePatch,32,32,1);
        patches(:,:,i)=(imagePatch);
    end
    patches=uint8(patches);
end

