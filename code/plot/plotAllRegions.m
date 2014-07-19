function plotAllRegions( imageConfig, path )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    numImages=length(imageConfig);
    for i=1:numImages
        image=imread(imageConfig(i).name);
        clf
        imshow(image);
        hold all
        plotRegions(imageConfig(i).groundtruth,'b');
        regions=imageConfig(i).regions;
        posRegions=regions(imageConfig(i).labels==1,:);
        negRegions=regions(imageConfig(i).labels==0,:);
        if size(posRegions,1)<size(negRegions,1)
            negRegions=negRegions(randperm(size(negRegions,1)),:);
            negRegions=negRegions(1:size(posRegions,1),:);
        end
        plotRegions(posRegions,'g');
        plotRegions(negRegions,'r');
        hgexport(gcf, [path num2str(i) '.jpg'], hgexport('factorystyle'), 'Format', 'jpeg');
    end

end

