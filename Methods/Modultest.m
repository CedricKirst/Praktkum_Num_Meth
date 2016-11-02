% Modultests

clc; clear all; close all;


cprintf('key', '========================================Modultest========================================\n\n');
%function nfac = facultaet( n )

if(norm(facultaet(0) -1) > 1e-12 || norm(facultaet(5) -120) > 1e-12)
    cprintf('text', '['); cprintf('error', 'FAIL'); cprintf('text', ']\tfunction nfac = facultaet( n )\n');
else
    cprintf('text', '['); cprintf('comment', 'OK'); cprintf('text', ']\tfunction nfac = facultaet( n )\n');
end
    
cprintf('key', '\n=========================================================================================\n\n');