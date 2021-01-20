clc;
clear all;
G = 6.673e-11;
M = 5.98e24;
ra = 100000;
r = 6.37e6 + ra;
m = 500;
a = (G*M)/(r^2);
v_orb = sqrt((G*M)/r);
T = sqrt(((4*(pi^2))*r^3)/(G*M));
steps = T/35;
simt = -steps;
for i = 1:1:36
    simt = simt+steps;
    t(i) = simt;
    v_o(i) = sqrt((G*M)/r);
    rn(i) = 6.37e6 + ra;
end
figure
plot(t,v_o); xlabel('Simulation Time', 'FontSize',12);
ylabel('Velocity', 'FontSize',12);
grid;
figure
plot(t,rn); xlabel('Simulation Time', 'FontSize',12);
ylabel('Radius', 'FontSize',12);
th = 2*pi*t/T;
rho = sqrt((t.^2)+(rn.^2));
figure
polar(th,rho)
title('Orbit')