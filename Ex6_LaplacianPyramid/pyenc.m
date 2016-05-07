function [C] = pyenc(X0,n)

% PYENC Calculate n-layer Laplacian pyramid representation of an image.
%
% X - input image
% n - how many levels of Laplacian Pyramid are computed
h = [.25 .5 .25];%filter

C=cell(n+1,1);
%X = cell(n+1,1);
Xp = X0;
%X(1) = {X0};
for i = 1:n
    Xn = rowdec(rowdec(Xp, h)', h)';
    C(i) = {Xp-rowint(rowint(Xn, 2*h)', 2*h)'};
    %X(i+1) = {Xn};
    Xp=Xn;
end
C(n+1) = {Xp-128};% offset for 0-mean
end