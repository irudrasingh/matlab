clc;
clear all;
N = [1,1,2,-4];
D = [2,1,6,25];
z0 = roots(N)
zp = roots(D)
plot(real(zp),imag(zp),'X',real(z0),imag(z0),'o');
title('Pole-Zero Map');
xlabel('Real Axis');
ylabel('Imaginary Axis');
axis([-5 5 -5 5]);


clc;
clear all;
Sys = tf([1,2,-4],[1,6,25]);
pzplot(Sys);