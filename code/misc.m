%Scripts for displaying and for permutation and for extraction.
%Use if required by copying from here. This file is not a script so do not
%run it as it is.

%Display Script
    %Disply image and superimpose regions/subimages
    %Not colour coded according to labels here
    imshow(imgRGB,'InitialMagnification','fit','Border','tight')
    hold on
    for k=1:length(LabelRegionImage)
            rectangle('Position',LabelRegionImage(k).region);
    end
    
    %User input required to proceed to next image and refresh the figure
    pause
    clf
    
%Permutation Script    
    %calculate number of regions
    num=length(LabelRegionImage);
    %generate random permutation of size num
    randomOrder=randperm(num);
    %permute structure array
    LabelRegionImagePermuted=LabelRegionImage(randomOrder);
    
%Extraction Script
    imageArray=[LabelRegionImage.image];
    regionArray=[LabelRegionImage.region];
    labelXMLArray=[LabelRegionImage.labelXML];
    labelCNNArray=[LabelRegionImage.labelCNN];
    
    