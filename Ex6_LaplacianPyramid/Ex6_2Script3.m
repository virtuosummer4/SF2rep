
k = [1 3 5 7];
Z = zeros(256,256,4);
for i=1:4
    [buff1, buff2, Z(:,:,i)] = quantest(X, k(i), 17);
end

A = beside(X,beside(beside(Z(:,:,1), Z(:,:,2)),beside(Z(:,:,3),Z(:,:,4))));


%{
opt = optstep(X,0.1, 100, 0.0000001,4);

[rms Xq Z] = quantest(X, 4, opt, false);
Xq = quantise(X-128,17)+128;

both = beside(Xq, Z);
figure; draw(both);
imwrite(both, map, '6204_rmsZero.jpg');
%}