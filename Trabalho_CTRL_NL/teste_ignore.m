psi=0; psip=0; yaw=0; yawp=0; tau1=0; tau2=0;K01=1; K11=1; K02=1; K12=1; psid=0; psipd=0; yawd=0; yawpd=0; tau1d=0; tau2d=0; U1d=0; U2d=0; cF1=[1,1,1,1,1,1]; cd1F1=[1,1,1,1,1,1]; cd2F1=[1,1,1,1,1,1];cd3F1=[1,1,1,1,1,1,1,1]; cd4F1=[1,1,1,1,1,1,1,1]; 
cF2=[1,1,1,1,1,1]; cd1F2=[1,1,1,1,1,1]; cd2F2=[1,1,1,1,1,1];cd3F2=[1,1,1,1,1,1,1,1]; cd4F2=[1,1,1,1,1,1,1,1]; limU1_sup=20; limU2_sup=20; limU1_inf=-20; limU2_inf=-20; K21=1; K22=1;
  % Inicialização
 
    cF1 = cF1; cd1F1 = cd1F1; cd2F1 = cd2F1;
    cF2 = cF2; cd1F2 = cd1F2; cd2F2 = cd2F2; 
%     porta3 = 0;porta4 = 0;porta5 = 0;porta6 = 0;
%     porta7 = 0;porta8 = 0;
  % Etapa 01 - Variáveis Incrementais (Erro de Trajetória)
    sPsi = psi - psid; sPsip = psip - psipd; sYaw= yaw - yawd; sYawp = yawp - yawpd;
    sTau1 = tau1 - tau1d; sTau2 = tau2 - tau2d;
  % Etapa 02 - Construção da Saída Plana e suas Derivadas Temporais
    sF1   =   cF1*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
    d1sF1 = cd1F1*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
    d2sF1 = cd2F1*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
%     d3sF1 = cd3F1*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
%     d4sF1 = cd4F1*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
    
    sF2   =   cF1*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
    d1sF2 = cd1F2*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
    d2sF2 = cd2F2*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
%     d3sF2 = cd3F2*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
%     d4sF2 = cd4F2*[sPsi; sPsip; sYaw; sYawp;sTau1;sTau2];
   
  % Etapa 03 - Termos de Correção em Malha Fechada
    tC1 = - K21*d2sF1 - K11*d1sF1 - K01*sF1; 
    tC2 = - K22*d2sF2 - K12*d1sF2 - K02*sF2;
    
  % Etapa 04 - Gerando a Expressão Final para os Controladores
    
    % Calculando os Coeficientes de sU1 e sU2
      M  = [  cF1(1,1) cF1(1,2) cF1(1,3) cF1(1,4) cF1(1,5) cF1(1,6) 0 0; 
              cd1F1(1,1) cd1F1(1,2) cd1F1(1,3) cd1F1(1,4) cd1F1(1,5) cd1F1(1,6) 0 0;
              cd2F1(1,1) cd2F1(1,2) cd2F1(1,3) cd2F1(1,4) cd2F1(1,5) cd2F1(1,6) 0 0;
              cd3F1(1,1) cd3F1(1,2) cd3F1(1,3) cd3F1(1,4) cd3F1(1,5) cd3F1(1,6) cd3F1(1,7) cd3F1(1,8);
              
              cF2(1,1) cF2(1,2) cF2(1,3) cF2(1,4) cF2(1,5) cF2(1,6) 0 0; 
              cd1F2(1,1) cd1F2(1,2) cd1F2(1,3) cd1F2(1,4) cd1F2(1,5) cd1F2(1,6) 0 0;
              cd2F2(1,1) cd2F2(1,2) cd2F2(1,3) cd2F2(1,4) cd2F2(1,5) cd2F2(1,6) 0 0;
              cd3F2(1,1) cd3F2(1,2) cd3F2(1,3) cd3F2(1,4) cd3F2(1,5) cd3F2(1,6) cd3F2(1,7) cd3F2(1,8);];
      
       iM = pinv(M);
      cU1 = iM(4,:);
      cU2 = iM(8,:);
    
    % Expressão dos Sinais de Controle Incrementais
      sU1 = cU1*[sF1; d1sF1; d2sF2; tC1; sF2; d1sF2; d2sF2;  tC2];
      sU2 = cU2*[sF1; d1sF1; d2sF2; tC1; sF2; d1sF2; d2sF2;  tC2];
  
    % Expressão Final do Sinais de Controle "U1" e "U2"
      U1 = sU1 + U1d
      U2 = sU2 + U2d
      
    % Saturação dos Atuadores
      U1 = min(limU1_sup, max(limU1_inf, U1));
      U2 = min(limU2_sup, max(limU2_inf, U2));