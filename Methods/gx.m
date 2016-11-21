function [ gaussx ] = gx( n )
%Berechnet die Positionen gaussx(i) für eine 1d Gauss-Integration

switch n
    case 1
        gaussx = 0;
    case 2
        gaussx = sqrt(1/3)*[-1;1];
    case 3
        gaussx = sqrt(3/5)*[-1;0;1];
    case 4
        gaussx = [-sqrt(3/7+2/7*sqrt(5/6)); -sqrt(3/7-2/7*sqrt(5/6)); ...
            sqrt(3/7-2/7*sqrt(5/6)); sqrt(3/7+2/7*sqrt(5/6))];
    case 5
        gaussx = 1/3 * [-sqrt(5+2*sqrt(10/7)); -sqrt(5-2*sqrt(10/7)); ...
            sqrt(5-2*sqrt(10/7)); sqrt(5+2*sqrt(10/7))];
    otherwise
        disp('fun [gaussx] = gx(n) input n must be an integer from 1 to 5!');
end


end

