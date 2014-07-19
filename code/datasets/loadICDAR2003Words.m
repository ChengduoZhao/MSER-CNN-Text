function [ imageList ] = loadICDAR2003Words( ICDAR2003Dir, ICDAR2003XMLFile )
%loadICDAR2003Words Summary of this function goes here
%   Detailed explanation goes here
    try
       ImageTree = xmlread([ICDAR2003Dir,ICDAR2003XMLFile]);
    catch
       error('Failed to read XML file %s.',ICDAR2003XMLFile);
    end

    allImageNodes=ImageTree.getElementsByTagName('image');
    numImages=allImageNodes.getLength;
    imageList=cell(1,numImages);
    
    for i = 0:numImages-1
       thisImageNode = allImageNodes.item(i);
       imageList{i+1}=[ICDAR2003Dir,char(thisImageNode.getAttribute('file'))]; 
    end
end
