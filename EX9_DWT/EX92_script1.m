%EX92_script1.m
% Plot pictures and get energy values for 12
% (then do 13)
% 

% factor for high-pass display
k = 2;

% filters
h1 = [-1 2 6 2 -1]/8;
h2 = [-1 2 -1]/4;

% low-pass
U = rowdec(X, h1);

% high-pass
V = rowdec2(X, h2);

eu = energy(U); su = std(U(:));
ev = energy(V); sv = std(V(:));

[eu su; ev sv] %#ok<*NOPTS>

A1 = beside(U, V*k);
figure; draw(A1);

% Plot pictures for 13

UU = rowdec(U',h1)';
UV = rowdec2(U',h2)';
VU = rowdec(V',h1)';
VV = rowdec2(V',h2)';

A2 = beside(beside(UU, VU*k)', beside(UV*k,VV*k^2)')';
figure; draw(A2);