% Modultests

%% initialize
clc; clear all; close all;format long;
count = 0;
failcount = 0;


cprintf('key', '=================================================================Modultest================================================================\n\n');
%% function [ nfac ] = facultaet( n )
%facultaet(0)
erg=facultaet(0);
correrg = 1;
if(norm(erg -correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ nfac ] = facultaet( n )\n\t\t-----> n = 0\n\t\t==>>\tnfac = %f\n\t\t~=\t\t%f\n', erg, correrg);
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ nfac ] = facultaet( n )\n\t\t-----> n = 0\n\t\t==>>\tnfac = %f\n', erg);
end
count = count+1;

%facultaet(5)
erg=facultaet(5); 
correrg = 120;
if(norm(facultaet(5) - correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ nfac]  = facultaet( n )\n\t\t-----> n = 5\n\t\t==>>\tnfac = %f\n\t\t~=\t\t%f\n', erg, correrg);
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ nfac ] = facultaet( n )\n\t\t-----> n = 5\n\t\t==>>\tnfac = %f\n', erg);
end

%% function  [ val ] = linquadref( xi, eta )
%linquadref(0.0,0.0)
erg = linquadref(0.0,0.0);
correrg = [0.25;0.25;0.25;0.25];
if(norm(erg - correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ val ] = linquadref( xi,eta )\n\t\t-----> xi = 0.0 eta = 0.0\n\t\t==>>\tval = [%f;%f;%f;%f]\n\t\t~=\t\t[%f;%f;%f;%f]\n',erg(1),erg(2),erg(3),erg(4),correrg(1),correrg(2),correrg(3),correrg(4));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ val ] = linquadref( xi,eta )\n\t\t-----> xi = 0.0 eta = 0.0\n\t\t==>>\tval = [%f;%f;%f;%f]\n',erg(1),erg(2),erg(3),erg(4));    
end

%linquadref(0.577,-0.577)
erg = linquadref(0.577,-0.577);
correrg = [0.16676775;0.62173225;0.16676775;0.04473225];
if(norm(erg - correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ val ] = linquadref( xi,eta )\n\t\t-----> xi = 0.775 eta = -0.775\n\t\t==>>\tval = [%f;%f;%f;%f]\n\t\t~=\t\t[%f;%f;%f;%f]\n',erg(1),erg(2),erg(3),erg(4),correrg(1),correrg(2),correrg(3),correrg(4));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ val ] = linquadref( xi,eta )\n\t\t-----> xi = 0.775 eta = -0.775\n\t\t==>>\tval = [%f;%f;%f;%f]\n',erg(1),erg(2),erg(3),erg(4));    
end
count = count+1;

%% function [ deriv ] = linquadderivref( xi, eta )
%linquadderivref(0.0,0.0)
erg = linquadderivref(0.0,0.0);
correrg = [-0.25,-0.25;0.25,-0.25;0.25,0.25;-0.25,0.25];
if(norm(erg - correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ val ] = linquadderivref( xi,eta )\n\t\t-----> xi = 0.0 eta = -0.0\n\t\t==>>\tval = [%f,%f;%f,%f;%f,%f;%f,%f]\n\t\t~= \t\t[%f,%f;%f,%f;%f,%f;%f,%f]\n',erg(1),erg(2),erg(3),erg(4),erg(5),erg(6),erg(7),erg(8),correrg(1),correrg(2),correrg(3),correrg(4),correrg(5),correrg(6),correrg(7),correrg(8));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ val ] = linquadderivref( xi,eta )\n\t\t-----> xi = 0.0 eta = -0.0\n\t\t==>>\tval = [%f,%f;%f,%f;%f,%f;%f,%f]\n',erg(1),erg(2),erg(3),erg(4),erg(5),erg(6),erg(7),erg(8));    
end
count = count+1;

%linquadderivref(0.577,-0.577)
erg = linquadderivref(0.577,-0.577);
correrg = [-0.39425,-0.10575;0.39425,-0.39425;0.10575,0.39425;-0.10575,0.10575];
if(norm(erg - correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ val ] = linquadderivref( xi,eta )\n\t\t-----> xi = 0.577 eta = -0.577\n\t\t==>>\tval = [%f,%f;%f,%f;%f,%f;%f,%f]\n\t\t~= \t\t%f,%f;%f,%f;%f,%f;%f,%f]\n',erg(1),erg(2),erg(3),erg(4),erg(5),erg(6),erg(7),erg(8),correrg(1),correrg(2),correrg(3),correrg(4),correrg(5),correrg(6),correrg(7),correrg(8));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ val ] = linquadderivref( xi,eta )\n\t\t-----> xi = 0.577 eta = -0.577\n\t\t==>>\tval = [%f,%f;%f,%f;%f,%f;%f,%f]\n',erg(1),erg(2),erg(3),erg(4),erg(5),erg(6),erg(7),erg(8));    
end
count = count+1;

%% function [ gaussx ] = gx( n )
%gx(3)
erg = gx(3);
correrg = [-0.774596669241483,0,0.774596669241483];
if(norm(erg-correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ gaussx ] = gx( n )\n\t\t-----> n = 3\n\t\t==>>\tgaussx = [%.12f,%.12f,%.12f]\n\t\t~= \t\t[%.12f,%.12f,%.12f]\n',erg(1),erg(2),erg(3),correrg(1),correrg(2),correrg(3));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ gaussx ] = gx( n )\n\t\t-----> n = 3\n\t\t==>>\tgaussx = [%f,%f,%f]\n',erg(1),erg(2),erg(3));
end
count = count+1;

%% function [ gaussw ] = gw( n )
%gw(3)
erg = gw(3);
correrg = [0.55555555555555,0.88888888888889,0.55555555555555];
if(norm(erg-correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ gaussw ] = gw( n )\n\t\t-----> n = 3\n\t\t==>>\tgaussw = [%.12f,%.12f,%.12f]\n\t\t~= \t\t[%.12f,%.12f,%.12f]\n',erg(1),erg(2),erg(3),correrg(1),correrg(2),correrg(3));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ gaussw ] = gw( n )\n\t\t-----> n = 3\n\t\t==>>\tgaussw = [%f,%f,%f]\n',erg(1),erg(2),erg(3));
end
count = count+1;

%% function [ gaussx ] = gx2dref( n )
%gx2dref(1)
erg = gx2dref(1);
correrg = [0.0,0.0];
if(norm(erg-correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ gaussx ] = gx2dref( n )\n\t\t-----> n = 1\n\t\t==>>\tgaussx = [%.12f,%f]\n\t\t~= \t\t[%.12f,%.12f]\n',erg(1),erg(2),correrg(1),correrg(2));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ gaussx ] = gx2dref( n )\n\t\t-----> n = 1\n\t\t==>>\tgaussx = [%f,%f]\n',erg(1),erg(2));
end
count = count+1;

%gx2dref(2)
erg = gx2dref(2);
correrg = [-0.577350269189626,-0.577350269189626;-0.577350269189626,0.577350269189626;0.577350269189626,-0.577350269189626;0.577350269189626,0.577350269189626];
if(norm(erg-correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ gaussx ] = gx2dref( n )\n\t\t-----> n = 2\n\t\t==>>\tgaussx = [%.12f,%.12f;%.12f,%.12f;%.12f,%.12f;%.12f,%.12f]\n\t\t~=  \t\t[%.12f,%.12f;%.12f,%.12f;%.12f,%.12f;%.12f,%.12f]\n',erg(1),erg(2),erg(3),erg(4),erg(5),erg(6), erg(7), erg(8), correrg(1),correrg(2),correrg(3),correrg(4),correrg(5),correrg(6), correrg(7), correrg(8));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ gaussx ] = gx2dref( n )\n\t\t-----> n = 2\n\t\t==>>\tgaussx = [%f,%f;%f,%f;%f,%f;%f,%f]\n',erg(1),erg(2),erg(3),erg(4),erg(5),erg(6), erg(7), erg(8));
end
count = count+1;

%% function [ gaussw ] = gw2dref( n )
%gw2dref(1)
erg = gw2dref(1);
correrg = 4.0;
if(norm(erg-correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ gaussw ] = gw2dref( n )\n\t\t-----> n = 1\n\t\t==>>\tgaussw = [%.12f]\n\t\t~= \t\t[%.12f]\n',erg(1), correrg(1));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ gaussw ] = gw2dref( n )\n\t\t-----> n = 1\n\t\t==>>\tgaussw = [%f]\n',erg(1));
end
count = count+1;

%gw2dref(2)
erg = gw2dref(2);
correrg = [1;1;1;1];
if(norm(erg-correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ gaussw ] = gx2dref( n )\n\t\t-----> n = 2\n\t\t==>>\tgaussw = [%.12f;%.12f;%.12f;%.12f]\n\t\t~= \t\t[%.12f;%.12f;%.12f;%.12f]\n',erg(1),erg(2),erg(3),erg(4),correrg(1),correrg(2),correrg(3),correrg(4));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ gaussw ] = gx2dref( n )\n\t\t-----> n = 2\n\t\t==>>\tgaussw = [%f;%f;%f;%f]\n',erg(1),erg(2),erg(3),erg(4));
end
count = count+1;

%% function [ x ] = getxPos( nodes, xi, eta )
%getxPos([2 1;4 1;4 3;2 2], 0.577,-0.577)
erg = getxPos([2 1;4 1;4 3;2 2], 0.577,-0.577);
correrg = [3.577;1.37826775];
if(norm(erg-correrg) > 1e-12)
    fprintf('[FAIL]\tfunction [ x ] = getxPos( nodes, xi, eta )\n\t\t-----> nodes = [2, 1; 4, 1; 4, 3; 2, 2]\txi = 0.577, eta = -0.577\n\t\t==>>\tx = [%.12f;%.12f]\n\t\t~= \t\t[%.12f;%.12f]\n',erg(1),erg(2),correrg(1), correrg(2));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ x ] = getxPos( nodes, xi, eta )\n\t\t-----> nodes = [2, 1; 4, 1; 4, 3; 2, 2]\txi = 0.577, eta = -0.577\n\t\t==>>\tx = [%f;%f]\n',erg(1),erg(2));
end
count = count+1;

%% function [ J, detJ, invJ ] = getJacobian( nodes, xi, eta )
%getJacobian([2 1;4 1;4 3;2 2], 0.577,-0.577)
[J, detJ, invJ] = getJacobian([2 1;4 1;4 3;2 2], 0.577,-0.577);
corrJ = [1.0,0;0.10575,0.89425];
corrdetJ = 0.89425;
corrinvJ = [1.0, 0; -0.1182555, 1.1182555];

if(norm(J-corrJ) > 1e-12 || norm(detJ-corrdetJ) > 1e-12 || norm(invJ - corrinvJ) > 1e-12)
    fprintf('[FAIL]\tfunction [ J, detJ, invJ ] = getJacobian( nodes, xi, eta )\n\t\t-----> nodes = [2, 1; 4, 1; 4, 3; 2, 2]\txi = 0.577, eta = -0.577\n\t\t==>>\tJ = [%.12f,%.12f;%.12f,%.12f]\n\t\t~=\t\t[%.12f,%.12f;%.12f,%.12f]\n\t\t==>>\tdetJ = [%.12f]\n\t\t~=\t\t[%.12f]\n\t\t==>>\tinvJ = [%.12f,%.12f;%.12f,%.12f]\n\t\t~= \t\t[%.12f,%.12f;%.12f,%.12f]\n',J(1), J(2), J(3), J(4), corrJ(1), corrJ(2), corrJ(3), corrJ(4), detJ, corrdetJ, invJ(1), invJ(2), invJ(3), invJ(4), corrinvJ(1), corrinvJ(2), corrinvJ(3), corrinvJ(4));
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ J, detJ, invJ ] = getJacobian( nodes, xi, eta )\n\t\t-----> nodes = [2, 1; 4, 1; 4, 3; 2, 2]\txi = 0.577, eta = -0.577\n\t\t==>>\tJ = [%f,%f;%f,%f]\n\t\t==>>\tdetJ = [%f]\n\t\t==>>\tinvJ = [%f,%f;%f,%f]\n',J(1), J(2), J(3), J(4), detJ, invJ(1), invJ(2), invJ(3), invJ(4));
end
count = count+1;


%% function [ LHS, RHS ] = OST( theta, timestep, M, B, C, sol )
[ LHS, RHS ] = OST( 0.5, 0.2, [1.1], [1.4,1.5], [1.7,1.8], [2.0] );
corrLHS = 0.96;
corrRHS = 2.85;
if(norm(LHS-corrLHS) > 1e-12 || norm(RHS-corrRHS) > 1e-12)
    fprintf('[FAIL]\tfunction [ LHS, RHS ] = OST( theta, timestep, M, B, C, sol )\n\t\t-----> theta = 0.5\ttimestep = 0.2, M = [1.1]\tB = [1.4,1.5]\tC = [1.7, 1.8]\tsol = [2.0]\n\t\t==>>\tRHS = [%.12f]\n\t\t~=\t\t[%.12f]\n\t\t==>>\tLHS = [%.12f]\n\t\t~=\t\t[%.12f]\n',RHS, corrRHS, LHS, corrLHS);
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ LHS, RHS ] = OST( theta, timestep, M, B, C, sol )\n\t\t-----> theta = 0.5\ttimestep = 0.2, M = [1.1]\tB = [1.4,1.5]\tC = [1.7, 1.8]\tsol = [2.0]\n\t\t==>>\tRHS = [%f]\n\t\t==>>\tLHS = [%f]\n',RHS, LHS);
end
count = count+1;

%% function [ LHS, RHS ] = AB2( timestep, M, B, C, sol )
[ LHS, RHS ] = AB2( 0.2, [1.1], [1.5,1.6], [1.8,1.9], [2.0,2.1] );
corrLHS = 1.1;
corrRHS = 3.114;
if(norm(LHS-corrLHS) > 1e-12 || norm(RHS-corrRHS) > 1e-12)
    fprintf('[FAIL]\tfunction [ LHS, RHS ] = AB2( timestep, M, B, C, sol )\n\t\t----->timestep = 0.2, M = [1.1]\tB = [1.5,1.6]\tC = [1.8, 1.9]\tsol = [2.0, 2.1]\n\t\t==>>\tRHS = [%.12f]\n\t\t~=\t\t[%.12f]\n\t\t==>>\tLHS = [%.12f]\n\t\t~=\t\t[%.12f]\n',RHS, corrRHS, LHS, corrLHS);
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ LHS, RHS ] = AB2( timestep, M, B, C, sol )\n\t\t----->timestep = 0.2, M = [1.1]\tB = [1.5,1.6]\tC = [1.8, 1.9]\tsol = [2.0, 2.1]\n\t\t==>>\tRHS = [%f]\n\t\t==>>\tLHS = [%f]\n',RHS, LHS);
end
count = count+1;

%% function [ LHS, RHS ] = AM3( timestep, M, B, C, sol )
[ LHS, RHS ] = AM3(0.2, [1.1], [1.4, 1.5, 1.6], [1.7, 1.8, 1.9], [2.0, 2.1]);
corrLHS = 0.983333333333333;
corrRHS = 2.894;
if(norm(LHS-corrLHS) > 1e-12 || norm(RHS-corrRHS) > 1e-12)
    fprintf('[FAIL]\tfunction [ LHS, RHS ] = AM3( timestep, M, B, C, sol )\n\t\t----->timestep = 0.2, M = [1.1]\tB = [1.4,1.5,1.6]\tC = [1.7,1.8, 1.9]\tsol = [2.0, 2.1]\n\t\t==>>\tRHS = [%.12f]\n\t\t~=\t\t[%.12f]\n\t\t==>>\tLHS = [%.12f]\n\t\t~=\t\t[%.12f]\n',RHS, corrRHS, LHS, corrLHS);
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ LHS, RHS ] = AM3( timestep, M, B, C, sol )\n\t\t----->timestep = 0.2, M = [1.1]\tB = [1.4,1.5,1.6]\tC = [1.7,1.8, 1.9]\tsol = [2.0, 2.1]\n\t\t==>>\tRHS = [%f]\n\t\t==>>\tLHS = [%f]\n',RHS, LHS);
end
count = count+1;

%% function [ LHS, RHS ] = AM3( timestep, M, B, C, sol )
[ LHS, RHS ] = BDF2(0.2, [1.1], [1.4], [1.7], [2.0, 2.1]);
corrLHS = 1.37;
corrRHS = 3.585;
if(norm(LHS-corrLHS) > 1e-12 || norm(RHS-corrRHS) > 1e-12)
    fprintf('[FAIL]\tfunction [ LHS, RHS ] = BDF2( timestep, M, B, C, sol )\n\t\t----->timestep = 0.2, M = [1.1]\tB = [1.4]\tC = [1.7]\tsol = [2.0, 2.1]\n\t\t==>>\tRHS = [%.12f]\n\t\t~=\t\t[%.12f]\n\t\t==>>\tLHS = [%.12f]\n\t\t~=\t\t[%.12f]\n',RHS, corrRHS, LHS, corrLHS);
    failcount = failcount +1;
else
    fprintf('[OK]\tfunction [ LHS, RHS ] = BDF2( timestep, M, B, C, sol )\n\t\t----->timestep = 0.2, M = [1.1]\tB = [1.4]\tC = [1.7]\tsol = [2.0, 2.1]\n\t\t==>>\tRHS = [%f]\n\t\t==>>\tLHS = [%f]\n',RHS, LHS);
end
count = count+1;

%% end

fprintf('\n\n------------------------------------------------------------------------------------------------------------------------------------------\n');
cprintf('Errors', '%i / %i Tests failed', failcount, count);
cprintf('key', '\n==========================================================================================================================================\n\n');
