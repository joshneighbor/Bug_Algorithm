function [t_unit] = tangentUnitVector(P,Q)
%input point P and point Q
%output is a unit vector at point Q that is tangent to a circle with center
%point P that passes through Q

[a,b,c] = computeLineThroughTwoPoints(P,Q)
h = a;
l = b;
a = -l;
b = h;
  t_unit = [a;b];