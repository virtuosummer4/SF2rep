%EX82_script5.m
% Plot pictures and get compressions for 11
% 
% 

N = [4 8 16];
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:));
bitref = getbits(Xq);

s = 1.079;
opt =zeros(length(N),1); 
compr = zeros(length(N),1);
Z = cell(length(N), 1);

for i = 1:length(N)

    fun1 = @(X) lbtfw(X, N(i), s);
    fun2 = @(Yq) lbtbw(Yq, N(i), s);
    
    fun = @(step) qntest(fun1, fun2, X, step);
    
    opt(i) = golden(fun, ref, 0.00001, 20, 30);
    Y = lbtfw(X, N(i), s);
    Y = quantise(Y, opt(i));
    compr(i) = bitref/dctbpp(regroup(Y,N),16);
    Z(i) = {lbtbw(Y, N(i), s)};
end

A = beside(X, hbeside(Z));
figure; draw(A);
[N; opt'; compr']