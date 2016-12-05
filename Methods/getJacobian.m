function [ J, detJ, invJ ] = getJacobian( nodes, xi, eta )
%Berechnet Jacobimatrix und ihre Determinante

deriv = linquadderivref(xi, eta);

J = [nodes' * deriv(:,1) , nodes' * deriv(:,2)];
detJ = det(J);
invJ = inv(J);

end

