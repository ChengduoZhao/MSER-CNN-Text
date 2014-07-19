function plotRegions( regions, color )
%plotRegions Summary of this function goes here
%   Detailed explanation goes here
    numRegions=size(regions,1);
    for i=1:numRegions
        if regions(i,3)<=0 || regions(i,4)<=0
            regions(i,:)
            continue
        end
        rectangle('Position',regions(i,:),'EdgeColor',color);
    end

end

