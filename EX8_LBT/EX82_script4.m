%EX82_script4.m
% Plot bases and filtered image for 10.
% 
% 

N = 8;
stp = 17;
Xq = quantise(X, stp);
ref = std(X(:)-Xq(:));
bitref = getbits(Xq);

s = [1, 1.3354, sqrt(2), 2];
opt =zeros(length(s),1); 
compr = zeros(length(s),1);
Xp = cell(length(s), 2);
A1 =  cell(length(s), 1);

for i = 1:length(s)
    P = pot_ii(N, s(i));
    Xp(i, 1) = {pot(X, P)*0.5};
    bases = [zeros(1,8); P'; zeros(1,8)];
    Xp(i, 2) = {enlarge(255*bases(:)*bases(:)', 2)};
    A1(i) = {vbeside(Xp(i,:))};
end

A = hbeside(A1);
figure; draw(A);
