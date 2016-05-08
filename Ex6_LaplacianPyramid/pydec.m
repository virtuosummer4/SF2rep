function Z0 = pydec(C,h)

% PY4DEC decode the original mage from an n-layer Laplacian pyramid.
% C - cell array of subimage matric {Y0...Yk-1 Xk} where k is the amount of
% stages in the Laplacian pyramid.

if ~exist('h','var')
    h = [.25 .5 .25];%filter
end

n=length(C);

Z = cell2mat(C(n))+128; % add 128 to fixthe DC offset
for i = 1:n-1
    % X(k) = Y(k)+<interpolate>X(k+1) where k=n-i-1
    Z = cell2mat(C(n-i))+rowint(rowint(Z,2*h)', 2*h)';
end
Z0=Z;

end