% get bits needed for encoding and compression ratios for 6.2 simple
% Laplacian

h = [1 4 6 4 1]/16;
%h = [1 2 1]/4;

step = 17;

rms = zeros(7,1);
compr = zeros(7,1);
Xi = cell(7,1);
for i = 1:7
    [buff compr(i)] = lapEnt(X, i, step, h);
    [buff Xq] = quantest(X, i, step, h);
    Xi(i) = {Xq};
end

figure; plot(compr);

