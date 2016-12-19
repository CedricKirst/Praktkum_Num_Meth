function [ elemat, elevec ] = evaluate_instat( elenodes, gpx, gpw, elesol, eleosol, timInt_m, timestep, theta, firststep)
%[elenodes ... [Knotenpositionen(Zeile: Knoten i, Spalte: x,y)], 
%gpx ... [Positionen ξ i Gauss-Integration],
%gpw ... [Gewichte w i Gauss-Integration], 
%elesol ... [Lösung Zeitschritt (n)-Spaltenvektor],
%eleosol ... [Lösung Zeitschritt (n-1)-Spaltenvektor],
%timInt_m ... [Zeitintegrationsverfahren: 1=OST, 2=AB2, 3=AM3, 4=BDF2],
%timestep ... [Zeitschrittlänge ∆t], 
%theta ... [θ für OST], 
%firststep ... [erste Zeitschritt?]]
%Rückgabewert: Elementmatrix A (e) und Elementvektor f (e)

elemat = zeros(length(elenodes));
elevec = zeros(4,1);
rho = 7800;
lambda = 48.0;
c = 452;

if (firststep == true && timInt_m ~= 1)
    timInt_m = 1;
    theta = 0.5;
end

for k = 1:length(gpx)
    N = linquadref(gpx(k,1), gpx(k,2));
    dN = linquadderivref(gpx(k,1), gpx(k,2));
    [~,detJ,invJ] = getJacobian(elenodes, gpx(k,1),gpx(k,2));
    
    for i = 1:length(elenodes)
        for j = 1:length(elenodes)
            Mij = rho*c*N(i,:)*N(j,:)*detJ*gpw(k);
            Bij = -lambda*dN(i,:)*invJ*(dN(j,:)*invJ)'*detJ*gpw(k);
            
            
            switch timInt_m
                case 1
                    [LHS, RHS] = OST(theta, timestep, Mij, [Bij, Bij], [0 0], elesol(j));
                case 2
                    [LHS, RHS] = AB2(timestep, Mij, [Bij, Bij], [0 0], [elesol(j), eleosol(j)]);
                case 3
                    [LHS, RHS] = AM3(timestep, Mij,  [Bij, Bij, Bij], [0 0 0], [elesol(j), eleosol(j)]);
                case 4
                    [LHS, RHS] = BDF2(timestep, Mij, Bij, 0, [elesol(j), eleosol(j)]);
            end
            
            elemat(i,j) = elemat(i,j)+LHS;
            elevec(i) = elevec(i)+RHS;
            
        end
    end
    
end
    
end