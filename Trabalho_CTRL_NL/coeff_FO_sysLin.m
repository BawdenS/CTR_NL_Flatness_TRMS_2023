% Par�metros para a constru�ao das Sa�das Planas e de suas derivadas temporais
% Nome: Jos� Oniram de A. Limaverde Falho
% Data: Janeiro/2017

% Sa�da Plana Incremental sF1 e suas Derivadas Temporais
    I_1=6.8E-2;
    I_2=2E-2;
    a_1=0.0135;
    b_1=0.0924;
    a_2=0.02;
    b_2=0.09;
    M_g=0.32;
    B_1P=6E-3;
    B_2P=1E-3;
    B_1Y=1E-1;
    B_2Y=1E-2;
    K_gy=0.05;
    k1=1.1;
    k2=0.8;
    T11=1.1;
    T10=1;
    T21=1;
    T20=1;
    T_P=2;
    T_O=3.5;
    K_c=-0.2;

  % sF1
    
    a1   =-(k1.^2.*k2.^3.*(K_gy.*x3d.*cos(x1d) - 1).*(b_1 + 2.*a_1.*x5d).*(b_2 + 2.*a_2.*x6d).^2)/(I_1.*I_2.^2.*T11.^2.*T21.^3)+0.*t;
    a2   = 0.*t;
    a3   = 0.*t;
    a4   = 0.*t;
    a5   = 0.*t;
    a6   = 0.*t;
    
    
  % d1sF1
    d1a1 = gradient(a1)/dt+0.*t;
    d1a2 = gradient(a2)/dt+0.*t;
    d1a3 = gradient(a3)/dt+0.*t;
    d1a4 = gradient(a4)/dt+0.*t;
    d1a5 = gradient(a5)/dt+0.*t;
    d1a6 = gradient(a6)/dt+0.*t;
    
    
    a7   = d1a1 - (a2.*(2.*B_2P.*cos(2.*x1d).*x4d.^2 - K_gy.*sin(x1d).*(a_1.*x5d.^2 + b_1.*x5d).*x4d + M_g.*cos(x1d)))/I_1+0.*t;
    a8   = a1 + d1a2 - (B_1P.*a2)/I_1+0.*t;
    a9   = d1a3+0.*t; 
    a10  = a3 + d1a4 - (B_1Y.*a4)/I_2 - (a2.*(2.*B_2P.*x4d.*sin(2.*x1d) + K_gy.*cos(x1d).*(a_1.*x5d.^2 + b_1.*x5d)))/I_1+0.*t;
    a11  =  d1a5 + (a2.*(b_1 + 2.*a_1.*x5d - K_gy.*x4d.*cos(x1d).*(b_1 + 2.*a_1.*x5d)))/I_1 - (T10.*a5)/T11 - (K_c.*T_O.*a4.*(b_1 + 2.*a_1.*x5d))/(I_2.*T_P)+0.*t;
    a12  = d1a6 + (a4.*(b_2 + 2.*a_2.*x6d))/I_2 - (T20.*a6)/T21+0.*t;
    % Feito /\
  % d2sF1
    d1a7 = gradient(a7)/dt+0.*t;
    d1a8 = gradient(a8)/dt+0.*t;
    d1a9 = gradient(a9)/dt+0.*t;
    d1a10 = gradient(a10)/dt+0.*t;
    d1a11 = gradient(a11)/dt+0.*t;
    d1a12 = gradient(a12)/dt+0.*t;
    
    
    a13   = d1a7 - (a8.*(2.*B_2P.*cos(2.*x1d).*x4d.^2 - K_gy.*sin(x1d).*(a_1.*x5d.^2 + b_1.*x5d).*x4d + M_g.*cos(x1d)))/I_1+0.*t;
    a14  = a7 + d1a8 - (B_1P.*a8)/I_1+0.*t;
    a15   = d1a9+0.*t; 
    a16  = a9 + d1a10 - (B_1Y.*a10)/I_2 - (a8.*(2.*B_2P.*x4d.*sin(2.*x1d) + K_gy.*cos(x1d).*(a_1.*x5d.^2 + b_1.*x5d)))/I_1+0.*t;
    a17  = d1a11 + (a8.*(b_1 + 2.*a_1.*x5d - K_gy.*x4d.*cos(x1d).*(b_1 + 2.*a_1.*x5d)))/I_1 - (T10.*a11)/T11 - (K_c.*T_O.*a10.*(b_1 + 2.*a_1.*x5d))/(I_2.*T_P)+0.*t;
    a18  = d1a12 + (a10.*(b_2 + 2.*a_2.*x6d))/I_2 - (T20.*a12)/T21+0.*t;
    % Feito /\
  % d3sF1
    d1a13 = gradient(a13)/dt+0.*t;
    d1a14 = gradient(a14)/dt+0.*t;
    d1a15 = gradient(a15)/dt+0.*t;
    d1a16 = gradient(a16)/dt+0.*t;
    d1a17 = gradient(a17)/dt+0.*t;
    d1a18 = gradient(a18)/dt+0.*t;
    
    
    a19   = d1a13 - (a14.*(2.*B_2P.*cos(2.*x1d).*x4d.^2 - K_gy.*sin(x1d).*(a_1.*x5d.^2 + b_1.*x5d).*x4d + M_g.*cos(x1d)))/I_1+0.*t;
    a20  = a13 + d1a14 - (B_1P.*a14)/I_1+0.*t;
    a21   = d1a15+0.*t; 
    a22  = a15 + d1a16 - (B_1Y.*a16)/I_2 - (a14.*(2.*B_2P.*x4d.*sin(2.*x1d) + K_gy.*cos(x1d).*(a_1.*x5d.^2 + b_1.*x5d)))/I_1+0.*t;
    a23  =  d1a17 + (a14.*(b_1 + 2.*a_1.*x5d - K_gy.*x4d.*cos(x1d).*(b_1 + 2.*a_1.*x5d)))/I_1 - (T10.*a17)/T11 - (K_c.*T_O.*a16.*(b_1 + 2.*a_1.*x5d))/(I_2.*T_P)+0.*t;
    a24  = d1a18 + (a16.*(b_2 + 2.*a_2.*x6d))/I_2 - (T20.*a18)/T21+0.*t;
    a25  = (a17.*k1)/T11+0.*t;
    a26  = (a17.*k1)/T11+0.*t;
    
    % d4sF1
    d1a19 = gradient(a13)/dt+0.*t;
    d1a20 = gradient(a14)/dt+0.*t;
    d1a21 = gradient(a15)/dt+0.*t;
    d1a22 = gradient(a16)/dt+0.*t;
    d1a23 = gradient(a17)/dt+0.*t;
    d1a24 = gradient(a18)/dt+0.*t;
    

    a27  = 0.*t;
    a28  = 0.*t;
    a29  = 0.*t;
    a30  = 0.*t;
    a31  = 0.*t;
    a32  = 0.*t;
  
% Sa�da Plana Incremental sF2 e suas Derivadas Temporais
  
    g1   = (-(K_c.*T_O.*k1.^3.*k2.^2.*(K_gy.*x4d.*cos(x1d) - 1).*(b_1 + 2.*a_1.*x5d).^2.*(b_2 + 2.*a_2.*x6d))/(I_1.*I_2.^2.*T11.^3.*T21.^2.*T_P))+0.*t;
    g2   =  0.*t;
    g3   = ((k1.^3.*k2.^2.*(K_gy.*x4d.*cos(x1d) - 1).^2.*(b_1 + 2.*a_1.*x5d).^2.*(b_2 + 2.*a_2.*x6d))/(I_1.^2.*I_2.*T11.^3.*T21.^2))+0.*t;
    g4   = 0.*t;
    g5   = 0.*t;
    g6   = 0.*t;
    
  % d1sF2
    d1g1 = gradient(g1)/dt+0.*t;
    d1g2 = gradient(g2)/dt+0.*t;
    d1g3 = gradient(g3)/dt+0.*t;
    d1g4 = gradient(g4)/dt+0.*t;
    d1g5 = gradient(g5)/dt+0.*t;
    d1g6 = gradient(g6)/dt+0.*t;
    
    g7   = d1g1 - (g2.*(2.*B_2P.*cos(2.*x1d).*x4d.^2 - K_gy.*sin(x1d).*(a_1.*x5d.^2 + b_1.*x5d).*x4d + M_g.*cos(x1d)))/I_1+0.*t;
    g8   = d1g2 + g1 - (B_1P.*g2)/I_1+0.*t;
    g9   = d1g3+0.*t; 
    g10  = d1g4 + g3 - (B_1Y.*g4)/I_2 - (g2.*(2.*B_2P.*x4d.*sin(2.*x1d) + K_gy.*cos(x1d).*(a_1.*x5d.^2 + b_1.*x5d)))/I_1+0.*t;
    g11  = d1g5 + (g2.*(b_1 + 2.*a_1.*x5d - K_gy.*x4d.*cos(x1d).*(b_1 + 2.*a_1.*x5d)))/I_1 - (T10.*g5)/T11 - (K_c.*T_O.*g4.*(b_1 + 2.*a_1.*x5d))/(I_2.*T_P)+0.*t;
    g12  = d1g6 + (g4.*(b_2 + 2.*a_2.*x6d))/I_2 - (T20.*g6)/T21+0.*t;
    
      % d2sF2
    d1g7 = gradient(g7)/dt+0.*t;
    d1g8 = gradient(g8)/dt+0.*t;
    d1g9 = gradient(g9)/dt+0.*t;
    d1g10 = gradient(g10)/dt+0.*t;
    d1g11 = gradient(g11)/dt+0.*t;
    d1g12 = gradient(g12)/dt+0.*t;
    
    g13   = d1g7 - (g8.*(2.*B_2P.*cos(2.*x1d).*x4d.^2 - K_gy.*sin(x1d).*(a_1.*x5d.^2 + b_1.*x5d).*x4d + M_g.*cos(x1d)))/I_1+0.*t;
    g14   = d1g8 + g7 - (B_1P.*g8)/I_1+0.*t;
    g15   = d1g9 +0.*t; 
    g16  = d1g10 + g9 - (B_1Y.*g10)/I_2 - (g8.*(2.*B_2P.*x4d.*sin(2.*x1d) + K_gy.*cos(x1d).*(a_1.*x5d.^2 + b_1.*x5d)))/I_1+0.*t;
    g17  = d1g11 + (g8.*(b_1 + 2.*a_1.*x5d - K_gy.*x4d.*cos(x1d).*(b_1 + 2.*a_1.*x5d)))/I_1 - (T10.*g11)/T11 - (K_c.*T_O.*g10.*(b_1 + 2.*a_1.*x5d))/(I_2.*T_P)+0.*t;
    g18  = d1g12 + (g10.*(b_2 + 2.*a_2.*x6d))/I_2 - (T20.*g12)/T21+0.*t;
    
  % d3sF2
    d1g13 = gradient(g13)/dt+0.*t;
    d1g14 = gradient(g14)/dt+0.*t;
    d1g15 = gradient(g15)/dt+0.*t;
    d1g16 = gradient(g16)/dt+0.*t;
    d1g17 = gradient(g17)/dt+0.*t;
    d1g18 = gradient(g18)/dt+0.*t;
    
    g19   = d1g13 - (g14.*(2.*B_2P.*cos(2.*x1d).*x4d.^2 - K_gy.*sin(x1d).*(a_1.*x5d.^2 + b_1.*x5d).*x4d + M_g.*cos(x1d)))/I_1+0.*t;
    g20  = d1g14 + g13 - (B_1P.*g14)/I_1+0.*t;
    g21   = d1g15+0..*t; 
    g22  = d1g16 + g15 - (B_1Y.*g16)/I_2 - (g14.*(2.*B_2P.*x4d.*sin(2.*x1d) + K_gy.*cos(x1d).*(a_1.*x5d.^2 + b_1.*x5d)))/I_1+0.*t;
    g23  = d1g17 + (g14.*(b_1 + 2.*a_1.*x5d - K_gy.*x4d.*cos(x1d).*(b_1 + 2.*a_1.*x5d)))/I_1 - (T10.*g17)/T11 - (K_c.*T_O.*g16.*(b_1 + 2.*a_1.*x5d))/(I_2.*T_P)+0.*t;
    g24  = d1g18 + (g16.*(b_2 + 2.*a_2.*x6d))/I_2 - (T20.*g18)/T21+0.*t;
    g25 = (g17.*k1)/T11+0.*t;
    g26 = (g18.*k2)/T21+0.*t;
    % d4sF2
    d1g19 = gradient(g13)/dt+0.*t;
    d1g20 = gradient(g14)/dt+0.*t;
    d1g21 = gradient(g15)/dt+0.*t;
    d1g22 = gradient(g16)/dt+0.*t;
    d1g23 = gradient(g17)/dt+0.*t;
    d1g24 = gradient(g18)/dt+0.*t;
    
    g27  = 0.*t;
    g28  = 0.*t; 
    g29  = 0.*t;
    g30  = 0.*t; 
    g31  = 0.*t;
    g32  = 0.*t;