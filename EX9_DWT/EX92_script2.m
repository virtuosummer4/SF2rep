%EX92_script2.m
% implement the rest of the unboxed tezt in section 9.2
% needs skript 1 to run first.
% 

% reconstrucito filters. Gain of 2 to compensate for losing half the
% samples. g1 only defines the contribution of u samples, whereas g2 only
% defines v contribution to samples of x.
g1=[1 2 1]/2;
g2=[-1 -2 6 -2 -1]/4;

Ur = rowint(UU',g1)' + rowint2(UV',g2)';
Vr = rowint(VU',g1)' + rowint2(VV',g2)';

% check that Ur and Vr are the same as U and V
[max(abs((Ur(:)-U(:)))) max(abs((Vr(:)-V(:))))] %#ok<NOPTS>

Xr = rowint(Ur, g1)+rowint2(Vr, g2);

max(abs(Xr(:)-X(:)))


