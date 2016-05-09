function [opt rms3 compr] = optmse(X, stg, comp, err, min, max)
% OPTMSE implement golden section search to find best step size

if ~exist('min','var') min = 1; end
if ~exist('max','var') max = 100; end
if ~exist('err','var') err = 0.0001; end
if ~exist('comp', 'var') 
Xq = quantise(X, 17);
comp = std(X(:)-Xq(:)); % rms error X -> Xq
end

Maxit = 1000;
p=1.618034;%golden ratio

h = [1 4 6 4 1]/16;

% Allocate points
A = min;
D = max;
B = D-(D-A)/p;
C = A+(D-A)/p;

R = sqrt(LapIR(stg,h));
R = R./R(1);% adjust to get ratios

fb = abs(quantest2(X, stg, B, R, false)-comp);

fc = abs(quantest2(X, stg, C, R, false)-comp);

%rms = quantest(X, stg, D, false);
%fd = rms(3);

diff = D-A;
it = 0;
while diff>err && it<Maxit
    if fc>fb
        D=C;
        C=B; fc=fb;
        B=D-(D-A)/p;
        fb = abs(quantest2(X, stg, B, R, false)-comp);
    else
        A=B;
        B=C; fb=fc;
        C = A+(D-A)/p;
        fc = abs(quantest2(X, stg, C, R, false)-comp);
    end
    diff = D-A;
    it = it+1;
end
if it==Maxit
    'iterations maxed out' %#ok<NOPRT>
end
opt = (B+C)/2;

rms3 = quantest2(X, stg, opt, R, false)-comp;
[ ent, compr ] = lapEnt(X, stg, opt, h, R );

end

