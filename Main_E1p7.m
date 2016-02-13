% TEST Code
clear all;
clc

%The following q and P were choosen to highlight several different cases
%that the functions could come across.

%The matrix P is used to define a Polygon with n vertices. P is nx2. The
%polygon vertices tested are choosen to highlight different edge types, including
%vertical edges, horizontal edges, positive and negative slope edges.
%Vertices are entered in a CCW fashion.
P = [0 0; -5 -5; 5 -5; 11 7; 9 10; 6 1; 0 5;];

%The points q are choosen to highlight different cases including being
%close to different edge types, being in the interior or exterior of
%polygon, being on an edge of the polygon, and being at a vertex. Q is a
%collection of m q points to be tested, Q is mx2
Q = [-5 0; -7 -5; 1 -6; 6 -8; 4.5 -1; 5 8; 7 4; 0 2];

%Loop through the q points to get the distance and tangent vector
for i = 1:size(Q,1)
    %Current point q to test
    q = Q(i,:);
    
    %get the distance from q to the polygon
    dist = computeDistancePointToPolygon(q, P);
    
    %get the Vector that is tangent to the closest edge or vetex of the
    %polygon w.r.t the point q
    [u]=computeTangentVectorToPolygon(q, P);
    
    %store the distance values and tangent vectors
    Distance(i) = dist;
    Tangent(:,i) = u;
    
end

%display results
Distance
Tangent

%This is a function I wrote that returns the norm of the row vectors of a
%matrix. mxn matrix returns a mx1 matrix of the norm values for each row.
%In this case, each (tangent) vector should have norm 1.
rownorm(Tangent')