function [ dist ] = computeDistancePointToLine( q, p1, p2 )
%fuction takes in a point and two distinct points which define a line
%   the function then returns the shortest distance between the
%   distinct point and the line. An error will be returned if the two
%   points creating the line are not distinct.
    px = q*[1;0];
    py = q*[0;1];
    [a,b,c] = computeLineThroughTwoPoints(p1,p2);
    dist = (abs(a*px + b*py + c))/(sqrt(a^2 + b^2));

end

