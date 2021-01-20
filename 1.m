clear all;
clc;
M = 20;
D = 0;
t = 0.1;
v = 0;
for i = 1:50
    dvdt(i) = (1/M)*(M*9.81-(D*v))*t;
    v = dvdt(i);
    t = t+0.1;
end
plot(0.1:0.1:5,dvdt);
xlabel('TIME(s)');
ylabel('VELOCITY(m/s)');
title('Velocity versus Time plot for falling sphere with viscous drag');
