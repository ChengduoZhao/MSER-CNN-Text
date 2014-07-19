function [ overlap ] = getOverlap( regions,box )
%getOverlap Summary of this function goes here
%   Detailed explanation goes here
    xs = max(regions(:,1), box(1));
    ys = max(regions(:,2), box(2));
    xe = min(regions(:,3)+regions(:,1), box(3)+box(1));
    ye = min(regions(:,4)+regions(:,2), box(4)+box(2));

    iw = xe-xs+1;
    ih = ye-ys+1;
    intersectionArea = iw.*ih;
    areaRegions = regions(:,3) .* regions(:,4);
    areaBox = box(3) * box(4);
    overlap = intersectionArea ./ areaBox;
    overlap(iw <= 0) = 0;
    overlap(ih <= 0) = 0;

end

