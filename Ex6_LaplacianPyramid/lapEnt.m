function [ ent, compr ] = lapEnt(X, st, step, R )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if ~exist('R', 'var') R = ones(st+1,1); end

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
    ent(i) = bpp(quantise((Ci),step/R(i)));
    compr = compr + ent(i)*length(Ci)^2;
end

compr = (entX*length(X)^2)/compr;

end

