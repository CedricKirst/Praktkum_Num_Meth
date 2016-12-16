function [ sysmat, rhs ] = assemble( elemat,elevec,sysmat,rhs,ele )
%[elemat ... Elementmatrix A (e) , 
%elevec ... Elementvektor f (e) , 
%sysmat ... Systemmatrix A,
%rhs ... Systemvektor f , 
%ele ... globale Knotenindex (als Zeilenvektor)]
%Rückgabewert: Systemmatrix A, Systemvektor f
[m,n] = size(elemat);

for i = 1:m
        rhs(ele(i)) = rhs(ele(i))+elevec(i);
    for j = 1:n
        sysmat(ele(i),ele(j)) = sysmat(ele(i),ele(j))+elemat(i,j);
    end    
end

end

