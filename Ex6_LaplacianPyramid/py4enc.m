function [X4 Y0 Y1 Y2 Y3] = py4enc(X)

% PY4ENC Calculate 4-layer Laplacian pyramid representation of an image.

h = [.25 .5 .25];%filter

X1 = rowdec(rowdec(X, h)', h)';
Y0 = X-rowint(rowint(X1, 2*h)', 2*h)';

X2 = rowdec(rowdec(X1, h)', h)';
Y1 = X1-rowint(rowint(X2, 2*h)', 2*h)';

X3 = rowdec(rowdec(X2, h)', h)';
Y2 = X2-rowint(rowint(X3, 2*h)', 2*h)';

X4 = rowdec(rowdec(X3, h)', h)';
Y3 = X3-rowint(rowint(X4, 2*h)', 2*h)';

X4 = X4-128;
% Note: when passed through the channel, X4 would be offset by 128 for
% 0-mean

figure;
draw(beside(Y0,beside(Y1,beside(Y2,beside(Y3,X4)))));

%imwrite(beside(Y0,beside(Y1,beside(Y2,beside(Y3,X4-128))))+128,map, '6104_encoded.jpg');