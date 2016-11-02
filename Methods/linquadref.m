function [ val ] = linquadref( xi, eta )
%Berechnet das Lagrangepolynom im punkt (xi, eta)

val = zeros(4,1);

val(1) = (1-xi)*(1-eta)/4;
val(2) = (1+xi)*(1-eta)/4;
val(3) = (1+xi)*(1+eta)/4;
val(4) = (1-xi)*(1+eta)/4;

end

