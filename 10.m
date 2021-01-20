Mearth=5.9736e24; 
Rearth=6371e3; 
Mmoon=7.349e22; 
Rmoon=1738e3; 
Dearth2moon=384400e3; 
OrbitHeight=Rmoon+100e3; %1838e3 
k=1.3607e-23; %Boltzman's constant 
G=6.672e-11;
Tsys_moon=20; 
Tsys_sat=20; 
Tsys_earth=298;
BW=8.16e9;
EoNo_256QAM_turbocode=14;
rain_fade=1; 
data_rate=6.4e10; 
SNR_Recv=EoNo_256QAM_turbocode+10*log10(data_rate/BW); 
%Carrier Freq 
fc=19.48e9;
%=.0154m 
lambda=3e8/fc; 
%Antenna Gains 
%=95.2772 dB 
Gt1=10*log10(.9*(4*pi/lambda^2)*(pi*150^2)); 
%=58.9224 dB 
Gt2_linear=.75*(4*pi/lambda^2)*(pi*2.5^2);
Gt2=10*log10(.75*(4*pi/lambda^2)*(pi*2.5^2)); 
Gr2=Gt2;
Gt3=Gt2;
Gr3=Gt2;
%=76.5532 dB
Gr4=10*log10(.94*(4*pi/lambda^2)*(pi*17^2));
%Distance from Moon observatory to Satellite at lagrangian point L2
%=6.1528e7 m
R1to2=Dearth2moon*(Mmoon/(3*Mearth))^(1/3);
%Distance from Satellite at lagrangian point L2 to Satellite in lunar orbit
%=6.1556e7 m
R2to3=sqrt(R1to2^2+OrbitHeight^2);
%Distance from Satellite in lunar orbit to Earth station
%=3.8440e8 m
R3to4=sqrt(Dearth2moon^2+OrbitHeight^2);
%0.1862
HPBW_needed=2*atan(100e3/R2to3);
%0.1961
HPBW_actual=sqrt(30000/Gt2_linear);
%Power of noise at the moon observatory
%=-116.5352 dB
PNmoon=10*log10(k*Tsys_moon*BW);
%Power of noise at the satellites
%=-116.5352 dB
PNsat=10*log10(k*Tsys_sat*BW);
%Power of noise at the earth station
%=-104.8033 dB
PNearth=10*log10(k*Tsys_earth*BW);
Pr2=EoNo_256QAM_turbocode+PNsat+10*log10(data_rate/BW);
Pt1=Pr2-Gt1-Gr2+20*log10(R1to2)+20*log10(4*pi/lambda)+rain_fade;
Pr3=EoNo_256QAM_turbocode+PNsat+10*log10(data_rate/BW);
Pt2=Pr3-Gt2-Gr3+20*log10(R2to3)+20*log10(4*pi/lambda)+rain_fade;
Pr4=EoNo_256QAM_turbocode+PNearth+10*log10(data_rate/BW);
Pt3=Pr4-Gt3-Gr4+20*log10(R3to4)+20*log10(4*pi/lambda)+rain_fade;
Pt1_Watts=10^(Pt1/10)
Pt2_Watts=10^(Pt2/10)
Pt3_Watts=10^(Pt3/10)
Total_power_Watts=Pt1_Watts+Pt2_Watts+Pt3_Watts

