

opt = optstep(X,0.1, 100, 0.0000001,4);

[rms Xq Z] = quantest(X, 4, opt, false);
Xq = quantise(X-128,17)+128;

both = beside(Xq, Z);
figure; draw(both);
imwrite(both, map, '6204_rmsZero.jpg');