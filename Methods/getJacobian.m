function [ J, detJ, invJ ] = getJacobian( nodes, xi, eta )
%Berechnet Jacobimatrix und ihre Determinante

deriv = linquadderivref(xi, eta);

J = [deriv(:,1)' *nodes ; deriv(:,2)' * nodes];
detJ = det(J);
invJ = inv(J);

end

