%Blatt 1
%Aufgabe 2

clc; clear all; close all; format long;


disp('======================Output=======================');


x_node14 = [0.0 1.0 2.0 3.0 4.0];
f_node14 = [0.000000000000 0.031250000000 0.131687242798 0.237304687500 0.327680000000];
x = 0.6;

disp(' ');
disp('Lagrange Interpolaation Grad 1:');
n = 1;

fL1 = LagrangePolynom(x, n, x_node14, f_node14);
fL1_Deriv = LagrangeDerivPolynom(x, n, x_node14, f_node14);
fprintf('\tfL1 =\t%f\n\tfL1" =\t%f\n\n', fL1, fL1_Deriv);

disp('Lagrange Interpolaation Grad 4:');
n = 4;

fL4 = LagrangePolynom(x, n, x_node14, f_node14);
fL4_Deriv = LagrangeDerivPolynom(x, n, x_node14, f_node14);
fprintf('\tfL4 =\t%f\n\tfL4" =\t%f\n\n', fL4, fL4_Deriv);

x_node80 = linspace(0.0, 4.0, 81);
f_node80 = zeros(81,1);


disp('Lagrange Interpolaation Grad 80:');
n = 80;

for i = 1:81
    f_node80(i) = (x_node80(i)/(1+x_node80(i)))^5;
end

fL80 =  LagrangePolynom(x, n, x_node80, f_node80);
fL80_Deriv = LagrangeDerivPolynom(x, n, x_node80, f_node80);
fprintf('\tfL80 =\t%f\n\tfL80" =\t%f\n\n', fL80, fL80_Deriv);

x = linspace(0.0, 4.0, 80);
plotgrad1 = zeros(80,1);
plotgrad1deriv = zeros(80,1);
plotgrad4 = zeros(80,1);
plotgrad4deriv = zeros(80,1);
plotgrad80 = zeros(80,1);
plotgrad80deriv = zeros(80,1);

for i = 1:80
    plotgrad1(i) =  LagrangePolynom(x(i), 1, x_node14, f_node14);
    plotgrad1deriv(i) = LagrangeDerivPolynom(x(i), 1, x_node14, f_node14);
    
    plotgrad4(i) =  LagrangePolynom(x(i), 4, x_node14, f_node14);
    plotgrad4deriv(i) = LagrangeDerivPolynom(x(i), 4, x_node14, f_node14);
    
    plotgrad80(i) =  LagrangePolynom(x(i), 80, x_node80, f_node80);
    plotgrad80deriv(i) = LagrangeDerivPolynom(x(i), 1, x_node80, f_node80);
end
    
syms z;
f = @(z) (z./(z+1)).^5;
df = @(z) 5*(z.^4)./((z+1).^6);

figure('Name', 'Lagrangeinterpolation');

grid on;

subplot(2,2,1);
hold on;
title('Interpolierte Funktion');
grid on;
plot(x, f(x));
plot(x, df(x));
hold off;

subplot(2,2,2);
hold on;
title('grad 1');
grid on;
plot(x, plotgrad1);
plot(x, plotgrad1deriv);
hold off;

subplot(2,2,3);
hold on;
title('grad 4');
grid on;
plot(x, plotgrad4);
plot(x, plotgrad4deriv);
hold off;

subplot(2,2,4);
hold on;
title('grad 80');
grid on;
plot(x, plotgrad80);
plot(x, plotgrad80deriv);
hold off;



disp('=======================end=========================');