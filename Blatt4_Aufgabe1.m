%Blatt 4
%Aufgabe 1

clear all; close all; clc; format long;

h = 0.1;
x0 = 0.6*ones(5,1);
k = [-2;-1;0;1;2];
x = x0 + k*h;
fx = (x./(1+x)).^5;

%%Zweipunkteformel

zp = (fx(3)-fx(2))/h;

%%Dreipunkte Endpunkt Formel

dpep = 1/(2*h)*(-3*fx(3)+4*fx(4)-fx(5));

%%Dreipunkte Mittelpunkt Formel

dpmp = 1/(2*h)*(fx(4)-fx(2));

%%Fünfpunkte Mittelpunkt Formel

fpmp = 1/(12*h)*(fx(1)-8*fx(2)+8*fx(4)-fx(5));