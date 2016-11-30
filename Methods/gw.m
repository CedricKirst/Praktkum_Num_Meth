function [ gaussw ] = gw( n )
%Berechnet die ersten n Gewichte gaussw als Zeilenvektor

switch n
    case 1
        gaussw = 2;
    case 2
        gaussw = [1,1];
    case 3
        gaussw = [5/9, 8/9, 5/9];
    case 4
        gaussw = 18/36+sqrt(30)/36*[-1,1,1,-1];
    case 5
        gaussw = 322/900 + 13/900 * sqrt(70)*[-1,1,1,-1];
    otherwise
        disp('fun [gaussw] = gw(n) input n must be an integer from 1 to 5!');
end

end

