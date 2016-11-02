%  Blatt 1
%  Aufgabe 1

clc; clear all; close all; format long;

disp('======================Output=======================');

A = 3 * eye(4);
v = [1;2;3;4];

disp('Matrix A:');
disp(A);
disp('Vector v:');
disp(v);


a = v'*v;

disp('a = v*v:');
disp(a);

B = v * v';

disp('B = v*v":');
disp(B);

C = A * B;

disp('C = A*B:');
disp(C);

lambda = eig(C);

disp('Eigenwerte von C:');
disp(lambda);

x = (C-A)\(a*v);

disp('x = (C-A)\(a*v)');
disp(x);

C(2, :) = v;

disp('C(2, :) = v');
disp(C);

b = C(3, :);

disp('b = C(3, :)');
disp(b);

c = 10.0 : 0.5 : 100.0;

disp('c = 10 : 0.5 : 100.0');
disp(c);

f = zeros(length(c), 1);

for i = 1:length(c)
    f(i) = c(i) * (5 + c(i)) + 1/c(i) + 2^c(i);
end

disp('f(i) = c(i) * (5 + c(i)) + 1/c(i) + 2^c(i)');
disp(f);

l_f = length(f);

disp('Dimension von f:');
disp(l_f);

disp('=======================end====================');