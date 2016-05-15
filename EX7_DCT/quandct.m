function rms = quandct( X, C, step )
%[ rms] = quandct( X, step )
%   X - image
%   C - DCT matrix

Y=d2ct(X,C);

%Xq = quantise(X,17);
%cmp = std(X(:)-Xq(:));

Yq = quantise(Y,step);
Z = d2ct(Yq', C')';

rms = std(X(:)-Z(:));



end

