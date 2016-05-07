function X = py4dec(X4, Y0, Y1, Y2, Y3)

% PY4DESC decode the original mage from a 4-layer Laplacian pyramid.

h = [.25 .5 .25];%filter


%See lab book page 2 for graphical explanation.

Z3=Y3+rowint(rowint(X4+128, 2*h)', 2*h)';

Z2=Y2+rowint(rowint(Z3,2*h)', 2*h)';

Z1=Y1+rowint(rowint(Z2,2*h)', 2*h)';

Z0=Y0+rowint(rowint(Z1,2*h)', 2*h)';

figure;
draw(beside(Z0,beside(X,beside(Z1,beside(X1,beside(Z2,beside(X2,beside(Z3,beside(X3,X4+128)))))))));

%imwrite(beside(Z0,beside(X,beside(Z1,beside(X1,beside(Z2,X2))))),map, '6105_decoded.jpg');