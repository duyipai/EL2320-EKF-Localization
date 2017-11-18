% function [c,outlier, nu_bar, H_bar] = batch_associate(mu_bar,sigma_bar,z,M,Lambda_m,Q)
% This function should perform the maximum likelihood association and outlier detection.
% Note that the bearing error lies in the interval [-pi,pi)
%           mu_bar(t)           3X1
%           sigma_bar(t)        3X3
%           Q                   2X2
%           z(t)                2Xn
%           M                   2XN
%           Lambda_m            1X1
% Outputs: 
%           c(t)                1Xn
%           outlier             1Xn
%           nu_bar(t)           2nX1
%           H_bar(t)            2nX3
function [c,outlier, nu_bar, H_bar] = batch_associate(mu_bar,sigma_bar,z,M,Lambda_m,Q)
% FILL IN HERE
c=zeros(1,length(z));
outlier=size(c);
nu_bar=zeros(length(z)*2, 1);
H_bar=zeros(length(nu_bar), 3);
for k=1:length(c)
    [ct,ot,nut,~,Ht]=associate(mu_bar, sigma_bar, z(:,k), M, Lambda_m, Q);
    c(k)=ct;
    outlier(k)=ot;
    nu_bar(2*k-1:2*k)=reshape(nut(:,ct), 2, 1);
    H_bar(2*k-1:2*k,:)=reshape(Ht(:,:,ct), 2, 3);
end
end