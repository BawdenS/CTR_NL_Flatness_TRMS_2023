% Controle de Trajetória para o modelo MIMO Não-Linear do Navio 
% de Superfície (Dinâmica Simplificada) a partir da planicidade diferencial
% do sistema linearizado em torno das trajetórias nominais.

% Nome: José Oniram de A. Limaverde Falho
% Data: Janeiro/2017

% Pré-Comandos
  close all; clear all; clc

% Parâmetros do Modelo
  beta = 0.07; gama = 0.58;
  
% Condições Iniciais do Sistema
  x0 = 0; y0 = 0; psi0 = pi/3; v0 = 0;                                      
  psi = 0; psip= 0; yaw = 0; yawp = 0; tau1 = 0; tau2 = 0;
% Tempo de Simulação
  t0 = 0; dt = 0.01; tfinal = 20;
  t = t0:dt:tfinal; st = size(t,2);
  
% Planejamento de Trajetória

  % Saídas do Sistema (X e Y)
  
    % Trajetória Circular
    Psid = 0*t;Psipd = 0*t;Yawd =0*t; Yawpd = 0*t;Tau1d = 0*t; Tau2d = 0*t;
      ro = 20; w = 0.05;
      Xd = ro*sin(w*t); d1Xd = ro*w*cos(w*t);  d2Xd = -ro*(w^2)*sin(w*t);
      Yd = ro*cos(w*t); d1Yd = -ro*w*sin(w*t); d2Yd = -ro*(w^2)*cos(w*t);
    
  % Posição Angular no Eixo de Guinada (Psi)
    Psid0 = atan2(d1Yd(1),d1Xd(1));
    sim('Gerando_Psid_d1Psid_simples'); Psid = Psid'; d1Psid = d1Psid';
    
  % Velocidade linear na direção de Deriva
    Vd = -d1Xd.*sin(Psid) + d1Yd.*cos(Psid); 
    
  % Controle nominal U1 e U2
    U1d =0; d1U1d = gradient(U1d)/dt; d2U1d = 4*del2(U1d)/dt^2;
    U2d =0; d1U2d = gradient(U2d)/dt; d2U2d = 4*del2(U2d)/dt^2;
    
  % Parâmetros para a construçao das Saídas Planas e de suas derivadas temporais
    coeff_FO_sysLin;  

  % Visualização das Trajetórias Nominais
    % plotNominais; break;
  
% Acompanhamento de Trajetória

  % Parâmetros do Controlador - U1 e U2
    p1 = 0.25; P1 = poly(-[p1 p1 p1]); K21 = P1(1,2); K11 = P1(1,3); K01 = P1(1,4);
    p2 = 0.25; P2 = poly(-[p2 p2 p2]); K22 = P2(1,2); K12 = P2(1,3); K02 = P1(1,4);

  % Saturação dos Atuadores
    limU1_sup = 20; limU1_inf = -20;
    limU2_sup = 20; limU2_inf = -20;
  
% Simulink
  disp('Simulink - Navio de Superfície MIMO Não-Linear (Dinâmica Simplificada)');
 
  % Executando a simulação e apresentando os resultados
    % open_system('nSimples_flatness'); 
    sim('nSimples_flatness'); plotResultados;

