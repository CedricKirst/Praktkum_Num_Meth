function [ wert ] = LagrangePolynom( x, n, x_node, f_node )
%Wertet das Lagrangepolynom an einer bestimmten Stelle x aus.
wert = 0;

for i = 0:n
        wert = wert + f_node(i+1)*LagrangeBasis(x, n, i, x_node);
end

end

function [ wert ] = LagrangeBasis( x, n, i, x_node )
%Berechnet die i-te Lagrangebasis der Ordnung n an der Stelle x mit den
%Stützstellen x_node
wert = 1;

for j = 0:n
    if(j~=i) 
            wert = wert * (x - x_node(j+1))/(x_node(i+1) - x_node(j + 1));
    end
end
    
end