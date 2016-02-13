function [p_unit] = parallelUnitVector(a,b,c,Q)
%input it a,c,b values of line and point Q
%output is a unit vector at point Q, parallel to line a,b,c
c = a*Q(1) + b*Q(2);
norm = sqrt(a^2 + b^2);
  c = c / norm;
  p_unit = [a;b];