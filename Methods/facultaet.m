function [ nfac ] = facultaet( n )
%fac berechnet die Fakultät von der Eingabe n
nfac = 1;
if(n >= 0 && ~mod(n,1))
    for i = 1:n
        nfac = nfac * i;
    end
else
    disp('Eingabewert muss positiv und ganzzahlig sein!');
    nfac = NaN;
end


end

