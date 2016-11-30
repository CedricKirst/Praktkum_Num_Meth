function [ x ] = getxPos( nodes, xi, eta )
%Transformiert von Referenzsystem in kart (x-y)-System

x = [linquadref(xi, eta)'*nodes]';

end

