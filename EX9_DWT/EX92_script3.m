%Ex93Script_3
% Execute task 14
% dwt and idwt used with default coefficients, hence these are not defined
% here.
%
%
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:));
bitref = getbits(Xq);
layr = 3;
k = 3;

% index 1 - st, index 2 - mse.
step = zeros(3+layr,2);
comp = zeros(3+layr,2);
Z = cell(layr,2);

% run for each n
for n = k:k-1+layr
    % get mse coefficients
    qmse = dwtmse(n);
    % set st coefficients
    qst = ones(3, n+1); qst(2:3, n+1) = inf;
    
    fun1 = @(stp) dwtrms(X, n, qst.*stp);
    fun2 = @(stp) dwtrms(X, n, qmse.*stp);
    step(n,1) = golden(fun1,ref);
    step(n,2) = golden(fun2,ref);
    
    Y = nlevdwt(X,n);
    
    [Yq, ~, bits] = quantdwt(Y, n, qst*stp);
    comp(n, 1) = bitref/sum(bits(:));
    Z(n-k+1,1) = {nlevidwt(Yq,n)};
    
    [Yq, ~, bits] = quantdwt(Y, n, qmse*stp);
    comp(n, 2) = bitref/sum(bits(:));
    Z(n-k+1,2) = {nlevidwt(Yq,n)};
end

Ab = beside(hbeside(Z(:,1))', hbeside(Z(:,2))')';

