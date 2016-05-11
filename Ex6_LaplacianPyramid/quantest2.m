function [rms, Xq, Z] = quantest2(X, stg, step, h, R, drw)
% QUANTEST: Tests quantisation quality
% h - filter. defaults to 3-tap filter.
% R - coeficients for layer step scaling (division). Defaults to MSE scheme
% drw - bool, whether to draw out the result. defaults to false.

if ~exist('drw', 'var') drw = false; end
if ~exist('R','var')
    R = sqrt(LapIR(stg));
    R = R./R(1);% adjust to get ratios
end

if ~exist('h','var')
    h = [.25 .5 .25];%filter
end

%%%%5
%h = [1 4 6 4 1]/16;

%%%%%

% encode
C = pyenc(X,stg,h);

% quantise
for i = 1:stg+1
    C(i) = {quantise(cell2mat(C(i)),step/R(i))};
end

Xq = quantise(X, step);

% reconstruct

Z = pydec(C,h);
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
