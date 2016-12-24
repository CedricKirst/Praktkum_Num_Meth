function [ eigval ] = VecIt( A, x0, tol, itermax )
%[A ... [Matrix], x0 ... [Startvektor], 
%tol ... [Toleranz], 
%itermax ... [max. Iterationsanzahl]]
%Rückgabewert: maximale Eigenwert der Matrix A

iter = 1;
x = x0;
lambda2 = x'*A*x;
p = A*x;
x = p/norm(p);
lambda1 = x'*A*x;

while(norm(lambda1-lambda2) > tol && iter<= itermax)
    p = A*x;
    x = p/norm(p);
    lambda1 = x'*A*x;
    
    iter = iter+1;
end

eigval = lambda1;

end

