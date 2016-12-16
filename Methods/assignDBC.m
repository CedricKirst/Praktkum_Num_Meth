function [ sysmat, rhs ] = assignDBC( sysmat, rhs, dbc )
%[sysmat ... Systemmatrix A, 
%rhs ... Systemvektor f ,
%dbc ... Dirichlet Randbedingung-Matrix (Zeile: (dbc), Spalte (1: Knotenindex, 2: Wert)]
%Rückgabewert: Systemmatrix A, Systemvektor f

[m,~] = size(dbc);
for i = 1:m
    sysmat(dbc(i,1),:) = 0;
    sysmat(dbc(i,1),dbc(i,1)) = 1;
    rhs(dbc(i,1)) = dbc(i,2);
end

end
