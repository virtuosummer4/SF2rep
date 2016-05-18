function dwtstepq = dwtmse(n, l, drw)
% dwtstep = dwtmse(n)
% generates step coefficients for discrete wavelet transform mse scheme.
% l = length(Y) for the matrix to be quantised. defaults to 256
% assumes a square matrix
if ~exist('l', 'var') l = 256; end
if ~exist('drw', 'var') drw  = false; end

E = zeros(3, n+1);
dwtstepq = zeros(3, n+1);

Y = zeros(l);
Yi = Y;
% leave for later, look at the function created to generate the mse
% coefficients for the Laplacian pyramid.
l = l/2;
for i = 1:n
    t0 = round(l/2); t1 = l+t0;
    % k=1
    Yi(t0,t1) = 100;
    Z = nlevidwt(Yi,i);
    E(1, i) = energy(Z);
    Yi(t0,t1) = 0;
    % k=2
    Yi(t1,t0) = 100;
    Z = nlevidwt(Yi,i);
    E(2, i) = energy(Z);
    Yi(t1,t0) = 0;
    % k=3
    Yi(t1,t1) = 100;
    Z = nlevidwt(Yi,i);
    E(3, i) = energy(Z);
    Yi(t1,t1) = 0;
    % l for next itteration
    l=l/2;
end
t0=round(l/2);
Yi(t0,t0) = 100;
Z = nlevidwt(Yi,n);
E(1, n+1) = energy(Z);
dwtstepq = sqrt(E(1,1)./E);

if drw
    figure; 
    plot([1:n+1]',E');
    figure;
    plot([1:n+1]',dwtstepq');
end


end