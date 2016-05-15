function Y = d2ct(X,C)
% function Y = colxfm2(X,C)
% Performs folxfm on columns and then rows of the image X
% Y = colxfm(colxfm(X,C)',C)';

Y = colxfm(colxfm(X,C)',C)';

end