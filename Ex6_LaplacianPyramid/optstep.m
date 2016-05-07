function [opt rms3] = optstep(X, min, max, err, stg)
% OPTSTEP implement golden section search to find best step size

Maxit = 1000;
p=1.618034;%golden ratio

Xq = quantise(X-128, 17)+128;

comp = std(X(:)-Xq(:)); % rms error X -> Xq

% Allocate points
A = min;
D = max;
B = D-(D-A)/p;
C = A+(D-A)/p;

% Calculate initial values
%rms = quantest(X, stg, A, false);
%fa = rms(3);


fb = abs(quantest(X, stg, B, false)-comp);

fc = abs(quantest(X, stg, C, false)-comp);

%rms = quantest(X, stg, D, false);
%fd = rms(3);

diff = D-A;
it = 0;
while diff>err && it<Maxit
    if fc>fb
        D=C;
        C=B; fc=fb;
        B=D-(D-A)/p;
        fb = abs(quantest(X, stg, B, false)-comp);
    else
        A=B;
        B=C; fb=fc;
        C = A+(D-A)/p;
        fc = abs(quantest(X, stg, C, false)-comp);
    end
    diff = D-A;
    it = it+1;
end
if it==Maxit
    'iterations maxed out' %#ok<NOPRT>
end
opt = (B+C)/2;

rms3 = quantest(X, stg, opt, false)-comp;
