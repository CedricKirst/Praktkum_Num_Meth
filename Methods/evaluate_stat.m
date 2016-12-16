function [ elemat, elevec ] = evaluate_stat( elenodes, gpx, gpw )
%[elenodes ... [Knotenpositionen(Zeile: Knoten i, Spalte: x,y)], 
%gpx ... [Positionen ξ i Gauss-Integration],
%gpw ... [Gewichte w i Gauss-Integration]]
%Rückgabewert: Elementmatrix A (e) und Elementvektor f (e)

elemat = zeros(length(elenodes));
elevec = zeros(4,1);
lambda = 48;

for i = 1:length(gpx)
    dN = linquadderivref(gpx(i,1),gpx(i,2));
    [~,detJ,invJ] = getJacobian(elenodes, gpx(i,1),gpx(i,2));
    elemat = elemat+lambda*dN*invJ*(dN*invJ)'*detJ*gpw(i);
end



end

