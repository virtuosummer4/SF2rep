% optimise over all layers, get result, get compression.
loops = 50;
layers = 7;
h1 = [1 2 1]/4;
h2 = [1 4 6 4 1]/16;

mseopt1 = zeros(loops,1);
stopt1 = zeros(loops,1);
msecomp1 = zeros(loops,1);
stcomp1 = zeros(loops, 1);
mseID1 = zeros(loops,1);
stID1 = zeros(loops,1);

mseopt2 = zeros(loops,1);
stopt2 = zeros(loops,1);
msecomp2 = zeros(loops,1);
stcomp2 = zeros(loops, 1);
mseID2 = zeros(loops,1);
stID2 = zeros(loops,1);

oms1 = zeros(layers,1);
ost1 = zeros(layers,1);
oms2 = zeros(layers,1);
ost2 = zeros(layers,1);
rms = zeros(layers,1);
rst = zeros(layers,1);
cms1 = zeros(layers,1);
cst1 = zeros(layers,1);
cms2 = zeros(layers,1);
cst2 = zeros(layers,1);

for step = 1:loops;

Xq = quantise(X,step);
comp = std(X(:)-Xq(:)); % rms error X -> Xq


for  i = 1:layers
    [oms1(i) rms(i) cms1(i)] = optmse(X, i, comp, h1, 0.001, 0.1, 50);
    [ost1(i) rst(i) cst1(i)] = optstep(X, i, comp,h1, 0.001, 0.1, 50);
    [oms2(i) rms(i) cms2(i)] = optmse(X, i, comp,h2, 0.001, 0.1, 50);
    [ost2(i) rst(i) cst2(i)] = optstep(X, i, comp,h2, 0.001, 0.1, 50);
    
end
[msecomp1(step),I] = max(cms1);
mseID1(step) = min(I);
mseopt1(step) = oms1(mseID1(step));

[stcomp1(step),I] = max(cst1);
stID1(step) = min(I);
stopt1(step) = ost1(stID1(step));

[msecomp2(step),I] = max(cms2);
mseID2(step) = min(I);
mseopt2(step) = oms2(mseID2(step));

[stcomp2(step),I] = max(cst2);
stID2(step) = min(I);
stopt2(step) = ost2(stID2(step));
%{

%}

end

m = [mean(mseID1) mean(stID1) mean(mseID2) mean(stID2)];

figure;
subplot(1,3,1);
plot(mseopt1);
hold on;
plot(stopt1);
plot(mseopt2,'--');
plot(stopt2, '-.');
hold off;
title('Optimum step'); xlabel('quantisation step size'); ylabel('1st layer step size');
legend('mse3','const3','mse5','const5','Location', 'NorthWest');
legend('boxoff');

subplot(1,3,2);
plot(msecomp1);
hold on;
plot(stcomp1);
plot(msecomp2, '--');
plot(stcomp2, '-.');
hold off;
title('Compression'); xlabel('quantisation step size'); ylabel('compression ratio');
%title('Constant step compression'); xlabel('Quantisation steps');ylabel('compression ratio');
legend('mse3','const3','mse5','const5','Location', 'NorthWest');
legend('boxoff');

subplot(1,3,3);
plot(mseID1);
hold on;
plot(stID1);
plot(mseID2, '--');
plot(stID2, '-.');
hold off;
title('Optimum stage');xlabel('quantisation step size'); ylabel('Pyramid stage');
%subplot(2,2,4); title('stID'); xlabel('Quantisation steps'); ylabel('Laplacian stages');
%legend('st1','mse1','st2','mse2','Location', 'SouthEast');