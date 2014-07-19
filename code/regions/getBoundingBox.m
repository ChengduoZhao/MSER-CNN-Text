function [ boundingBox ] = getBoundingBox(pixelList)
%boundingBox    Returns bounding box for given pixel list

        %calculate minimum and maximum coordinate pairs
        maxPixel=max(pixelList(:,:));
        minPixel=min(pixelList(:,:));
        
        %compute rectangle parameters
        minX=minPixel(1);
        minY=minPixel(2);
        width=maxPixel(1)-minPixel(1);
        height=maxPixel(2)-minPixel(2);
    
        %create rectangle from parameters
        boundingBox=[minX minY width height];
end
