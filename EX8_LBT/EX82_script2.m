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

% matches rms to ref for a given s. outputs the optimum step.
fun4 = @(s) golden1(fun3(s), ref, 0.00001, 23, 27);

% gets the bits needed for encoding
fun5 = @(s) lbtbitsfun(X, N, s, fun4);

% minimises number of bits needed
opts = golden(fun5, 0, 0.0001, 1, 2);
opt = fun4(opts);

Y = lbtfw(X, N, opts);
Y = quantise(Y, opt);
compr = bitref/dctbpp(regroup(Y,N),N);
[opts opt compr] %#ok<NOPTS>