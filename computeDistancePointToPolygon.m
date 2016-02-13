function [D_poly, D_seg, D_line, Line_parameterA, Line_parameterB, Line_parameterC ] = computeDistancePointToPolygon( Q, P)
%input a polygon P and a point q
%output the distance from q to the closest point  in P
h = 1;
for i = 1:max(size(P(1,:)))  
    %current line/segment to be tested
    p1 = P{1,h};
    h = h + 1; if h > max(size(P(1,:))); h = 1; end % last point must be related to first point to create final line/seg
    p2 = P{1,h};
    
    %get normalized parameters of the line, ax + by + c = 0
    [a,b,c] = computeLineThroughTwoPoints(p1, p2);
    
    %store the parameters
    Line_parameterA(i) = a;
    Line_parameterB(i) = b;
    Line_parameterC(i) = c;
    
    for j = 1:size(Q,1)
        %current q to be tested
        q = Q(j,:);

        %get the distance from q to the line defined by p1 and p2.
        distance_line = computeDistancePointToLine(q, p1, p2);

        %get the distance from q to the segment defined by p1 and p2.
        distance_seg = computeDistancePointToSegment(q, p1, p2);
        
        %store the distance
        D_line(i,j) = distance_line;
        D_seg(i,j) = distance_seg;
        
    end
end
D_poly = min(D_seg);
%Display parameters and distances
Line_parameterA;
Line_parameterB;
Line_parameterC;
D_line;
D_seg;
D_poly
