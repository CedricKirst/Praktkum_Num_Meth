%Blatt 8
%Aufgabe 1

%% initialize

clc;clear all;close all;

addpath('Methods');

r = 0.02;
b = 0.3;
h = 0.3;

nodes = h/3* [0 0;1 0;2 0;3 0;0 1;1 1;2 1;3 1;0 2;1 2;2 2;0 0;0 0;0 0;0 3;1 3;0 0;0 0];
nodes(12,:) = [b-r*sin(pi/6);h-r*cos(pi/6)];
nodes(13,:) = [b; h-r];
nodes(14,:) =  [b-r*cos(pi/6);h-r*sin(pi/6)];
nodes(17,:) = [b/2; h];
nodes(18,:) = [b-r, h];

elements = [1 2 6 5;2 3 7 6;3 4 8 7; 5 6 10 9;6 7 11 10;7 12 14 11;7 8 13 12;9 10 16 15;10 11 17 16;11 14 18 17];

dbc = [[(1:4)';12;13;14;18], [600*ones(4,1);300*ones(4,1)]];

[l,~] = size(elements);
sysmat = zeros(18,18);
rhs = zeros(18,1);
T = zeros(18, 11);
T(:,1) = 300;
n = 2;

dt = 500;

%% iteratives Lösen aller Zeitschritte

for t = 500:dt:5000
    
    sysmat = zeros(18,18);
    elevec = zeros(18,1);
    rhs = zeros(18,1);
    
    if t==500
        firststep = true;
    else
        firststep = false;
    end
    
    for e = 1:l
        elenodes = nodes(elements(e,:),:);
        [ elemat, elevec ] = evaluate_instat(elenodes, gx2dref(n), gw2dref(n), T(elements(e,:),t/500), [], 1 ,dt, 0.5, firststep); 
        [ sysmat, rhs ] = assemble( elemat,elevec,sysmat,rhs,elements(e,:) );
    end    
    
    [ sysmat, rhs ] = assignDBC( sysmat, rhs, dbc );

    T(:,t/500+1) = sysmat\rhs;
    
end


%% Ausgabe der Temperatur bei t = 5000s
disp('Lösung bei t = 5000s');
fprintf('\nT¹⁰_15\t=\t%f\nT¹⁰_16\t=\t%f\nT¹⁰_17\t=\t%f\nT¹⁰_18\t=\t%f\n\n', T(15,end), T(16,end), T(17,end), T(18,end)); 

%% Plot t = 5000s

figure('Name','Temperaturverteilung Platte t = 5000s');
quadplot(nodes, elements, T(:, end));
grid on;
grid minor;

%% Berechnung der nötigen Zeit für das Kühlen unter 450 K bei y = 0.3

sysmat_s = zeros(18,18);
rhs_s = zeros(18,1);
T_s = zeros(18, 1);
T_s(:) = 300;
t_s = 0;
dt_s = 500;

cold = true;
for f = 15:18
    if(T_s(f, end) > 450)
        cold = false;
    end
end

while(cold)
    t_s=t_s+dt_s;
    
    
    sysmat_s = zeros(18,18);
    elevec_s = zeros(18,1);
    rhs_s = zeros(18,1);
    
    for e = 1:l
        elenodes = nodes(elements(e,:),:);
        [ elemat, elevec ] = evaluate_instat(elenodes, gx2dref(n), gw2dref(n), T_s(elements(e,:),t_s/dt_s), [], 1 ,dt_s, 0.5, firststep); 
        [ sysmat_s, rhs_s ] = assemble( elemat,elevec,sysmat_s,rhs_s,elements(e,:) );
    end    
    
    [ sysmat_s, rhs_s ] = assignDBC( sysmat_s, rhs_s, dbc );

    T_s(:,t_s/dt_s+1) = sysmat_s\rhs_s;
    
    
    for f = 15:18
        if(T_s(f, end) > 450)
            cold = false;
        end
    end
end

%% Ausgabe der Temperatur
disp('Lösung bei T <= 450 K');
fprintf('\nT¹⁰_15\t=\t%f\nT¹⁰_16\t=\t%f\nT¹⁰_17\t=\t%f\nT¹⁰_18\t=\t%f\nZeitpunkt t\t=\t%f\n', T_s(15,end), T_s(16,end), T_s(17,end), T_s(18,end), t_s); 

%% Plot t = 5000s

figure('Name','Temperaturverteilung Platte bei T <= 450 K');
quadplot(nodes, elements, T_s(:, end));
grid on;
grid minor;
