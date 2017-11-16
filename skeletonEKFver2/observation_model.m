% function h = observation_model(x,M,j)
% This function is the implementation of the h function.
% The bearing should lie in the interval [-pi,pi)
% Inputs:
%           x(t)        3X1
%           M           2XN
%           j           1X1
% Outputs:  
%           h           2X1
function h = observation_model(x,M,j)
% Fill In This Part
mx=M(1,j);
my=M(2,j);
xx=x(1);
xy=x(2);
xtheta=x(3);
h=[sqrt((mx-xx)^2+(my-xy)^2);mod(atan2(my-xy, mx-xx)-xtheta+pi, 2*pi)-pi];
end