function [ x ] = solveGauss( A,b )
%Rückgabewert: Spaltenvektor mit Lösung x

[m,n] = size(A); 
x = zeros(m,1);
v = b;

% erzeugen der rechten Dreiecksmatrix
for j = 1:n-1
    for i = j+1:m
        v(i) = v(i) - A(i,j)/A(j,j) * v(j);
        A(i,:) = A(i,:) - A(i,j)/A(j,j) * A(j,:);
    end    
end

% Rückwärtseinsetzen
for k = m:-1:1
    x(k) = v(k)/A(k,k);
    for l = k+1:m
        x(k) = x(k)-A(k,l)*x(l)/A(k,k);
    end
end

end

