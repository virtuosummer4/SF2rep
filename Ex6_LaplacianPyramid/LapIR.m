function E = LapIR(layr,h, drw)
% LAPIR invstigates effect of impulse response on particular layer of
% Laplacean Pyramid encoding scheme.
%
% layr - which layer the impulse if put
% test image
if ~exist('drw', 'var') drw = false; end

X = zeros(256);
C = pyenc(X,layr,h);
E = zeros(layr+1,1);
Ct=C;
for i = 1:layr
    Y = cell2mat(C(i));
    l=length(Y);
    Y(l/2,l/2) = 100;
    C(i) = {Y};
    Z=pydec(C,h);
    E(i) = sum(Z(:).^2);
    C=Ct;
end
Y = cell2mat(C(layr+1));
    l=length(Y);
if l>1
    Y(l/2,l/2) = 100;
else
    Y=100;
end
C(layr+1) = {Y};
    Z=pydec(C,h);
    E(layr+1) = sum(Z(:).^2);
    C=Ct;

if drw
figure;
plot(E);
end

end