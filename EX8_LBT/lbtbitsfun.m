function bits = lbtbitsfun(X, N, s, funstep)
% bits = lbtbitsfun(X, N, s, funstep)
% Returns the compression of an LBT scheme.
% funstep - function that returns the step se, given s.
%

step = funstep(s);

Y = lbtfw(X,N,s);
Yq = quantise(Y, step);

bits = dctbpp(regroup(Yq,N),N);

end