% Blatt 9 
% Aufgabe 1

clc; close all; clear all; format long;

B = [1 2 10;4 5 6;7 8 9];
invB = inv(B);
x0 = [1 1 1]'/sqrt(3);
tol = 1e-10;
itermax = 10000;

lambdamax = VecIt(B, x0, tol, itermax);
lambdamin = 1/VecIt(invB, x0, tol, itermax);

kappa = abs(lambdamax/lambdamin);

fprintf('Die Kondition beträgt K\t=\t%f\n', kappa);
