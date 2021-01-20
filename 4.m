clc;
clear all;
w = [0.5 5 10 100];
slop = [-20 20 -40];
A1 = 20*log10(abs(0.75/(w(1)*i)))
A2 = 20*log10(abs(0.75/(w(2)*i)))
A3 = (slop(1)+slop(2))*log10(w(3)/w(2))+A2
A4 = (slop(1)+slop(2)+slop(3))*log10(w(4)/w(3))+A3
A = [A1 A2 A3 A4];
x = [0.5:100];
wn = 10;
for j=1:100
    if(x(j)<=wn)
        phi(j) = (180/pi)*(-pi/2)+ atan(0.2*x(j)-atan(0.16*x(j)/(1-0.01*x(j)^2)));
    else
        phi(j) = (180/pi)*(-pi/2)+ atan(0.2*x(j)-(atan(0.16*x(j)/(1-0.01*x(j)^2)) + pi));
    end
    j = j+1;
end
figure
subplot(2,1,1)
semilogx(w,A)
title('Bode Plot')
xlabel('Frequency in rad/s')
ylabel('Amplitude in db')
subplot(2,1,2)
semilogx(x,phi)
xlabel('Frequency in rad/s')
ylabel('Phase in deg')

H = tf([37.5,75],[1 16 100 0]);
bode(H)
margin(H)