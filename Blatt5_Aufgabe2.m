%Blatt 5
%Aufgabe 2

clc; clear all; close all;format long;
addpath('Methods');

nodes = [2 1;4 1;4 3;2 2];

%%Approximation mit n = 1 Gausspunkten
n = 1;
gxi = gx2dref(n);
gw = gw2dref(n);
gx = getxPos(nodes, gxi(:,1),gxi(:,2));
N = linquadref(gxi(1), gxi(2));
gf = N(1,:).* N(2,:);
gf = gf';
[ J, detJ, invJ ] = getJacobian( nodes, gxi(1), gxi(2) );

m_12G1 = gw' * gf * detJ;

%%Approximation mit n = 2 Gausspunkten
n = 2;
gxi = gx2dref(n);
gw = gw2dref(n);
gx = getxPos(nodes, gxi(:,1),gxi(:,2));
N = linquadref(gxi(:,1), gxi(:,2));
gf = N(1,:).* N(2,:);
gf = gf';
detJ = zeros(length(gxi),1);
for i = 1:length(gxi)
    [ J, detJ(i), invJ ] = getJacobian( nodes, gxi(i,1), gxi(i,2) );
end

m_12G2 = (gw.* gf)' * detJ;

%%Approximation mit n = 3 Gausspunkten
n = 3;
gxi = gx2dref(n);
gw = gw2dref(n);
gx = getxPos(nodes, gxi(:,1),gxi(:,2));
N = linquadref(gxi(:,1), gxi(:,2));
gf = N(1,:).* N(2,:);
gf = gf';
detJ = zeros(length(gxi),1);
for i = 1:length(gxi)
    [ J, detJ(i), invJ ] = getJacobian( nodes, gxi(i,1), gxi(i,2) );
end


m_12G3 = (gw.* gf)' * detJ;

disp('================================Output=================================');
fprintf('\n\n\t\t\tm_12G1\t=\t%f',m_12G1);
fprintf('\n\n\t\t\tm_12G2\t=\t%f',m_12G2);
fprintf('\n\n\t\t\tm_12G3\t=\t%f\n\n',m_12G3);
disp('=================================end===================================');