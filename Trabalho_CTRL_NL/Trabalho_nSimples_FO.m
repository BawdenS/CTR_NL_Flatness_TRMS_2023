% Aula 05 - Saidas Planas
% Navio de Superf�cie (Din�mica Simplificada)
% Data: Janeiro/2017
% Nome: Jos� Oniram Limaverde

% Pr�-Comandos
clear all; close all; clc

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
syms x1d x2d x3d x4d x5d x6d
syms sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2
eq1 = x2d;
eq2 = subs(pitch_2p,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1d x2d x3d x4d x5d x6d]);
eq3 = x4d;
eq4 = subs(yaw_2p,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1d x2d x3d x4d x5d x6d]);
eq5 = subs(tau_1P,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1d x2d x3d x4d x5d x6d]);
eq6 = subs(tau_2P,[pitch pitch_1p yaw yaw_1p tau_1 tau_2],[x1d x2d x3d x4d x5d x6d]);






system = [eq1;eq2;eq3;eq4;eq5;eq6];

nlSys_jacobian = jacobian(system, [x1d x2d x3d x4d x5d x6d u1 u2]);  
  
A = nlSys_jacobian(1:6,1:6);
B = nlSys_jacobian(1:6,7:8);
 

 % Sistema Linearizado

linSys = nlSys_jacobian*[sX1; sX2; sX3; sX4; sX5; sX6; sU1; sU2];
 

% Vari�veis Simb�licas
  syms Xd Yd Psid Vd U1d U2d
  syms d1Xd d2Xd d1Yd d2Yd d1Psid d1Vd d1U1d d1U2d d2U1d d2U2d
  syms beta gama
  syms sX sY sPsi sV sU1 sU2
  syms sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2
  syms a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18
  syms a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32
  syms d1a1 d1a2 d1a3 d1a4 d1a5 d1a6 d1a7 d1a8 d1a9 d1a10 d1a11 d1a12
  syms d1a13 d1a14 d1a15 d1a16 d1a17 d1a18 d1a19 d1a20 d1a21 d1a22 d1a23 d1a24 d1a25 d1a26
  syms d1a27 d1a28 d1a29 d1a30 d1a31 d1a32
  
  syms g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12 g13 g14 g15 g16 g17 g18
  syms g19 g20 g21 g22 g23 g24 g25 g26 g27 g28 g29 g30 g31 g32
  syms d1g1 d1g2 d1g3 d1g4 d1g5 d1g6 d1g7 d1g8 d1g9 d1g10 d1g11 d1g12
  syms d1g13 d1g14 d1g15 d1g16 d1g17 d1g18 d1g19 d1g20 d1g21 d1g22 d1g23 d1g24 d1g25 d1g26
  syms d1g27 d1g28 d1g29 d1g30 d1g31 d1g32
  

       
  % Derivadas da Matriz B 
    d1B = B*0;
    %d2B = [(-cos(Psid)*U2d^2 - d1U2d*sin(Psid)) 0; (-sin(Psid)*U2d^2 + d1U2d*cos(Psid)) 0; 0 0; -gama*d2U2d -gama*d2U1d];
    %d3B = []; d3b1 = d3B(1:4,1); d3b2 = d3B(1:4,2);
   
 % Matriz de Controlabilidade C(t) assumindo os Indices de Controlabilidade: G1 = 2 e G2 = 2
 c1k1 = B(:,1);
 c1k2 = A*B(:,1);
 c1k3 = A*A*B(:,1);
 c2k1 = B(:,2);
 c2k2 = A*B(:,2);
 c2k3 = A*A*B(:,2);
 
 
 
 C = [c1k1 c1k2 c1k3 c2k1 c2k2 c2k3];
 
 % Sa�das Planas Incrementais
   Fi = [0 0 1 0 0 0; 0 0 0 0 0 1];
   c_sF = simplify(det(C)*Fi*(C^-1));
   sF = collect(c_sF*[sX1; sX2 ;sX3 ;sX4; sX5; sX6],[sX1; sX2 ;sX3 ;sX4; sX5; sX6]);
   sF1 = sF(1,:); sF2 = sF(2,:); % break

 % Coeficientes das Sa�das Planas Incrementais
   % A1 = -gama*(U2d*d1Xd + d1U1d*sin(Psid) + beta*U1d*sin(Psid) - gama*U1d*U2d*cos(Psid));
   % A2 =  gama*(d1U1d*cos(Psid) - U2d*d1Yd + beta*U1d*cos(Psid) + gama*U1d*U2d.*sin(Psid));
   % A3 = -gama*U1d*(d1Xd*cos(Psid) - U1d*gama + d1Yd*sin(Psid));
   % A4 =  gama*U1d - d1Xd*cos(Psid) - d1Yd*sin(Psid);
   
   % G1 =  gama*(d1U2d*sin(Psid) - (U2d^2)*cos(Psid) - gama*(U2d^2)*cos(Psid) + beta*U2d*sin(Psid));
   % G2 = -gama*(d1U2d*cos(Psid) + (U2d^2)*sin(Psid) + gama*(U2d^2)*sin(Psid) + beta*U2d*cos(Psid));
   % G3 = -U1d.*U2d*gama*(gama + 1);
   % G4 = -U2d*(gama + 1);
   
 % Obtendo as derivadas temporais das Sa�das Plana Incrementais
   
   SF1 = [a1 a2 a3 a4 a5 a6]*[sX1; sX2; sX3; sX4; sX5; sX6]; 
   d1SF1 = [a7 a8 a9 a10 a11 a12]*[sX1; sX2; sX3; sX4; sX5; sX6];
   d2SF1 = [a13 a14 a15 a16 a17 a18]*[sX1; sX2; sX3; sX4; sX5; sX6];
   d3SF1 = [a19 a20 a21 a22 a23 a24 a25 a26]*[sX1; sX2; sX3; sX4; sX5; sX6;sU1 ;sU2];
%    d4SF1 = [a25 a26 a27 a28 a29 a30 a31 a32]*[sX1; sX2; sX3; sX4; sX5; sX6 ;sU1 ;sU2];
   
   SF2 = [g1 g2 g3 g4 g5 g6]*[sX1; sX2; sX3; sX4; sX5; sX6]; 
   d1SF2 = [g7 g8 g9 g10 g11 g12]*[sX1; sX2; sX3; sX4; sX5; sX6];
   d2SF2 = [g13 g14 g15 g16 g17 g18]*[sX1; sX2; sX3; sX4; sX5; sX6];
   d3SF2 = [g19 g20 g21 g22 g23 g24 g25 g26]*[sX1; sX2; sX3; sX4; sX5; sX6;sU1 ;sU2];
%    d4SF2 = [g25 g26 g27 g28 g29 g30 g31 g32]*[sX1; sX2; sX3; sX4; sX5; sX6;sU1 ;sU2];
   
   
   % Primeira Derivadas
     SF1_gLh0 = gradient(SF1,[sX1 sX2 sX3 sX4 sX5 sX6 a1 a2 a3 a4 a5 a6]); SF1_gLh0 = transpose(SF1_gLh0);                
     d1sF1    = collect(simplify(SF1_gLh0*[linSys; d1a1; d1a2; d1a3; d1a4; d1a5; d1a6]),[sX1 sX2 sX3 sX4 sX5 sX6]); c_d1sF1 = gradient(d1sF1,[sX1 sX2 sX3 sX4 sX5 sX6]);
    
     SF2_gLh0 = gradient(SF2,[sX1 sX2 sX3 sX4 sX5 sX6 g1 g2 g3 g4 g5 g6]); SF2_gLh0 = transpose(SF2_gLh0);                
     d1sF2    = collect(simplify(SF2_gLh0*[linSys; d1g1; d1g2; d1g3; d1g4; d1g5; d1g6]),[sX1 sX2 sX3 sX4 sX5 sX6]); c_d1sF2 = gradient(d1sF2,[sX1 sX2 sX3 sX4 sX5 sX6]); 

   % Segunda Derivada
     SF1_gLh1 = gradient(d1SF1,[sX1 sX2 sX3 sX4 sX5 sX6 a7 a8 a9 a10 a11 a12]); SF1_gLh1 = transpose(SF1_gLh1);                
     d2sF1    = collect(simplify(SF1_gLh1*[linSys; d1a7; d1a8; d1a9; d1a10; d1a11; d1a12]),[sX1 sX2 sX3 sX4 sX5 sX6]); c_d2sF1 = gradient(d2sF1,[sX1 sX2 sX3 sX4 sX5 sX6]);
     
     SF2_gLh1 = gradient(d1SF2,[sX1 sX2 sX3 sX4 sX5 sX6 g7 g8 g9 g10 g11 g12]); SF2_gLh1 = transpose(SF2_gLh1);                
     d2sF2    = collect(simplify(SF2_gLh1*[linSys; d1g7; d1g8; d1g9; d1g10; d1g11; d1g12]),[sX1 sX2 sX3 sX4 sX5 sX6]); c_d2sF2 = gradient(d2sF2,[sX1 sX2 sX3 sX4 sX5 sX6]);
      
   % Terceira Derivadas
     SF1_gLh2 = gradient(d2SF1,[sX1 sX2 sX3 sX4 sX5 sX6 a13 a14 a15 a16 a17 a18]); SF1_gLh2 = transpose(SF1_gLh2);                
     d3sF1    = collect(simplify(SF1_gLh2*[linSys; d1a13; d1a14; d1a15; d1a16; d1a17; d1a18]),[sX1 sX2 sX3 sX4 sX5 sX6]); c_d3sF1 = gradient(d3sF1,[sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2]);
    
     SF2_gLh2 = gradient(d2SF2,[sX1 sX2 sX3 sX4 sX5 sX6 g13 g14 g15 g16 g17 g18]); SF2_gLh2 = transpose(SF2_gLh2);                
     d3sF2    = collect(simplify(SF2_gLh2*[linSys; d1g13; d1g14; d1g15; d1g16; d1g17; d1g18]),[sX1 sX2 sX3 sX4 sX5 sX6]); c_d3sF2 = gradient(d3sF2,[sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2]); 

%    % Quarta Derivada
%      SF1_gLh3 = gradient(d3sF1,[sX1 sX2 sX3 sX4 sX5 sX6 a19 a20 a21 a22 a23 a24]); SF1_gLh3 = transpose(SF1_gLh3);                
%      d4sF1    = collect(simplify(SF1_gLh3*[linSys; d1a19; d1a20; d1a21; d1a22; d1a23; d1a24]),[sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2]); c_d4sF1 = gradient(d4sF1,[sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2]);
%      
%      SF2_gLh3 = gradient(d3sF2,[sX1 sX2 sX3 sX4 sX5 sX6 g19 g20 g21 g22 g23 g24]); SF2_gLh3 = transpose(SF2_gLh3);                
%      d4sF2    = collect(simplify(SF2_gLh3*[linSys; d1g19; d1g20; d1g21; d1g22; d1g23; d1g24]),[sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2]); c_d4sF2 = gradient(d4sF2,[sX1 sX2 sX3 sX4 sX5 sX6 sU1 sU2]);
%      
     
     
     
     
     
 % Matriz M que relaciona as sa�das planas incrementais e suas derivadas temporais com as vari�veis incrementais do sistema linearizado
    % M = [a1  a2  a3  a4  a5  a6   0    0;
    %      a7  a8  a9  a10 a11 a12  0    0;
    %      a13 a14 a15 a16 a17 a18  0    0;
    %      a19 a20 a21 a22 a23 a24  a25  a26;
   
    %      g1  g2  g3  g4  g5  g6  0    0;
    %      g7  g8  g9  g10 g11 g12 0    0;
    %      g13 g14 g15 g16 g17 g18  0    0;
    %      g19 g20 g21 g22 g23 g24  g25  g26];
