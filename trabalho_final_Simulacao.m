%% substituicao numerica
trabalho_final_FO
% valores que serão substituidas
params = [I_1, I_2, a_1, b_1, a_2, b_2, M_g, B_1P, B_2P, K_gy, k1, k2, T11, T10, T21, T20, T_P, T_O, K_c,B_1Y];
values = [6.8E-2, 2E-2, 0.0135, 0.0924, 0.02, 0.09, 0.32, 6E-3, 1E-3, 0.05, 1.1, 0.8, 1.1, 1, 1, 1, 2, 3.5, -0.2,0.1];

% Substitute the parameters with their values in A
A = subs(A, params, values);



A = double(A);
B = subs(B, params, values);

B = double(B);
% dados verificados
% disp(A);
% disp(B);
% disp(C);
% disp(D);


%% Flatness begins

B1=B(:,1);
B2=B(:,2);
C_k  = [B1 A*B1 A*A*B1 B2 A*B2 A*A*B2]; % controlavel

if rank(C_k) == size(A,1)
    disp("Sistema Controlável")
end

FO = [0 0 1 0 0 0;0 0 0 0 0 1] * inv(C_k)

% trajetória
  
% Condições Iniciais do Sistema
  psi0 = 0; fi0 = 0; tau1 = 0; tau2 = 0;                                      

% Tempo de Simulação
  t0 = 0; dt = 0.1; tfinal = 1;
  t = t0:dt:tfinal; st = size(t,2);
  ro = 20; w = 0.05;
  

  Psid = ro*sin(w*t)+1;
  d1Psid = ro*w*cos(w*t);  
  d2Psid = -ro*(w^2)*sin(w*t);

  
  Fid = ro*cos(w*t);
  d1Fid = -ro*w*sin(w*t); 
  d2Fid = -ro*(w^2)*cos(w*t);
  
  tau1 = zeros(size(t));
  tau2 = zeros(size(t));
  u1_f = zeros(size(t));
  u2_f = zeros(size(t));
%   tau1 = subs(collect(eq2,x5), params, values);
%   tau2 = subs(collect(eq4,x6), params, values);
  for i = 1:size(t,2)
    eq = (27/136 - (27*d1Fid(i)*cos(Psid(i)))/2720)*x5^2 + (231/170 - (231*d1Fid(i)*cos(Psid(i)))/3400)*x5 - (3*d1Psid(i))/34 - (80*sin(Psid(i)))/17 - (d1Fid(i)^2*sin(2*Psid(i)))/68 == d2Psid(i);
    temp = solve(eq);
    tau1(i) = real(double(temp(1)));
    eq = (189*tau1(i)^2)/800 + (1617*tau1(i))/1000 + x6^2 + (9*x6)/2 - 5*d1Fid(i) == d2Fid(i);
    temp = solve(eq);
    tau2(i) = real(double(temp(1)));
    u1_f(i) = subs(solve(eq5,u1),[params,x5],[values,tau1(i)]);
    u2_f(i) = subs(solve(eq6,u2),[params,x5,x6],[values,tau1(i),tau2(i)]);
  end
FO1 = zeros(1,size(t,2));
FO2 = zeros(1,size(t,2));
FO1_p = FO(1,:);
FO2_p = FO(2,:);
  for i = 1:1:size(t,2)
    estados_i = [Psid(i); d1Psid(i);Fid(i); d1Fid(i);tau1(i);tau2(i)];
    FO1(i) = dot(FO1_p,estados_i);
    FO2(i) = dot(FO2_p,estados_i);

  end
  
  % d1FO1 e d1FO2
  d1FO1 = zeros(1,size(t,2));
  d1FO2 = zeros(1,size(t,2));
  d1FO1_p = double(subs(FO1_gLh1,params,values));
  d1FO2_p = double(subs(FO2_gLh1,params,values));
  for i = 1:1:size(t,2)
    estados_i = [Psid(i); d1Psid(i);Fid(i); d1Fid(i);tau1(i);tau2(i)];
    d1FO1(i) = dot(d1FO1_p,estados_i);
    d1FO2(i) = dot(d1FO2_p,estados_i);
  end
  
  %%
    % d2FO1 e d2FO2
  d2FO1 = zeros(1,size(t,2));
  d2FO2 = zeros(1,size(t,2));
  d2FO1_p = (subs(FO1_gLh2,params,values));
  d2FO2_p = (subs(FO2_gLh2,params,values));
  %%
  for i = 1:1:size(t,2)
%     d2FO1_p = double(subs(FO1_gLh2,[x1,x2,x3,x4,x5,x6],[Psid(i), d1Psid(i),Fid(i), d1Fid(i),tau1(i),tau2(i)]));
    estados_i = [Psid(i); d1Psid(i);Fid(i); d1Fid(i);tau1(i);tau2(i)];
    d2FO1_p = double(subs(d2FO1_p,[x1;x2;x3;x4;x5;x6],estados_i));
    d2FO2_p = double(subs(d2FO2_p,[x1;x2;x3;x4;x5;x6],estados_i));
    d2FO1(i) = dot(d2FO1_p,estados_i);
    d2FO2(i) = dot(d2FO2_p,estados_i);
  end
  
  %%
   % d3FO1 e d3FO2
  d3FO1 = zeros(1,size(t,2));
  d3FO2 = zeros(1,size(t,2));
  d3FO1_p = (subs(FO1_gLh3,params,values));
  d3FO2_p = (subs(FO2_gLh3,params,values));
  for i = 1:1:size(t,2)
    estados_i = [Psid(i); d1Psid(i);Fid(i); d1Fid(i);tau1(i);tau2(i);u1_f(i)];
    d3FO1_p = (subs(d3FO1_p,[x1;x2;x3;x4;x5;x6;u1],estados_i));
    d3FO1(i) = dot(d3FO1_p,estados_i);
    estados_i = [Psid(i); d1Psid(i);Fid(i); d1Fid(i);tau1(i);tau2(i);u1_f(i);u2_f(i)];
    d3FO2_p = (subs(d3FO2_p,[x1;x2;x3;x4;x5;x6;u1;u2],estados_i));
    d3FO2(i) = dot(d3FO2_p,estados_i);
  end
  
  
  
  
  
  
  
  
  
  
% estados sao
% [pitch pitch_1p yaw yaw_1p tau_1 tau_2]
% estados = [Psid d1Psid Fid d1Fid tau_1 tau_2]







