function [ imageConfig ] = loadSVT( SVTDir, SVTXMLFile )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    try
       ImageTree = xmlread(SVTXMLFile);
    catch
       error('Failed to read XML file %s.',SVTXMLFile);
    end

    allImageNodes=ImageTree.getElementsByTagName('image');
    numImages=allImageNodes.getLength;

    imageConfig=struct('name','','groundtruth',[]);
    
    for i = 0:numImages-1
       thisImageNode = allImageNodes.item(i);
       thisImageName=thisImageNode.getElementsByTagName('imageName').item(0);
       imageConfig(i+1).name=[SVTDir,char(thisImageName.getFirstChild.getData)];   
       %Get root taggedRectangles node and construct parse subtree
       thisImageRectNode=thisImageNode.getElementsByTagName('taggedRectangles').item(0);
       thisImageRectList=thisImageRectNode.getElementsByTagName('taggedRectangle');
       numRects=thisImageRectList.getLength;
       imageConfig(i+1).groundtruth=zeros(numRects,4);
       %Parse each tagged rectangle to get coordinates of rectangle
       for j=0:numRects-1
           thisImageRect=thisImageRectList.item(j);
           imageConfig(i+1).groundtruth(j+1,:)=...
               [str2double(char(thisImageRect.getAttribute('x'))),
                str2double(char(thisImageRect.getAttribute('y'))),
                str2double(char(thisImageRect.getAttribute('width'))),
                str2double(char(thisImageRect.getAttribute('height')))];
       end
    end


end

