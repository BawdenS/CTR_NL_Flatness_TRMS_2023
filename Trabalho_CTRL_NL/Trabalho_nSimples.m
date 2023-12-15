% Controle de Trajetória para o modelo MIMO Não-Linear do Navio 
% de Superfície (Dinâmica Simplificada) a partir da planicidade diferencial
% do sistema linearizado em torno das trajetórias nominais.

% Nome: José Oniram de A. Limaverde Falho
% Data: Janeiro/2017

% Pré-Comandos
  close all; clear all; clc

%   180 - pi
%   10  - X
% Condições Iniciais do Sistema                                   
  psi0 = 0*pi/180; psip0= 0; yaw0 = 0; yawp = 0; tau10 = 0; tau20 = 0;
  
% Tempo de Simulação
  t0 = 0; dt = 0.01;    tfinal= 20;
  t = t0:dt:tfinal; st = size(t,2);
  
% Planejamento de Trajetória

  % Saídas do Sistema (X e Y)
  psi=0;psip=0;yaw=0;
    % Trajetória Circular
    Psid = 0*t; Psipd = 0*t; Yawd =0*t; Yawpd = 0*t;Tau1d = 0*t; Tau2d = 0*t;
    x1d = Psid; x2d = Psipd; x3d = Yawd; x4d = Yawpd; x5d = Tau1d; x6d = Tau2d;
    
  % Controle nominal U1 e U2
    U1d =0*t; d1U1d = gradient(U1d)/dt; d2U1d = 4*del2(U1d)/dt^2;
    U2d =0*t; d1U2d = gradient(U2d)/dt; d2U2d = 4*del2(U2d)/dt^2;
    
  % Parâmetros para a construçao das Saídas Planas e de suas derivadas temporais
    coeff_FO_sysLin;  

  % Visualização das Trajetórias Nominais
    % plotNominais; break;
  
% Acompanhamento de Trajetória

  % Parâmetros do Controlador - U1 e U2
    p1 = 0.5; P1 = poly(-[p1 p1 p1]);  K21 = P1(1,2); K11 = P1(1,3); K01 = P1(1,4);
    p2 = 0.5; P2 = poly(-[p2 p2 p2]);  K22 = P2(1,2); K12 = P2(1,3); K02 = P1(1,4);

  % Saturação dos Atuadores
    limU1_sup = 255; limU1_inf = -255;
    limU2_sup = 255; limU2_inf = -255;
  
% Simulink
  disp('Simulink - Navio de Superfície MIMO Não-Linear (Dinâmica Simplificada)');
 
  % Executando a simulação e apresentando os resultados
    open_system('nSimples_flatness'); 
    sim('nSimples_flatness');
%     open_system('teste_ignore_simulink');
%     sim('teste_ignore_simulink'); 
%     plotResultados;

