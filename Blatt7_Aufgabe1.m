%Blatt 7
% Aufgabe 1
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
n = 2;

for e = 1:l
    elenodes = nodes(elements(e,:),:);
    [ elemat, elevec ] = evaluate_stat(elenodes , gx2dref(n), gw2dref(n) );
    [ sysmat, rhs ] = assemble( elemat,elevec,sysmat,rhs,elements(e,:) );
end

[ sysmat, rhs ] = assignDBC( sysmat, rhs, dbc );

T = sysmat\rhs;

figure('Name','Temperaturverteilung Platte');
quadplot(nodes, elements, T);
grid on;
grid minor;

kritisch = false;
for t = 15:18
    if(T(t) > 450)
        T(t)
        kritisch = true;
    end
end

while(kritisch)
    r = r+0.01;
    
    nodes(12,:) = [b-r*sin(pi/6);h-r*cos(pi/6)];
    nodes(13,:) = [b; h-r];
    nodes(14,:) =  [b-r*cos(pi/6);h-r*sin(pi/6)];
    nodes(17,:) = [b/2; h];
    nodes(18,:) = [b-r, h];

   
    sysmat = zeros(18,18);
    rhs = zeros(18,1);
    n = 2;

    for e = 1:l
        elenodes = nodes(elements(e,:),:);
        [ elemat, elevec ] = evaluate_stat(elenodes , gx2dref(n), gw2dref(n) );
        [ sysmat, rhs ] = assemble( elemat,elevec,sysmat,rhs,elements(e,:) );
    end

    [ sysmat, rhs ] = assignDBC( sysmat, rhs, dbc );

    T = sysmat\rhs;
    
    kritisch = false;
    for t = 15:18
        if(T(t) > 450)
            T(t);
            kritisch = true;
        end
    end
end

figure('Name','Temperaturverteilung Platte Optimiert');
quadplot(nodes, elements, T);
grid on;
grid minor;
