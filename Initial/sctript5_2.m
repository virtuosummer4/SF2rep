% Script to find maximum absolute pixel differences in row-column and
% column-row convoluted pictures.


h1 = halfcos(15);
h2 = halfcos(15)';

Xrc = conv2se(h1, h2, X);
Xcr = conv2se(h2, h1, X);

% see the actual difference.
Xdiff = Abs(Xrc-Xcr);

max(max(Xdiff)) %output should be zero.