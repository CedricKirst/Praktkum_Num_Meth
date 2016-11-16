%Blatt 4
%Aufgabe 2

clear all; close all; clc;

%Berechnung der Näherungswerte für verschiedene Schrittweiten h
h = logspace(-5,0,100);
x0 = 0.6*ones(5,1);
k = [-2;-1;0;1;2];
zp = zeros(length(h), 1);
dpep = zeros(length(h), 1);
dpmp = zeros(length(h), 1);
fpmp = zeros(length(h), 1);

 
for i = 1:length(h)
   
    x = x0 + k*h(i);
    fx = (x./(1+x)).^5;

    %%Zweipunkteformel

    zp(i) = (fx(3)-fx(2))/h(i);

    %%Dreipunkte Endpunkt Formel

    dpep(i) = 1/(2*h(i))*(-3*fx(3)+4*fx(4)-fx(5));

    %%Dreipunkte Mittelpunkt Formel

    dpmp(i) = 1/(2*h(i))*(fx(4)-fx(2));

    %%Fünfpunkte Mittelpunkt Formel

    fpmp(i) = 1/(12*h(i))*(fx(1)-8*fx(2)+8*fx(4)-fx(5));
    
end

zp = abs(0.03862380981-zp);
dpep = abs(0.03862380981- dpep);
dpmp = abs(0.03862380981- dpmp);
fpmp = abs(0.03862380981- fpmp);



subplot(2,2,1);
loglog(h, zp);
hold on;
plot(h, h, '-.');
legend('Numerischer Näherung', 'h', 'Location', 'Southeast');
title('Fehler Zweipunkt Formel');
xlabel('Schrittweite h');
ylabel('Absoluter Fehler');
grid minor;

subplot(2,2,2);
loglog(h, dpep);
hold on;
plot(h, h.^2, '-.');
legend('Numerischer Näherung', 'h²', 'Location', 'Southeast');
title('Fehler Dreipunkt Endpunkt Formel');
xlabel('Schrittweite h');
ylabel('Absoluter Fehler');
grid minor;

subplot(2,2,3);
loglog(h, dpmp);
hold on;
plot(h, h.^2, '-.');
legend('Numerischer Näherung', 'h²', 'Location', 'Southeast');
title('Fehler Dreipunkt Mittelpunkt Formel');
xlabel('Schrittweite h');
ylabel('Absoluter Fehler');
grid minor;

subplot(2,2,4);
loglog(h, fpmp);
hold on;
plot(h, h.^4, '-.');
legend('Numerischer Näherung', 'h⁴', 'Location', 'Southeast');
title('Fehler Fünfpunkt Mittelpunkt Formel');
xlabel('Schrittweite h');
ylabel('Absoluter Fehler');
grid minor;
