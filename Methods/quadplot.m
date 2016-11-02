function quadplot(nodes, elements, sol)

m = length(elements);
tri = zeros(2*m, 3);

for i = 1 : m
    tri(2*i-1, :) = elements(i, 1:3);
    tri(2*i, 1) = elements(i, 3);
    tri(2*i, 2) = elements(i, 4);
    tri(2*i, 3) = elements(i, 1);
end

trisurf(tri, nodes( : , 1), nodes( : , 2 ), sol);

end