function [ imageConfig ] = loadICDAR2011( ICDAR2011Dir )
%loadICDAR2011 Summary of this function goes here
%   Detailed explanation goes here
    listOfImages=dir(fullfile(ICDAR2011Dir,'*.jpg'));
    listOfRects=dir(fullfile(ICDAR2011Dir,'*.txt'));
    
    if length(listOfImages)~=length(listOfRects)
        error('image-groundtruth mismatch');
    end
    imageConfig=struct('name','','groundtruth',[]);
    
    numImages=length(listOfImages);
    for i=1:numImages
        imageConfig(i).name=[ICDAR2011Dir,listOfImages(i).name];
        file=fopen([ICDAR2011Dir,listOfRects(i).name]);
        rectList=textscan(file,'%f %f %f %f %s ' , 'delimiter' , ',' );
        rectList=[rectList{1},rectList{2},rectList{3}-rectList{1},rectList{4}-rectList{2}];
        numRects=size(rectList,1);
        imageConfig(i).groundtruth=zeros(numRects,4);
        for j=1:numRects
            imageConfig(i).groundtruth(j,:)=rectList(j,:);
        end
        
    end
    

end

