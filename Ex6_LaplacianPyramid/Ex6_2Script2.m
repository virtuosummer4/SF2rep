% Script to display the curve, optimised over in optstep.m

N = 1000;

step= 100/N;
x = zeros(N,1);
y = zeros(N,1);

Xq = quantise(X-128, 17)+128;
comp = std(X(:)-Xq(:));

for i = 1:N
    x(i)=i*step;
    y(i)= abs(quantest(X, 4, x(i), false)-comp);
end
figure;plot(x,y);