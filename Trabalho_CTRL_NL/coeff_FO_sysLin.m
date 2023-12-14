% Par�metros para a constru�ao das Sa�das Planas e de suas derivadas temporais
% Nome: Jos� Oniram de A. Limaverde Falho
% Data: Janeiro/2017

% Sa�da Plana Incremental sF1 e suas Derivadas Temporais
  
  % sF1
    a1   = -gama*(U2d.*d1Xd + d1U1d.*sin(Psid) + beta*U1d.*sin(Psid) - gama*U1d.*U2d.*cos(Psid));
    a2   =  gama*(d1U1d.*cos(Psid) - U2d.*d1Yd + beta*U1d.*cos(Psid) + gama*U1d.*U2d.*sin(Psid));
    a3   = -gama*U1d.*(d1Xd.*cos(Psid) - U1d*gama + d1Yd.*sin(Psid));
    a4   =  gama*U1d - d1Xd.*cos(Psid) - d1Yd.*sin(Psid);
    a5   = 0;
    a6   = 0;
    
    a1   = -gama*(U2d.*d1Xd + d1U1d.*sin(Psid) + beta*U1d.*sin(Psid) - gama*U1d.*U2d.*cos(Psid));
    a2   =  gama*(d1U1d.*cos(Psid) - U2d.*d1Yd + beta*U1d.*cos(Psid) + gama*U1d.*U2d.*sin(Psid));
    a3   = -gama*U1d.*(d1Xd.*cos(Psid) - U1d*gama + d1Yd.*sin(Psid));
    a4   =  gama*U1d - d1Xd.*cos(Psid) - d1Yd.*sin(Psid);
    a5   = 0;
    a6   = 0;
    
    
  % d1sF1
    d1a1 = gradient(a1)/dt;
    d1a2 = gradient(a2)/dt;
    d1a3 = gradient(a3)/dt;
    d1a4 = gradient(a4)/dt;
    d1a5 = gradient(a5)/dt;
    d1a6 = gradient(a6)/dt;
    
    
    a7   = d1a3 + a2.*d1Xd - a1.*d1Yd;
    a8   = d1a4 - a4*beta + a2.*cos(Psid) - a1.*sin(Psid);
    a9   = d1a5; 
    a10  = d1a6;
    a11  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    a12  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
    
  % d2sF1
    d1a7 = gradient(a7)/dt;
    d1a8 = gradient(a8)/dt;
    d1a9 = gradient(a9)/dt;
    d1a10 = gradient(a10)/dt;
    d1a11 = gradient(a11)/dt;
    d1a12 = gradient(a12)/dt;
    
    
    a13   = d1a3 + a2.*d1Xd - a1.*d1Yd;
    a14  = d1a4 - a4*beta + a2.*cos(Psid) - a1.*sin(Psid);
    a15   = d1a5; 
    a16  = d1a6;
    a17  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    a18  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);

  % d3sF1
    d1a13 = gradient(a13)/dt;
    d1a14 = gradient(a14)/dt;
    d1a15 = gradient(a15)/dt;
    d1a16 = gradient(a16)/dt;
    d1a17 = gradient(a17)/dt;
    d1a18 = gradient(a18)/dt;
    
    
    a19   = d1a3 + a2.*d1Xd - a1.*d1Yd;
    a20  = d1a4 - a4*beta + a2.*cos(Psid) - a1.*sin(Psid);
    a21   = d1a5; 
    a22  = d1a6;
    a23  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    a24  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
    
    % d4sF1
    d1a19 = gradient(a13)/dt;
    d1a20 = gradient(a14)/dt;
    d1a21 = gradient(a15)/dt;
    d1a22 = gradient(a16)/dt;
    d1a23 = gradient(a17)/dt;
    d1a24 = gradient(a18)/dt;
    
    a25  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    a26  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
    a27  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    a28  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
    a29  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    a30  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
    a31  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    a32  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
  
% Sa�da Plana Incremental sF2 e suas Derivadas Temporais
  
    g1   = -gama*(U2d.*d1Xd + d1U1d.*sin(Psid) + beta*U1d.*sin(Psid) - gama*U1d.*U2d.*cos(Psid));
    g2   =  gama*(d1U1d.*cos(Psid) - U2d.*d1Yd + beta*U1d.*cos(Psid) + gama*U1d.*U2d.*sin(Psid));
    g3   = -gama*U1d.*(d1Xd.*cos(Psid) - U1d*gama + d1Yd.*sin(Psid));
    g4   =  gama*U1d - d1Xd.*cos(Psid) - d1Yd.*sin(Psid);
    g5   = 0;
    g6   = 0;
    
  % d1sF2
    d1g1 = gradient(g1)/dt;
    d1g2 = gradient(g2)/dt;
    d1g3 = gradient(g3)/dt;
    d1g4 = gradient(g4)/dt;
    d1g5 = gradient(g5)/dt;
    d1g6 = gradient(g6)/dt;
    
    g7   = d1a3 + a2.*d1Xd - a1.*d1Yd;
    g8   = d1a4 - a4*beta + a2.*cos(Psid) - a1.*sin(Psid);
    g9   = d1a5; 
    g10  = d1a6;
    g11  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    g12  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
    
      % d2sF2
    d1g7 = gradient(g7)/dt;
    d1g8 = gradient(g8)/dt;
    d1g9 = gradient(g9)/dt;
    d1g10 = gradient(g10)/dt;
    d1g11 = gradient(g11)/dt;
    d1g12 = gradient(g12)/dt;
    
    g13   = d1a3 + a2.*d1Xd - a1.*d1Yd;
    g14   = d1a4 - a4*beta + a2.*cos(Psid) - a1.*sin(Psid);
    g15   = d1a5; 
    g16  = d1a6;
    g17  = d1a7 + a6.*d1Xd - a5.*d1Yd;
    g18  = d1a8 - a8.*beta + a6.*cos(Psid) - a5.*sin(Psid);
    
  % d3sF2
    d1g13 = grgdient(g13)/dt;
    d1g14 = grgdient(g14)/dt;
    d1g15 = grgdient(g15)/dt;
    d1g16 = grgdient(g16)/dt;
    d1g17 = grgdient(g17)/dt;
    d1g18 = grgdient(g18)/dt;
    
    g19   = d1g3 + g2.*d1Xd - g1.*d1Yd;
    g20  = d1g4 - g4*betg + g2.*cos(Psid) - g1.*sin(Psid);
    g21   = d1g5; 
    g22  = d1g6;
    g23  = d1g7 + g6.*d1Xd - g5.*d1Yd;
    g24  = d1g8 - g8.*betg + g6.*cos(Psid) - g5.*sin(Psid);
    
    % d4sF2
    d1g19 = grgdient(g13)/dt;
    d1g20 = grgdient(g14)/dt;
    d1g21 = grgdient(g15)/dt;
    d1g22 = grgdient(g16)/dt;
    d1g23 = grgdient(g17)/dt;
    d1g24 = grgdient(g18)/dt;
    
    g25  = d1g7 + g6.*d1Xd - g5.*d1Yd;
    g26  = d1g8 - g8.*betg + g6.*cos(Psid) - g5.*sin(Psid);
    g27  = d1g7 + g6.*d1Xd - g5.*d1Yd;
    g28  = d1g8 - g8.*betg + g6.*cos(Psid) - g5.*sin(Psid);
    g29  = d1g7 + g6.*d1Xd - g5.*d1Yd;
    g30  = d1g8 - g8.*betg + g6.*cos(Psid) - g5.*sin(Psid);
    g31  = d1g7 + g6.*d1Xd - g5.*d1Yd;
    g32  = d1g8 - g8.*betg + g6.*cos(Psid) - g5.*sin(Psid);