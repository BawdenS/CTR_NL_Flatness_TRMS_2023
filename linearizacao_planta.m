clear
clc
syms pitch pitch_1p pitch_2p yaw yaw_1p yaw_2p tau_1 tau_2
syms I_1 tau_1 a_1 b_1
syms M_g K_gy
syms B_1P B_2P

M_1 = a_1 * (tau_1^2) + b_1 * tau_1;

M_FG = M_g * sin(pitch);

M_BP = B_1P*pitch_1p + B_2P*sin(2*pitch)*(yaw_1p^2);
% M_BP = B_1P*pitch_1p + B_2P*sin(2*pitch)*(yaw^2);
M_G = K_gy*M_1*yaw_1p*cos(pitch);

pitch_2p = (M_1 - M_FG - M_BP - M_G)/I_1;  % eq 1

syms I_2 tau_2 a_2 b_2
syms B_1Y B_2P  K_c
syms T_O T_P

M_2 = a_2 * (tau_2^2) + b_2 * tau_2;

M_BY = B_1Y*yaw_1p;

% M_R = K_c * (T_O * s+1)/(T_P * s+1)*M_1; s-> 0
M_R =(T_O/T_P)* K_c*M_1;

yaw_2p = (M_2  - M_BY - M_R)/I_2; % eq 2

syms T10 T11 k1 u1
tau_1P = - T10/T11* tau_1 + k1/T11* u1; % eq 3

syms T20 T21 k2 u2
tau_2P = - T20/T21* tau_2 + k2/T21* u2; % eq 4

% estados sao
% [pitch pitch_1p yaw yaw_1p tau_1 tau_2]

%%
syms x1 x2 x3 x4 x5 x6

eq1 = x2;
eq2 = subs(pitch_2p,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1 x2 x3 x4 x5 x6]);
eq3 = x4;
eq4 = subs(yaw_2p,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1 x2 x3 x4 x5 x6]);
eq5 = subs(tau_1P,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1 x2 x3 x4 x5 x6]);
eq6 = subs(tau_2P,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1 x2 x3 x4 x5 x6]);






system = [eq1;eq2;eq3;eq4;eq5;eq6];
    v =[x1 x2 x3 x4 x5 x6];

% 
% 
J = jacobian(system,v);
A = subs(jacobian(system,v),[x1 x2 x3 x4 x5 x6],[0 0 0 0 0 0]);
%     teste = collect(J,[t])
%     
system = [eq1;eq2;eq3;eq4;eq5;eq6];
    v =[u1 u2];

% 
% 
J = jacobian(system,v);
B = subs(jacobian(system,v),[x1 x2 x3 x4 x5 x6],[0 0 0 0 0 0]);
    

C = [1 0 0 0 0 0; 0 0 1 0 0 0];

D = 0;
    
    
    
    
    
    
    
    
    
    
    
    