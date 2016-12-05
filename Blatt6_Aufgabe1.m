%Blatt 6
%Aufgabe 1

clc; clear all; close all;

%% Einschritt-Theta-Verfahren
%dphi/dt = t²*e^(-5t) - 6phi

t1 = 0:0.1:2;
t2 = 0:0.2:2;
t4 = 0:0.4:2;

phi_VE1 = zeros(length(t1),1);
phi_RE1 = phi_VE1;
phi_TR1 = phi_VE1;

phi_VE2 = zeros(length(t2),1);
phi_RE2= phi_VE2;
phi_TR2 = phi_VE2;

phi_VE4 = zeros(length(t4),1);
phi_RE4 = phi_VE4;
phi_TR4 = phi_VE4;

%% dt = 0.1

for i = 2:length(t1)
    phi_VE1(i) = phi_VE1(i-1) + 0.1*(t1(i-1)^2*exp(-5*t1(i-1))-6*phi_VE1(i-1));
    phi_RE1(i) = 1/1.6 * phi_RE1(i-1) + 1/16 * t1(i)^2*exp(-5*t1(i));
    phi_TR1(i) = 1/1.3*(phi_TR1(i-1)+0.05*(t1(i-1)^2*exp(-5*t1(i-1))+t1(i)^2*exp(-5*t1(i))));
end


%% dt = 0.2

for i = 2:length(t2)
    phi_VE2(i) = phi_VE2(i-1) + 0.2*(t2(i-1)^2*exp(-5*t2(i-1))-6*phi_VE2(i-1));
    phi_RE2(i) = 1/2.2*(phi_RE2(i-1) + 0.2 * t2(i)^2*exp(-5*t2(i)));
    phi_TR2(i) = 1/1.6*(phi_TR2(i-1)+0.1*(t2(i-1)^2*exp(-5*t2(i-1))+t1(i)^2*exp(-5*t2(i))));
end

%% dt = 0.2

for i = 2:length(t4)
    phi_VE4(i) = phi_VE4(i-1) + 0.4*(t4(i-1)^2*exp(-5*t4(i-1))-6*phi_VE4(i-1));
    phi_RE4(i) = 1/3.4* (phi_RE4(i-1) + 0.4 * t4(i)^2*exp(-5*t4(i)));
    phi_TR4(i) = 1/2.2*(phi_TR4(i-1)+0.2*(t4(i-1)^2*exp(-5*t4(i-1))+t1(i)^2*exp(-5*t4(i))));
end

%% exakte Lösung

tex = 0:0.01:4;
phiex = exp(-5*tex).*(tex.^2-2*tex+2)-2*exp(-6*tex);

%% Plots
subplot(2,2,1);
plot(tex,phiex);
title('Exakte Lösung');
grid on;
grid minor;
legend('exakte Lösung');

subplot(2,2,2);
plot(t1, phi_VE1, t2, phi_VE2, t4, phi_VE4); 
axis([0 2 0 4e-3]);
title('Vorwärts Euler');
grid on;
grid minor;
legend('dt = 0.1','dt = 0.2','dt = 0.4');

subplot(2,2,3);
plot(t1, phi_RE1, t2, phi_RE2, t4, phi_RE4);
title('Rückwärts Euler');
grid on;
grid minor;
legend('dt = 0.1','dt = 0.2','dt = 0.4');

subplot(2,2,4);
plot(t1, phi_TR1, t2, phi_TR2, t4, phi_TR4);
title('Trapezregel');
grid on;
grid minor;
legend('dt = 0.1','dt = 0.2','dt = 0.4');
