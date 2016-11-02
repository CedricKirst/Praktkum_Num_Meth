function [ wert ] = LagrangeDerivPolynom( x, n, x_node, f_node )
%Wertet die Aableitung des Lagrangepolynoms an einer bestimmten Stelle x aus.
wert = 0;

for i = 0:n
        wert = wert + f_node(i+1)*LagrangeDerivBasis(x, n, i, x_node);
end

end


function [ wert ] = LagrangeDerivBasis( x, n, i, x_node )
%Berechnet die i-te Lagrangebasis für die Ableitung des Lagrangepolynoms der Ordnung n an der Stelle x mit den
%Stützstellen x_node8 n
wert = 0;

for m = 0 : n    
    if(m ~= i)
        prod = 1;
        for k = 0 : n       
                if(k ~= i && k ~= m)
                        prod = prod * (x - x_node(k+1))/(x_node(i+1) - x_node(k+1));
                end
        end

        wert = wert + prod/(x_node(i+1) - x_node(m+1));
    end
end

end