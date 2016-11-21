function [ gaussw ] = gw2dref( n )
%gibt einen Zeilenvektor gaussw zurück mit allen Gewichten für eine 2d
%Gaussintegration

wi = gw(n);
gaussw = zeros(n^2,1);
k = 1;

for i = 1:length(wi)
    for j = 1:length(wi)
      
        gaussw(k) = wi(i) * wi(j);
        k = k+1;
        
    end
end

end

