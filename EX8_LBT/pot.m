function Y = pot(X, P, N)
% function Y = pot(X, P)
% Performs the Photo Overlap Transform.
% Y refers to Xp or Zp on page 18 of handout
%
I = length(X);
N = length(P);

t = (1+N/2):(I-N/2);

Y = X;
Y(t,:) = colxfm(Y(t,:), P);
Y(:,t) = colxfm(Y(:,t)', P)';

end