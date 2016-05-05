% Gets Energies of different HP and LP filters
n=127; % set n range between 1 and 127

Elp =zeros(n,1);
Ehp = zeros(n, 1);
xcoor = zeros (n, 1);
for k = 0:n-1
    [Xlp, Xhp] = LowHighPass(2*k+1, X);
    Elp(k+1) = sum(Xlp(:).^2); 
    Ehp(k+1) = sum(Xhp(:).^2);
    xcoor(k+1) = 2*k+1;
end
figure
plot(xcoor, Elp, xcoor, Ehp);
xlabel('Filter width');
ylabel('Energy content');
legend('Low pass', 'High pass');