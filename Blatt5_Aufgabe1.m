%Blatt 5
%Aufgabe 1

clc; clear all; close all;
addpath('Methods');

%Numerische Näherung des Integrals von a bis b über f(x) = (x/(1+x))⁵
a = 0;
b = 4;
fa = a^5/(1+a)^5;
fb = b^5/(1+b)^5;
fm = ((b-a)/2)^5/(1+(b-a)/2)^5;

%%Mittelpunktregel
I_M = (b - a)*fm;

%%Trapezregeld
I_T = (b - a)*(fa+fb)/2;

%%Gauß-Quadratur

%1 Stützstelle
gaussxi1 = gx(1)';
gaussw1 = gw(1)';
gaussx1 = (b-a)/2 * gaussxi1 + (a+b)/2;
gaussf1 = (gaussx1./(1+gaussx1)).^5;
I_G1 = gaussw1' * gaussf1 * (b-a)/2;

%2 Stützstellen
gaussxi2 = gx(2)';
gaussw2 = gw(2)';
gaussx2 = (b-a)/2 * gaussxi2 + (a+b)/2;
gaussf2 = (gaussx2./(1+gaussx2)).^5;
I_G2 = gaussw2' * gaussf2 * (b-a)/2;

%3 Stützstellen
gaussxi3 = gx(3)';
gaussw3 = gw(3)';
gaussx3 = (b-a)/2 * gaussxi3 + (a+b)/2;
gaussf3 = (gaussx3./(1+gaussx3)).^5;
I_G3 = gaussw3' * gaussf3 * (b-a)/2;

disp('================================Output=================================');
disp('Numerische Berechnung des Integrals von 0 bis 4 über f(x) = (x/(x+1))⁵');
fprintf('\n Mittelpunktverfahren:\n\tI_M\t=\t%f', I_M);
fprintf('\n\n Trapezverfahren:\n\tI_T\t=\t%f', I_T);
fprintf('\n\n Gauss - Quadratur Verfahren:\n\tI_G1\t=\t%f\n\tI_G2\t=\t%f\n\tI_G3\t=\t%f\n\n', I_G1, I_G2, I_G3);
disp('=================================end===================================');