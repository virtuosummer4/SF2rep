%EX74_Script1
% same as 73_2, only now optimise for all three and display the results
% optimise dct to step 17
N = [4, 8, 16];
Xq = quantise(X,17);
cmp = std(X(:)-Xq(:));
bitscomp = getbits(Xq);
Zopt = cell(3,1);


for i = 1:3
    
    C = dct_ii(N(i));
    Y=d2ct(X,C);
    
    fun = @(step) quandct(X,C, step);
    opt(i) = golden(fun, cmp);
    
    Yq = quantise(Y, opt(i));
    Yr = regroup(Yq,N(i));
    
    bitsenc(i) = dctbpp(Yr,N(i));
    Zopt(i) = {d2ct(Yq', C')'};
end

compr = bitscomp./bitsenc;

A = beside(beside(X, Xq),hbeside(Zopt));