function Zp = lbtbw(Y, N, s)
% performs backwards LBT
%

[~, Pr] = pot_ii(N, s);

C = dct_ii(N);

Z = d2ct(Y', C')';

Zp = pot(Z, Pr', N);


end