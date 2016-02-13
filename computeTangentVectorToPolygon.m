function [unit_v] = computeTangentVectorToPolygon(Q,P)
%intput a polygon P and a point Q
%Output the unit length vector u which is tangent to point q in the
[D_poly, D_seg, D_line, Line_parameterA, Line_parameterB, Line_parameterC ] = computeDistancePointToPolygon(Q,P);
[M,I] = min(D_seg);
P = [P P(1,1)]
Q
if M > D_line(I)
    if norm(Q - P{1,I}) < norm(Q - P{1,I+1})
        p = P{1,I};
    else
        p = P{1,I+1};
    end
    [a,b,c] = computeLineThroughTwoPoints(p,Q);
    v = [a;b];
else
    v = [Line_parameterB(I); -Line_parameterA(I)]; %edge
end
unit_v = v
