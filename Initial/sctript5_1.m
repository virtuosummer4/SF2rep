% Script for first for loop convolution

h=halfcos(15);
Xf = zeros(256,270);
for i = 1:256
    Xf(i, :) = conv (X(i,:), h);
end