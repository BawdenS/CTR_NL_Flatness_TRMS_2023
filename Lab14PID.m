
%% Laboratório 14 -Controle Descentralizado e Desacoplado aplicado ao TRMS

%% Linearização do TRMS
clc
clear
s=tf('s');

%% Parametros do TRMS
I1=6.8E-2;
I2=2E-2;
a1=0.0135;
b1=0.0924;
a2=0.02;
b2=0.09;
Mg=0.32;
B1psi=6E-3;
B2psi=1E-3;
B1fi=1E-1;
B2fi=1E-2;
Kgy=0.05;
k1=1.1;
k2=0.8;
T11=1.1;
T10=1;
T21=1;
T20=1;
Tp=2;
T0=3.5;
kc=-0.2;

%% Encontrando as Matrizes de estado


A=[0 1 0 0 0 0; -Mg/I1 -B1psi/I1 0 0 b1/I1 0; 0 0 0 1 0 0; 0 0 0 -B1fi/I2 -kc*1.75*b1/I2 b2/I2; 0 0 0 0 -T10/T11 0; 0 0 0 0 0 -T20/T21];

B=[0 0; 0 0; 0 0; 0 0; k1/T11 0; 0 k2/T21];

C=[1 0 0 0 0 0; 0 0 1 0 0 0];

D=[ 0 0; 0 0];

D6=[0 0;0 0;0 0;0 0;0 0;0 0];

Sys=ss(A,B,C,D);

Sysr=sminreal(Sys);

%% Encontrando a Matriz de transferência

G=C*inv(s*eye(6)-A)*B+D;  % Esta equação apresentou um modelo mais apurado que usando a função ss

G11=G(1,1);
G12=G(1,2);
G21=G(2,1);
G22=G(2,2);

% sys=ss(A,B,C,D);
% G2=tf(sys);

%% Calculando o RGA

Gd=dcgain(G);
RGA=Gd.*inv(Gd');

%% Calculando o svd e o condition number
svd(Gd);
Gama=cond(Gd);

%% Projeto com C1(S)

C1=2*(s^2+0.1*s+5)/(s*(s+5));
% sisotool(G11,C1)


%% Projeto com C2(S)

% C2=75*(s+0.5)*(s+0.25)/(s*(s+20));
C2=75*(s^2+0.75*s+0.125)/(s*(s+20));
% sisotool(G22,C2)

%% Discrete Transfer Matriz
Ts=0.1;
z=tf('z');
Gz=c2d(G,Ts);
% step(G(1,1),Gz(1,1))

%% Projeto com C1(z)

z=tf('z',Ts)
% C1z=18*(z-0.9)*(z^2-1.94*z+0.986)/((z-1)*(z-0.2)^2);
C1z=1.6*(z^2-1.95*z+0.99)/((z-1)*z)
% sisotool(Gz(1,1),C1z)


%% Projeto com C2(z)

C2z=80*(z-0.9)^2*(z-0.98)/((z-1)*(z-0.4)^2);
% sisotool(Gz(2,2),C2z)
simulacao = "Lab14ContDisc_2018a1";
out = sim(simulacao);
