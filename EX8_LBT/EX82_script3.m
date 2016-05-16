%EX82_script3.m
% Plot pictures for 9
% 
% 

N = 8;
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:));
bitref = getbits(Xq);

s = [1, 1.3354, sqrt(2), 2];
opt =zeros(length(s),1); 
compr = zeros(length(s),1);
Z = cell(length(s), 1);

for i = 1:length(s)

    fun1 = @(X) lbtfw(X, N, s(i));
    fun2 = @(Yq) lbtbw(Yq, N, s(i));
    
    fun = @(step) qntest(fun1, fun2, X, step);
    
    opt(i) = golden(fun, ref, 0.00001, 20, 30);
    Y = lbtfw(X, N, s(i));
    Y = quantise(Y, opt(i));
    compr(i) = bitref/dctbpp(regroup(Y,N),N);
    Z(i) = {lbtbw(Y, N, s(i))};
end

A = beside(X, hbeside(Z));
figure; draw(A);