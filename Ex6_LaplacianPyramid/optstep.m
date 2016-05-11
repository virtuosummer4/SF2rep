function [opt rms3 compr] = optstep(X, stg, compstep, h, err, min, max)
% OPTSTEP implement golden section search to find best step size
if ~exist('min','var') min = 1; end
if ~exist('max','var') max = 100; end
if ~exist('err','var') err = 0.0001; end
if ~exist('compstep', 'var') compstep=17; end
Xq = quantise(X, compstep);
comp = std(X(:)-Xq(:)); % rms error X -> Xq
[a, b]=size(Xq);
bitsx=bpp(Xq)*a*b;

if ~exist('h','var')
    h = [.25 .5 .25];%filter
end

Maxit = 1000;
p=1.618034;%golden ratio


% Allocate points
A = min;
D = max;
B = D-(D-A)/p;
C = A+(D-A)/p;

% Calculate initial values
%rms = quantest(X, stg, A, false);
%fa = rms(3);


fb = abs(quantest(X, stg, B, h)-comp);

fc = abs(quantest(X, stg, C, h)-comp);

%rms = quantest(X, stg, D, h, false);
%fd = rms(3);

diff = D-A;
it = 0;
while diff>err && it<Maxit
    if fc>fb
        D=C;
        C=B; fc=fb;
        B=D-(D-A)/p;
        fb = abs(quantest(X, stg, B,h)-comp);
    else
        A=B;
        B=C; fb=fc;
        C = A+(D-A)/p;
        fc = abs(quantest(X, stg, C,h)-comp);
    end
    diff = D-A;
    it = it+1;
end
if it==Maxit
    'iterations maxed out' %#ok<NOPRT>
end
opt = (B+C)/2;

rms3 = quantest(X, stg, opt, h)-comp;
[ent, buff1, bits] = lapEnt(X, stg, opt, h);
compr = bitsx/sum(bits);
end
