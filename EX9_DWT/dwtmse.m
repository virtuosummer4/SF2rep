function dwtstepq = dwtmse(n, l)
% dwtstep = dwtmse(n)
% generates step coefficients for discrete wavelet transform mse scheme.
% l = length(Y) for the matrix to be quantised. defaults to 256
% assumes a square matrix
if ~exist('l', 'var') l = 256; end

Y = zeros(l);
% leave for later, look at the function created to generate the mse
% coefficients for the Laplacian pyramid.

'NOT FINISHED'



end