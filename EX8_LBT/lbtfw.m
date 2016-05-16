function Y = lbtfw(X, N, s)
% Y = lbtfw(X, N, s)
% performs LBT
%

[Pf, ~] = pot_ii(N, s);

Xp = pot(X, Pf, N);

C = dct_ii(N);

Y = d2ct(Xp, C);

end