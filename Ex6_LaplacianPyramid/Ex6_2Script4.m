% optimise over all layers, get result, get compression.
loops = 50;
layers = 7;

msecomp = zeros(loops,1);
stcomp = zeros(loops, 1);
mseID = zeros(loops,1);
stID = zeros(loops,1);

oms = zeros(layers,1);
ost = zeros(layers,1);
rms = zeros(layers,1);
rst = zeros(layers,1);
cms = zeros(layers,1);
cst = zeros(layers,1);

for step = 1:loops;

Xq = quantise(X,step);
comp = std(X(:)-Xq(:)); % rms error X -> Xq


for  i = 1:layers
    [oms(i) rms(i) cms(i)] = optmse(X, i, comp);
    [ost(i) rst(i) cst(i)] = optstep(X, i, comp);
    
end
[msecomp(step),I] = max(cms);
mseID(step) = min(I);

[stcomp(step),I] = max(cst);
stID(step) = min(I);


%{

%}

end
figure;
subplot(2,1,1); plot(msecomp); hold on; plot(stcomp);hold off; title('MSE compression'); ylabel('compression ratio');
%title('Constant step compression'); xlabel('Quantisation steps');ylabel('compression ratio');
subplot(2,1,2); plot(mseID); hold on; plot(stID); hold off; title('mse Optimum'); ylabel('Laplacian stages');
%subplot(2,2,4); title('stID'); xlabel('Quantisation steps'); ylabel('Laplacian stages');