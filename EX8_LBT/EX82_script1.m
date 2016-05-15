%EX82_script1.m
%
% 
% 
N = 8;
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:));
bitref = getbits(Xq);

s = [1.05:0.0001:1.15];
opt =zeros(length(s),1); 
compr = zeros(length(s),1);

for i = 1:length(s)

    fun1 = @(X) lbtfw(X, N, s(i));
    fun2 = @(Yq) lbtbw(Yq, N, s(i));
    
    fun = @(step) qntest(fun1, fun2, X, step);
    
    opt(i) = golden(fun, ref, 0.00001, 20, 30);
    Y = lbtfw(X, N, s(i));
    Y = quantise(Y, opt(i));
    compr(i) = bitref/dctbpp(regroup(Y,N),N);
end
figure;
subplot(1,2,1); plot(s, opt);
xlabel('s'); ylabel('step size');
subplot(1,2,2); plot(s, compr);
xlabel('s'); ylabel('compression');