function bits = dctbpp(Yr, N)

%function bits = dctbpp(Yr, N)
%
%
%
%

[m, n] = size(Yr);
bpps = zeros(N);
ms = m/N; ns = n/N;

for i = 1:N
    for j = 1:N
        m1 = (i-1)*ms+1: i*ms;
        n1 = (j-1)*ns+1: j*ns;
        bpps(i,j) = bpp(Yr(m1, n1));
    end
    
end

bitsmat = bpps*ms*ns;
bits = sum(sum(bitsmat));

end