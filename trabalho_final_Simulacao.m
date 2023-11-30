%% substituicao numerica
linearizacao_planta
% valores que serão substituidas
params = [I_1, I_2, a_1, b_1, a_2, b_2, M_g, B_1P, B_2P, K_gy, k1, k2, T11, T10, T21, T20, T_P, T_O, K_c,B_1Y];
values = [6.8E-2, 2E-2, 0.0135, 0.0924, 0.02, 0.09, 0.32, 6E-3, 1E-3, 0.05, 1.1, 0.8, 1.1, 1, 1, 1, 2, 3.5, -0.2,0.1];

% Substitute the parameters with their values in A
A = subs(A, params, values);



A = double(A);
B = subs(B, params, values);

B = double(B);
% dados verificados
disp(A)
disp(B)
disp(C)
disp(D)


%% Flatness begins

B1=B(:,1);
B2=B(:,2);
C_k  = [B1 A*B1 A*A*B1 B2 A*B2 A*A*B2]; % controlavel

if rank(C_k) == size(A,1)
    disp("Sistema Controlável")
end

FO = [0 0 1 0 0 0;0 0 0 0 0 1] * inv(C_k)













