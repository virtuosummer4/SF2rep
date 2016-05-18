function [rms Z] = dwtrms(X, n, steps) 
%
% Returns rms error between X and quantised DWT.
%

Y = nlevdwt(X,n);

Yq = quantdwt(Y,n,steps);

Z = nlevidwt(Yq, n);

rms = std(X(:)-Z(:));


end