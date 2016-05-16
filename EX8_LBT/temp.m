N = 8;
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:))

bitref = getbits(Xq);
s = 1;
step = [20:0.01:30];
rms = zeros(length(step),1);
for i = 1:length(step)

    fun1 = @(X) lbtfw(X, N, s);
    fun2 = @(Yq) lbtbw(Yq, N, s);
    
    fun = @(step) qntest(fun1, fun2, X, step);
    
    rms(i) = fun(step(i));
end
figure;
plot(step, rms-ref);