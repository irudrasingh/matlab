clc;
clear all;
N = [0 0 1];
D = [1 3 2 0];
Z = roots(N)
P = roots(D)
k = 0;
for i=1:200
    C = [1 3 2 k];
    x(i,:) = roots(C);
    k = k + 0.1;
end
plot(real(x),imag(x),'.',real(Z),imag(Z),'o',real(P),imag(P),'*')
title('Root Locus');
xlabel('Real Axis');
ylabel('Imaginary Axis');

h = tf([0 0 1],[1 3 2 0]);
rlocus(h);