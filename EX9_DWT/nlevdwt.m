function Y = dwtree(X, n)
% Y = dwttree(X, n)
% creates discrete wavelet transform tree with n levels
% n should be an integer between 1 and log_2(length(X))
% X - matrix to be encoded
% Y - image containing the dwttree

l = length(X);

if log(l)/log(2)<n || n<0
    Y = zeros(l);
    'invalid n'
    return;
end

Y = dwt(X);

for i = 1:n-1
    l = l/2;
    t = 1:l;
    Y(t,t) = dwt(Y(t,t));
        
end

end