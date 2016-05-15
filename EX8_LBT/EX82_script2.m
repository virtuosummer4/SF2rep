%EX82_script2.m
% Find optimum s for optimum compresion.
% 
% 
N = 8;
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:));
bitref = getbits(Xq);


fun1 = @(s) ( @(x) lbtfw(x, N, s));
fun2 = @(s) ( @(Yq) lbtbw(Yq, N, s));

fun3 = @(s) ( @(step) qntest(fun1(s), fun2(s), X, step));

fun4 = @(s) golden(fun3(s), ref, 0.00001, 20, 30);

opts = golden(fun4, 100, 0.00001, 1.05, 1.15);
opt = fun4(opts);

Y = lbtfw(X, N, opts);
Y = quantise(Y, opt);
compr = bitref/dctbpp(regroup(Y,N),N);
[opts opt compr] %#ok<NOPTS>