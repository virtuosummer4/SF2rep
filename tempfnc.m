function compr = tempfnc(X)

N = 8;
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:));
bitref = getbits(Xq);



    fun1 = @(s) ( @(X) lbtfw(X, N, s));
    fun2 = @(s) ( @(Yq) lbtbw(Yq, N, s));
    
    fun = @(s) ( @(step) qntest(fun1(s), fun2(s), X, step));
    s = 1.1;
    opt = golden(fun(s), ref);
    Y = lbtfw(X, N, s);
    Y = quantise(Y, opt);
    compr = bitref/dctbpp(regroup(Y,N),N);


end   