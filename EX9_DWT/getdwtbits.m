function bits = getdwtbits(Y, n, dwtstep)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[~, ~, dwtbits] = quantdwt(Y, n, dwtstep);
bits = sum(dwtbits(:));
end

