function [ gaussx ] = gx2dref( n )
%gibt eine nx2 Matrix gaussx zurück mit allen Stützstellen im
%Referenzsystem
x = gx(n);
k = 1;

gaussx = zeros(n^2,2);

for i = 1:length(x)
    for j = 1:length(x)
      
        gaussx(k,:) = [x(i),x(j)];
        k = k+1;
        
    end
end

end

