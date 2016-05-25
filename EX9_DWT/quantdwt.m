function [Yq, dwtent, dwtbits] = quantdwt(Y, n, dwtstep)
% dwtent = quantdwt(Y, step, dwtstep)
% n - number of levels in Y.
%  dwtstep matrix. size = [3, n+1]
%  dwtent matrix

%if ~exist('dwtstep', 'var') dwtstep = ones(3, n+1); end

dwtent = zeros(3, n+1);
dwtbits = zeros(3, n+1);

% get length of first level submatrices
l = length(Y);
Yq = Y;

for i = 1:n
    l = l/2;
    t0 = 1:l; t1 = l+1:2*l;
    Yq(t0,t1) = quantise(Y(t0,t1),dwtstep(1,i));
    Yq(t1,t0) = quantise(Y(t1,t0),dwtstep(2,i));
    Yq(t1,t1) = quantise(Y(t1,t1),dwtstep(3,i));
    dwtent(1,i) = bpp(Yq(t0,t1));
    dwtent(2,i) = bpp(Yq(t1,t0));
    dwtent(3,i) = bpp(Yq(t1,t1));
    dwtbits(:,i)= dwtent(:,i).*l^2;
end
Yq(t0,t0) = quantise(Y(t0,t0), dwtstep(1, n+1));
dwtent(1,n+1) = bpp(Yq(t0,t0));
dwtbits(1,n+1)= dwtent(1,n+1)*l^2;

end

