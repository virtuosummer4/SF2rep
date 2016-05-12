% Gets Energies of different HP and LP filters
n=125; % set n range between 1 and 127

Ex  =zeros(2,1);
Ex(:)=sum(X(:).^2);

Elp =zeros(n,1);
Ehp = zeros(n, 1);
Ecomb = zeros(n,1);
xcoor = zeros (n, 1);
for k = 0:n-1
    [Xlp, Xhp] = LowHighPass(2*k+1, X);
    Elp(k+1) = sum(Xlp(:).^2); 
    Ehp(k+1) = sum(Xhp(:).^2);
    Ecomb(k+1)=Elp(k+1)+Ehp(k+1);
    xcoor(k+1) = 2*k+1;
end
figure(4)
subplot(1,2,2);
plot(xcoor, Elp, xcoor, Ehp, xcoor, Ecomb, xcoor([1 n]), Ex);
xlabel('Filter width');
ylabel('Energy content');
legend('Low pass', 'High pass', 'Combined', 'Original','Location', 'best');