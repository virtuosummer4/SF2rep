function opt = golden1(fun, comp, err, min, max)
% OPTMSE implement golden section search to find best step size
% same as GOLDEN. Separated for debugging purposes
if ~exist('min','var') min = 1; end
if ~exist('max','var') max = 100; end
if ~exist('err','var') err = 0.0001; end

Maxit = 1000;
p=1.618034;%golden ratio


% Allocate points
A = min;
D = max;
B = D-(D-A)/p;
C = A+(D-A)/p;

fb = abs(fun(B)-comp);

fc = abs(fun(C)-comp);

%rms = quantest(X, stg, D, false);
%fd = rms(3);

diff = D-A;
it = 0;
while diff>err && it<Maxit
    if fc>fb
        D=C;
        C=B; fc=fb;
        B=D-(D-A)/p;
        fb = abs(fun(B)-comp);
    else
        A=B;
        B=C; fb=fc;
        C = A+(D-A)/p;
        fc = abs(fun(C)-comp);
    end
    diff = D-A;
    it = it+1;
end
if it==Maxit
    'iterations maxed out' %#ok<NOPRT>
end
opt = (B+C)/2;
end

