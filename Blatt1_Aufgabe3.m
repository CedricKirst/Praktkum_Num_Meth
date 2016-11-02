% Blatt 1
% Aufgabe 3

clc; clear all; close all; format long;

x1 = -pi : 0.1 : pi;
y1 = sin(x1);

figure(1);
plot( x1, y1 );
grid on;    
hold off;

x2 = [-1;0;1;-1;0;1;-1;0;1];
y2 = [-1;-1;-1;0;0;0;1;1;1];

f = @(x, y) x.^2 + y.^2;

z2 = f(x2, y2);

nodes = [x2,y2];
sol = z2;
elements = [1,2,5,4;2,3,6,5;4,5,8,7;5,6,9,8];

figure('Name', 'Blatt1_Aufgabe3');
grid on;
quadplot(nodes, elements, sol)
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Quadplot');
hold off;
