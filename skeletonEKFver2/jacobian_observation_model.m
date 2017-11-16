% function H = jacobian_observation_model(mu_bar,M,j,z,i)
% This function is the implementation of the H function
% Inputs:
%           mu_bar(t)   3X1
%           M           2XN
%           j           1X1 which M column
%           z_hat       2Xn
%           i           1X1  which z column
% Outputs:  
%           H           2X3
function H = jacobian_observation_model(mu_bar,M,j,z_hat,i)
% Fill In This Part
z1=z_hat(1, i);
mx=M(1, j);
my=M(2, j);
mux=mu_bar(1);
muy=mu_bar(2);
H=[(mux-mx)/z1,(muy-my)/z1,0; -(muy-my)/z1^2,(mux-mx)/z1^2,-1];
end
