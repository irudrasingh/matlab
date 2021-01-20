clc
clear
close all
format long g
%==========================================================================
% Initial Coordinates
%==========================================================================
% Cartesian Position and Velocity
% X = [1892.775; 28831.100; 6415.927; -2.140; -0.513; 2.937]*1e3;
% Keplerian Elements
a = 29599.8;
e = 0.0001;
i = 0.9774;
Omega = 1.3549;
w = 0;
M = 0.2645;
[RECI, VECI] = Kepler2RV(a, e, i, Omega, w, M);
X = [RECI;VECI]*1e3;
%==========================================================================
% Propagation
%==========================================================================
h = 350; % Step Size (sec)
steps = 300; % Number of Steps
[X_RK] = RK_4(X,h,steps); % Orbit in ECI (PV)
grid on
