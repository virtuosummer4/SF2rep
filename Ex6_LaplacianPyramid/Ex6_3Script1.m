%EX6_3Script1 display compression features for all four schemes with base
%step size 17.

step = 17;
h1 = [1 2 1]/4;
h2 = [1 4 6 4 1]/16;

[buff1, buff2, Z1] = quantest(X, stID1(step), stopt1(step), h1);   
[buff1, buff2, Z2] = quantest2(X, mseID1(step), mseopt1(step), h1);
   
[buff1, buff2, Z3] = quantest(X, stID2(step), stopt2(step), h2);   
[buff1, buff2, Z4] = quantest2(X, mseID2(step), mseopt2(step), h2);

A1 = [zeros(128,256); X; zeros(129,256)];
A2 = beside(Z1, Z2);
A3 = beside(Z3, Z4);
A = beside(A1, beside(A2', A3')');
