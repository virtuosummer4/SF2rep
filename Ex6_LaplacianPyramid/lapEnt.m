function [ ent, compr ] = lapEnt(X, st, step )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Acquire encoded matrices
C = pyenc(X,st);
% length of C is st+1
ent = zeros(st+1,1);
% entropy of quantised X
entX = bpp(quantise(X,step));
% entropies of submatrices
compr = 0;
for i = 1:st+1
    Ci = cell2mat(C(i));
    ent(i) = bpp(quantise((Ci),step));
    compr = compr + ent(i)*max(size(Ci))^2;
end
compr = compr/(entX*max(size(X))^2);

end

