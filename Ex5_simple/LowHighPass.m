function [ Xlp, Xhp ] = LowHighPass(N, X, dodraw)
%LowHighPass 
%   

h = halfcos(N);

Xlp = conv2se(h, h', X);
Xhp = X-Xlp;

if exist('dodraw', 'var') && dodraw
    figure; draw(Xlp);
    figure; draw(Xhp);
end


end

