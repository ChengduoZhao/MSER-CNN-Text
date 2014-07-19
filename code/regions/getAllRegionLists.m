function [ imageConfig ] = getAllRegionLists( imageConfig )
%getAllRegionLists Summary of this function goes here
%   Detailed explanation goes here
    numImages=length(imageConfig);
    parfor i=1:numImages
        imageConfig(i).regions=[]
    end
    parfor i=1:numImages
        image=imread(imageConfig(i).name);
%         image=imadjust(image,stretchlim(image),[]);
%         %RGB
%         regR=getRegionList(image(:,:,1));
%         regG=getRegionList(image(:,:,2));
%         regB=getRegionList(image(:,:,3));
%         %HSI
%         image=rgb2hsi(image);
%         regH=getRegionList(image(:,:,1));
%         regS=getRegionList(image(:,:,2));
%         regI=getRegionList(image(:,:,3));
%         %Inverse intensity
%         image=imcomplement(image(:,:,3));
%         regInv=getRegionList(image);
%         %Combine and prune
%         imageConfig(i).regions=vertcat(regR,regG,regB,regH,regS,regI,regInv);
        %grayscale
        image=rgb2gray(image);
        image=imadjust(image,stretchlim(image),[]);
        regI=getRegionList(image);
        %complement
        image=imcomplement(image);
        regInv=getRegionList(image);
        %combine and prune
        imageConfig(i).regions=vertcat(regI,regInv);
        imageConfig(i).regions=pruneRegionList(imageConfig(i).regions);
    end

end
