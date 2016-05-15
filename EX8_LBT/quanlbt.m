function rms = quanlbt(X, N, s, step)
%rms = quanlbt(X, N, s)
%
%

Y = lbtfw(X, N, s);
Yq = quantise(Y, step);

Z = lbtbw(Yq, N, s);

rms = std(X(:)-Z(:));

end