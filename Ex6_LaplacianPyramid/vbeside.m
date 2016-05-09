function A = vbeside(C)
% HBESIDE does horizontal beside of all matrices in cell C

l = length(C);
if l==1
    A = cell2mat(C)';
else
    A = beside(cell2mat(C(1))',cell2mat(C(2))');
end
i = 3;
while i<l
    A = beside(A, cell2mat(C(i))');
    i=i+1;
end

A = A';