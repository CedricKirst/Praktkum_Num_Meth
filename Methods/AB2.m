function [ LHS, RHS ] = AB2( timestep, M, B, C, sol )
%Berechnet LHS und RHS für : LHS *φ n+1 = RHS mit dem AB2 Verfahren 

LHS = M;
RHS = M*sol(1)+3/2*timestep*(B(1)*sol(1)+C(1))-timestep/2*(B(2)*sol(2)+C(2));

end

