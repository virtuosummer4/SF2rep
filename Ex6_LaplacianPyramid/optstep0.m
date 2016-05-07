function [opt rms3] = optstep0(X, stg, min, max, err)
% OPTSTEP implement golden section search to find best step size

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

rms = quantest(X, stg, B, false);
fb = rms(3);

rms = quantest(X, stg, C, false);
fc = rms(3);

%rms = quantest(X, stg, D, false);
%fd = rms(3);

diff = D-A;
it = 0;
while diff>err && it<Maxit
    if fc>fb
        D=C;
        C=B; fc=fb;
        B=D-(D-A)/p;
        rms = quantest(X, stg, B, false);
        fb = rms(3);
    else
        A=B;
        B=C; fb=fc;
        C = A+(D-A)/p;
        rms = quantest(X, stg, C, false);
        fc = rms(3);
    end
    diff = D-A;
    it = it+1;
end
if it==Maxit
    'iterations maxed out' %#ok<NOPRT>
end
opt = (B+C)/2;
rms = quantest(X, stg, opt, false);
rms3 = rms(3);
