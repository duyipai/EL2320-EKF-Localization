% function [c,outlier, nu, S, H] = associate(mu_bar,sigma_bar,z_i,M,Lambda_m,Q)
% This function should perform the maximum likelihood association and outlier detection.
% Note that the bearing error lies in the interval [-pi,pi)
%           mu_bar(t)           3X1
%           sigma_bar(t)        3X3
%           Q                   2X2
%           z_i(t)              2X1
%           M                   2XN
%           Lambda_m            1X1
% Outputs: 
%           c(t)                1X1
%           outlier             1X1
%           nu^i(t)             2XN
%           S^i(t)              2X2XN
%           H^i(t)              2X3XN
function [c,outlier, nu, S, H] = associate(mu_bar,sigma_bar,z_i,M,Lambda_m,Q)
% FILL IN HERE
z_hat=zeros(size(M));
H=zeros(2,3,length(M));
S=zeros(2,2,length(M));
nu=zeros(2,length(M));
phi=zeros(length(M),1);
for k=1:length(M)
    z_hat(:,k)=observation_model(mu_bar, M, k);
    H(:,:,k)=jacobian_observation_model(mu_bar, M, k, z_hat, k);
    S(:,:,k)=H(:,:,k)*sigma_bar*H(:,:,k)'+Q;
    nu(:,k)=z_i-z_hat(:,k);
    nu(2,k)=mod(nu(2,k)+pi, 2*pi)-pi;
    phi(k)=det(2*pi*S(:,:,k))^(-1/2)*exp(-1/2*(nu(:,k)')/(S(:,:,k))*nu(:,k));
end
c=find(phi==max(phi));
outlier=0;
if (nu(:,c)'/S(:,:,c)*nu(:,c)>Lambda_m)
   outlier=1;
end
end