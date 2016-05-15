%EX73_Script2
%
% optimise dct to step 17

Y=d2ct(X,C8);
N=8;

Xq = quantise(X,17);
cmp = std(X(:)-Xq(:));


fun = @(step) quandct(X,C8, step);

opt = golden(fun, cmp);

Yq = quantise(Y, opt);
Yr = regroup(Yq,N);

bitscomp = getbits(Xq);
bitsenc = dctbpp(Yr,N);

compr = bitscomp/bitsenc