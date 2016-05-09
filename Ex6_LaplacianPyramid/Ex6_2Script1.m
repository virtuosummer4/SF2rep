% Script to plot rms errors for different step quantisations

N = 1000;

step= 100/N;
x = zeros(N,1);
y = zeros(N,1);

for i = 1:N
    x(i)=i*step;
    rms = quantest(X, 4, x(i), false);
    y(i)=rms;
end
figure;plot(x,y);
