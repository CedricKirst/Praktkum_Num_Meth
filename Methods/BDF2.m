function [ LHS, RHS ] = BDF2( timestep, M, B, C, sol )
%%Berechnet LHS und RHS für : LHS *φ n+1 = RHS mit dem BDF2 Verfahren 

LHS = 3/2*M-timestep*B(1);
RHS = 2*M*sol(1)-0.5*M*sol(2)+timestep*C;

end

