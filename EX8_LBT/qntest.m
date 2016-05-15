function rms = qntest(fun1, fun2, X, step)
% rms = qntest(fun1, fun2, step)
% general function to check the rms from X

Y = fun1(X);
Yq = quantise(Y, step);

Z = fun2(Yq);

rms = std(X(:)-Z(:));

end