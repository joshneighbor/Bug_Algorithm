function [ dist ] = computeDistancePointToSegment( q,p1,p2 )
%fucntion that take a point(px,py) and line segment defined by two distinct points
% p1( x1, y1) and p2(x2, y2) and returns the distance between the point and
% the line segment. There are 3 options for the shortest distance: either
% it will be a line from the point (px,py) to either of the ends of the
% line segment ie (x1,y1) or (x2,y2) or it will be the orthogonal distance.
% To solve this problem I looked at the triangular area between the point
% (px,py), the end of the segment and the orthogonal point. Basically if the
% triangles created by each end of the segment equaled the overall area of
% trangle created beween the segment and the point(px,py) then the distance
% between the point and the line would be the shortest. A special case
% arrises when the point is inline witht he segment and in this case the
% function will return 0 is the point is on the line segment or the
% shortest distance if it is inline but does not lie on the segment.
    [a,b,c] = computeLineThroughTwoPoints(p1,p2);
    px = q*[1;0];
    py = q*[0;1];
    x1 = p1*[1;0];
    y1 = p1*[0;1];
    x2 = p2*[1;0];
    y2 = p2*[0;1];
    dist1 = (abs(a*px + b*py + c))/(sqrt(a^2 + b^2)); 
    seg = sqrt((x2 - x1)^2 + (y2 - y1)^2); % length of line segment
    dist2 = sqrt((px - x1)^2 + (py - y1)^2); % distance between point and end of line segment
    dist3 = sqrt((px - x2)^2 + (py - y2)^2); % distance between point and other end of line segment
    area1 = (.5*dist1*sqrt(dist2^2 - dist1^2)) + (.5*dist1*sqrt(dist3^2 - dist1^2));
    area2 = .5*dist1*seg;
    B = [x1, x2];
    if abs(area1 - area2)<1E-6 & area1 ~= 0;
        dist = dist1;
    elseif area1 == area2 & area1 == 0 & min(B)< px & px < max(B);
        dist = 0;
    else    
        A = [dist2, dist3];
        dist = min(A);
end

