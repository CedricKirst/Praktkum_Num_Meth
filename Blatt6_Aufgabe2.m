% Blatt 6
% Aufgabe 2

%% Initialize
clc;close all;clear all;

t1 = 0:0.1:2;
t2 = 0:0.2:2;
t4 = 0:0.4:2;

TH0_1 = zeros(length(t1),1);
TH1_1 = TH0_1;
TH5_1 = TH0_1;
AB2_1 = TH0_1;
AM3_1 = TH0_1;
BDF2_1 = TH0_1;

TH0_2 = zeros(length(t2),1);
TH1_2= TH0_2;
TH5_2 = TH0_2;
AB2_2 = TH0_2;
AM3_2 = TH0_2;
BDF2_2 = TH0_2;

TH0_4 = zeros(length(t4),1);
TH1_4 = TH0_4;
TH5_4 = TH0_4;
AB2_4 = TH0_4;
AM3_4 = TH0_4;
BDF2_4 = TH0_4;

tex = 0:0.01:4;
phiex = exp(-5*tex).*(tex.^2-2*tex+2)-2*exp(-6*tex);


%% dt = 0.1

dt = 0.1;
M = 1;
B = [-6,-6,-6];
C = (t1.^2).*exp(-5*t1);
for i = 2:length(t1)
    [LHS,RHS] = OST(0.5,dt,M,B(1:2),[C(i),C(i-1)],TH5_1(i-1));
    TH5_1(i) = RHS/LHS;
    if(i == 2)
        AB2_1(i) = TH5_1(i);
        AM3_1(i) = TH5_1(i);
        BDF2_1(i) = TH5_1(i);
    else
        [LHS,RHS] = AB2(dt,M,B(1:2),[C(i-1),C(i-2)],[AB2_1(i-1),AB2_1(i-2)]);
        AB2_1(i) = RHS/LHS;
        [LHS,RHS] = BDF2(dt,M,B(1),C(i),[BDF2_1(i-1),BDF2_1(i-2)]);
        BDF2_1(i) = RHS/LHS;
        if(i<length(t1))
            [LHS,RHS] = AM3(dt,M,B,[C(i+1),C(i-1),C(i-2)],[AM3_1(i-1),AM3_1(i-2)]);
            AM3_1(i) = RHS/LHS;
        end
    end
    [LHS,RHS] = OST(0,dt,M,B(1:2),[C(i),C(i-1)],TH0_1(i-1));
    TH0_1(i) = RHS/LHS;
    [LHS,RHS] = OST(1,dt,M,B(1:2),[C(i),C(i-1)],TH1_1(i-1));
    TH1_1(i) = RHS/LHS;
end


%% dt = 0.2

dt = 0.2;
M = 1;
B = [-6,-6,-6];
C = (t2.^2).*exp(-5*t2);
for i = 2:length(t2)
    [LHS,RHS] = OST(0.5,dt,M,B(1:2),[C(i),C(i-1)],TH5_2(i-1));
    TH5_2(i) = RHS/LHS;
    if(i == 2)
        AB2_2(i) = TH5_2(i);
        AM3_2(i) = TH5_2(i);
        BDF2_2(i) = TH5_2(i);
    else
        [LHS,RHS] = AB2(dt,M,B(1:2),[C(i-1),C(i-2)],[AB2_2(i-1),AB2_2(i-2)]);
        AB2_2(i) = RHS/LHS;
        [LHS,RHS] = BDF2(dt,M,B(1),C(i),[BDF2_2(i-1),BDF2_2(i-2)]);
        BDF2_2(i) = RHS/LHS;
        if(i<length(t2))
            [LHS,RHS] = AM3(dt,M,B,[C(i+1),C(i-1),C(i-2)],[AM3_2(i-1),AM3_2(i-2)]);
            AM3_2(i) = RHS/LHS;
        end
    end
    [LHS,RHS] = OST(0,dt,M,B(1:2),[C(i),C(i-1)],TH0_2(i-1));
    TH0_2(i) = RHS/LHS;
    [LHS,RHS] = OST(1,dt,M,B(1:2),[C(i),C(i-1)],TH1_2(i-1));
    TH1_2(i) = RHS/LHS;
end


%% dt = 0.4

dt = 0.4;
M = 1;
B = [-6,-6,-6];
C = (t4.^2).*exp(-5*t4);
for i = 2:length(t4)
    [LHS,RHS] = OST(0.5,dt,M,B(1:2),[C(i),C(i-1)],TH5_4(i-1));
    TH5_4(i) = RHS/LHS;
    if(i == 2)
        AB2_4(i) = TH5_4(i);
        AM3_4(i) = TH5_4(i);
        BDF2_4(i) = TH5_4(i);
    else
        [LHS,RHS] = AB2(dt,M,B(1:2),[C(i-1),C(i-2)],[AB2_4(i-1),AB2_4(i-2)]);
        AB2_4(i) = RHS/LHS;
        [LHS,RHS] = BDF2(dt,M,B(1),C(i),[BDF2_2(i-1),BDF2_4(i-2)]);
        BDF2_4(i) = RHS/LHS;
        if(i<length(t4))
            [LHS,RHS] = AM3(dt,M,B,[C(i+1),C(i-1),C(i-2)],[AM3_4(i-1),AM3_4(i-2)]);
            AM3_4(i) = RHS/LHS;
        end
    end
    [LHS,RHS] = OST(0,dt,M,B(1:2),[C(i),C(i-1)],TH0_4(i-1));
    TH0_4(i) = RHS/LHS;
    [LHS,RHS] = OST(1,dt,M,B(1:2),[C(i),C(i-1)],TH1_4(i-1));
    TH1_4(i) = RHS/LHS;
end


%% plots


figure('Name','Numerische Näherung x = 0.1');

subplot(2,2,1);
hold on; grid on;grid minor;
plot(t1, TH0_1,t1,TH1_1, t1, TH5_1, t1, AB2_1, t1, AM3_1, t1, BDF2_1,'linewidth',1.5);
plot(tex, phiex, '--','linewidth',2);
legend('Impliziter Euler', 'Expliziter Euler','Grant Nicelson','AB2', 'AM3','BDF2','exakt');
title('dt = 0.1');
axis([0 2 0 4e-3]);

subplot(2,2,2);
hold on; grid on;grid minor;
plot(t2, TH0_2,t2,TH1_2, t2, TH5_2, t2, AB2_2, t2, AM3_2, t2, BDF2_2,'linewidth',1.5);
plot(tex, phiex, '--','linewidth',2);
legend('Impliziter Euler', 'Expliziter Euler','Grant Nicelson','AB2', 'AM3','BDF2','exakt');
title('dt = 0.2');
axis([0 2 0 4e-3]);

subplot(2,2,3);
hold on; grid on;grid minor;
plot(t4, TH0_4,t4,TH1_4, t4, TH5_4, t4, AB2_4, t4, AM3_4, t4, BDF2_4,'linewidth',1.5);
plot(tex, phiex, '--','linewidth',2);
legend('Impliziter Euler', 'Expliziter Euler','Grant Nicelson','AB2', 'AM3','BDF2','exakt');
title('dt = 0.4');
axis([0 2 0 4e-3]);
