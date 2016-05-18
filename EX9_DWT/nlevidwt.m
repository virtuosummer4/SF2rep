function Xr = nlevidwt(Y, n)
% Y = dwttree(X, n)
% decodes a discrete wavelet transform tree with n levels
% n should be an integer between 1 and log_2(length(X))
% also, n should be the same as the one used for encoding.
% Xp - decoded matrix
% Y - image containing the dwttree

l = length(Y);

if log(l)/log(2)<n || n<0
    Xr = zeros(l);
    'invalid n'
    return;
end

Xr = Y;
% get the lowest level
l = l/(2^(n-1));
t = 1:l;
Xr(t,t) = idwt(Y(t,t));

for i = 1:n-1
    l = l*2;
    t = 1:l;
    Xr(t,t) = idwt(Xr(t,t));
end

end