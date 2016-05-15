function bits = getbits(X)
% returns bits needed to encode X.
%

bits = bpp(X)*numel(X);