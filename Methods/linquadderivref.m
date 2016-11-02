function [ deriv ] = linquadderivref( xi, eta )
%Berechnet Ableitung des Lagrangepolynoms bei (xi, eta)

deriv = zeros(4,2);

deriv(1,1) = (eta-1)/4;
deriv(1,2) = (xi-1)/4;
deriv(2,1) = (1-eta)/4;
deriv(2,2) = (-1-xi)/4;
deriv(3,1) = (1+eta)/4;
deriv(3,2) = (1+xi)/4;
deriv(4,1) = (-1-eta)/4;
deriv(4,2) = (1-xi)/4;

end

