function [ ent, compr ] = lapEnt(X, st, step, h, R )
% LAPENT [ ent, compr ] = lapEnt(X, st, step, h, R )
%   Detailed explanation goes here
% ent - vector with entropies of the encoded elements
% compr - image compression ratio
%
% gets entropy and compression of 

if ~exist('h','var')
    h = [.25 .5 .25];%filter
end
if ~exist('R', 'var') R = ones(st+1,1); end

% Acquire encoded matrices
C = pyenc(X,st,h);
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

