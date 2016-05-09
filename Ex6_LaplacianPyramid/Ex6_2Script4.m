% optimise over all layers, get result, get compression.
step = 17;


Xq = quantise(X-128,step)+128;
comp = std(X(:)-Xq(:)); % rms error X -> Xq
oms = zeros(8,1);
ost = zeros(8,1);
rms = zeros(8,1);
rst = zeros(8,1);
cms = zeros(8,1);
cst = zeros(8,1);
for  i = 1:8
    [oms(i) rms(i) cms(i)] = optmse(X, i, comp);
    [ost(i) rst(i) cst(i)] = optstep(X, i, comp);
    
end
figure; plot(oms);
figure; plot(ost);
figure; plot(cms);
figure; plot(cst);