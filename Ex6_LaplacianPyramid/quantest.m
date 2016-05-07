function [rms, Xq, Z] = quantest(X, stg, step, drw)
% QUANTEST: Tests quantisation quality

if ~exist('drw', 'var') drw = false; end

% encode
C = pyenc(X,stg);

% quantise
for i = 1:stg+1
    C(i) = {quantise(cell2mat(C(i)),step)};
end

Xq = quantise(X, step);

% reconstruct

Z = pydec(C);
%Zr = quantise(Z,step);

if drw
    figure;
    %draw(beside(Xq, Zr));
    draw(beside(X, Z));
end

%rms = zeros(1, 3);
%rms = std(Xq(:)-Zr(:));
rms = std(X(:)-Z(:)); % rms error X -> Z
%rms(2) = std(X(:)-Xq(:)); % rms error X -> Xq
%rms(3) = rms(1)-rms(2); % rms error difference. Result used for minimisation.
end
