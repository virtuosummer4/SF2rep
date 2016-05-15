%EX73_Script1
% Execute tasks in the text
Y=colxfm2(X,C8);
N=8;

Yq = quantise(Y, 17);
Yr = regroup(Yq,N);
%figure; draw(Yr/N);

bits1 = dctbpp(Yr, N);
bits2 = bpp(Yr)*numel(Yr);
bitsdiff = bits2-bits1;

[bits1 bits2 bitsdiff]