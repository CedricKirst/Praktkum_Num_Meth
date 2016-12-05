function [ LHS, RHS ] = OST( theta, timestep, M, B, C, sol )
%Berechnet LHS und RHS für : LHS *φ n+1 = RHS mit dem One Step Theta Verfahren 

LHS = M-theta*timestep*B(1);
RHS = M*sol + (1-theta)*timestep*(B(2)*sol+C(2))+theta*timestep*C(1);

end

