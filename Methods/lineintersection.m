function [ x ] = lineintersection( P1, P2 )
%lineintersection berechnet den Schnittpunkt mit der x-Achse mit der durch
%P1 und P2 definierten Gerade

a =(P1(2) - P2(2)) / (P1(1) - P2(1));

x = -P1(2)/a  + P1(1);


end