%Blatt 2
%Aufgabe 1

clc; clear all; close all;

delta = logspace(-20,-5, 1000);
P2 = zeros(2,1);
x = zeros(length(delta),1,1000);
xex = 1;
xf = zeros(length(delta),1);

P1 = [ 0.0 ;1.0 ];

for i = 1:length(delta)
    
    P2 = [ 0.0 + delta(i) ; 1.0 - delta(i) ];
    
    x(i) = lineintersection(P1, P2);
    xf(i) = norm(x(i) - xex);
    
end

loglog(delta, xf);
grid on;
grid minor;
