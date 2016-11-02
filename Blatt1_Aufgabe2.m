%Blatt 1
%Aufgabe 2

clc; clear all; close all; format long;

disp('======================Output=======================');

a = rand(1000, 1);

disp(' ');

if(a(1) >= 0.5)
    disp('a1 >= 0.5');
else
    disp('a1 < 0.5');
end

n_05 = 0;
weiter = true;
index = 0;
wert = 0;

for i = 1 : 1000
    if ( a(i) >= 0.5 )
        n_05 = n_05+1;
    end 
    if ( a(i) <= 0.501 && a(i) >= 0.499 && weiter == true )
        wert = a(i);
        index = i;
        weiter = false;
    end
end

fprintf('Der Vector a enthält %i Einträge >= 0.5\n', n_05);
if( weiter == true)
    disp('Der Vector a enthält keinen Wert x, mit 0.499 <= x <= 0.501\n');
else
    fprintf('a(%i) = %f ist der erste Eintrag in a, mit 0.499 <= a(i) <= 0.501\n\n', index, wert);
end

disp('Test function fac:');
disp('facultaet(0):');
disp(facultaet(0));
disp('facultaet(5):');
disp(facultaet(5));

disp('=======================end========================');