function [ a, b, c ] = computeLineThroughTwoPoints( p1, p2 )
%a function that takes two points, (x1,y1) and (x2,y2) it then computes a line in the 
% form ax + by + c = 0
  %using the formula  (y1 - y2)x + (x2 - x1)y + (x1y2 - x2y1) = 0
  % if the user enters two points which are the same the function will
  % return and error statement.
  x1 = p1*[1;0];
  y1 = p1*[0;1];
  x2 = p2*[1;0];
  y2 = p2*[0;1];
  if sqrt((x1 - x2)^2 + (y1 - y2)^2)< .1^8
      'Error two points must be distinct'
  else
  a = (y1 - y2);
  b = (x2 - x1);
  c = (x1*y2 - x2*y1);
  norm = sqrt(a^2 + b^2);
  a = a / norm;
  b = b / norm;
  c = c / norm;

end

