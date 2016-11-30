function [ J, detJ, invJ ] = getJacobian( nodes, xi, eta )
%Berechnet Jacobimatrix und ihre Determinante

deriv = linquadderivref(xi, eta);

J = [nodes' * deriv(:,1) , nodes' * deriv(:,2)];
detJ = det(J);
%adj = [J(2,2) , -J(1,2);-J(2,1), J(1,1)];
%invJ = adj/detJ;
invJ = inv(J);

end

