

linearizacao_planta
% saida plana 
syms fo1 d1fo1 d2fo1 d3fo1 fo2 d1fo2 d2fo2 d3fo2
B1=B(:,1);
B2=B(:,2);
C_k  = [B1 A*B1 A*A*B1 B2 A*B2 A*A*B2]; % controlavel
FO = [0 0 1 0 0 0;0 0 0 0 0 1] * inv(C_k) * [x1; x2; x3; x4; x5; x6];
 
[c,d] = numden(FO(1));
alpha_1 = d;

[c,d] = numden(FO(2));
alpha_2 = d;
FO1 = simplify(alpha_1*FO(1))

FO2 = simplify(alpha_2*FO(2))



%% Obtendo as derivadas temporais da saida plana FO1

  % Primeira Derivada
    FO1_gLh0 = gradient(FO1,[x1 x2 x3 x4 x5 x6]); FO1_gLh0 = transpose(FO1_gLh0);     % Gradiente da Derivada de Lie de ordem Zero
    d1FO1  = collect(simplify(FO1_gLh0*system),[x1 x2 x3 x4 x5 x6]);
    
  % Segunda Derivada
    FO1_gLh1 = gradient(d1FO1,[x1 x2 x3 x4 x5 x6]); FO1_gLh1 = transpose(FO1_gLh1);   % Gradiente da Derivada de Lie de primeira ordem
    d2FO1  = collect(simplify(FO1_gLh1*system),[x1 x2 x3 x4 x5 x6]);
    %
  % Terceira Derivada
    FO1_gLh2 = gradient(d2FO1,[x1 x2 x3 x4 x5 x6]); FO1_gLh2 = transpose(FO1_gLh2);   % Gradiente da Derivada de Lie de segunda ordem
    d3FO1  = collect(simplify(FO1_gLh2*system),[x1 x2 x3 x4 x5 x6 u1]);
    
  % Coeficientes da Terceira Derivada
    FO1_gLh3 = gradient(d3FO1,[x1 x2 x3 x4 x5 x6 u1]); FO1_gLh3 = transpose(FO1_gLh3);   % Gradiente da Derivada de Lie de terceira ordem
    

%% Obtendo as derivadas temporais da saida plana FO2

  % Primeira Derivada
    FO2_gLh0 = gradient(FO2,[x1 x2 x3 x4 x5 x6]); FO2_gLh0 = transpose(FO2_gLh0);     % Gradiente da Derivada de Lie de ordem Zero
    d1FO2  = collect(simplify(FO2_gLh0*system),[x1 x2 x3 x4 x5 x6]);
    
  % Segunda Derivada
    FO2_gLh1 = gradient(d1FO2,[x1 x2 x3 x4 x5 x6]); FO2_gLh1 = transpose(FO2_gLh1);   % Gradiente da Derivada de Lie de primeira ordem
    d2FO2  = collect(simplify(FO2_gLh1*system),[x1 x2 x3 x4 x5 x6]);
    
  % Terceira Derivada
    FO2_gLh2 = gradient(d2FO2,[x1 x2 x3 x4 x5 x6]); FO2_gLh2 = transpose(FO2_gLh2);   % Gradiente da Derivada de Lie de segunda ordem
    d3FO2  = collect(simplify(FO2_gLh2*system),[x1 x2 x3 x4 x5 x6 u1 u2]);
    
  % Coeficientes da Terceira Derivada
    FO2_gLh3 = gradient(d3FO2,[x1 x2 x3 x4 x5 x6 u1 u2]); FO2_gLh3 = transpose(FO2_gLh3);   % Gradiente da Derivada de Lie de terceira ordem
    
    
     
  %%  
    
    
    
    
    
    
 % Obtendo a matriz M que relaciona a sa?da plana e suas derivadas temporais com as vari?veis do sistema (estado e entrada)
   M = [[FO1_gLh0 0 0]; [FO1_gLh1 0 0]; [FO1_gLh2 0 0]; [FO1_gLh3 0] ];
   M = [M;[FO2_gLh0 0 0]; [FO2_gLh1 0 0]; [FO2_gLh2 0 0]; FO2_gLh3 ];
%  % Parametrizacao Diferencial  
   X = simplify((M^-1)*[fo1; d1fo1; d2fo1; d3fo1;fo2; d1fo2; d2fo2; d3fo2]);
   X1 = X(1,1); X2 = X(2,1); X3 = X(3,1);
   %%
   U1 = collect(X(4,1),[fo1 d1fo1 d2fo1 d3fo1]); 
   X4 = X(5,1); X5 = X(6,1); X = X(3,1);
   %%
   U1 = collect(X(4,1),[fo1 d1fo1 d2fo1 d3fo1]);









































































