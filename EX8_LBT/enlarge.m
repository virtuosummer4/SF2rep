function M = enlarge(m, n)
% enlarges matrix m by repeating its elements n times in row and column
% directions.
%

[a b] = size(m);
% convert to row vector
r = m(:)';
% replicate numbers
r = repmat(r, n, 1);
% reshape to have twice taller matrix as before
r = reshape(r, n*a, b);
% repeat for the transpose
rt = r';
rt = rt(:)';
rt = repmat(rt, n, 1);
rt = reshape(rt, n*b, n*a);

M = rt';

end
