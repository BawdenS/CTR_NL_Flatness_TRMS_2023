% Plotar os resultados da simulação para uma dada configuraçao inicial

  % Pré-Comandos
    close all; LW = 2;

  % Plano XY
    figure(1);
    plot(Xd, Yd, 'b', xf, yf,'--r', 'LineWidth', LW);  title('Comportamento dinâmico do Navio no plano XY', 'fontsize', 18); set(gca,'FontSize',18);
    xlabel('X [m]', 'fontsize', 18); ylabel('Y [m]', 'fontsize', 18); % legend('Referência', 'Navio', 'Location', 'SouthEast');

  % Saídas do Sistema
    figure(2); 
    subplot(2,1,1); plot(t, Xd, 'b', 'LineWidth', LW);   title('X(t)', 'fontsize', 18); hold on;
    subplot(2,1,1); plot(tf, xf, '--r', 'LineWidth', LW); set(gca,'FontSize',18);  
    xlabel('t [s]', 'fontsize', 18); ylabel('X [m]', 'fontsize', 18); % legend('Referência', 'Navio', 'Location', 'SouthEast');
    subplot(2,1,2); plot(t, Yd, 'b', 'LineWidth', LW);   title('Y(t)', 'fontsize', 18); hold on;
    subplot(2,1,2); plot(tf, yf, '--r', 'LineWidth', LW); set(gca,'FontSize',18); 
    xlabel('t [s]', 'fontsize', 18); ylabel('Y [m]', 'fontsize', 18); % legend('Referência', 'Navio', 'Location', 'SouthEast');

  % Varíavel de Estado (Psi e V)
    figure(3); 
    subplot(2,1,1); plot(t, Psid, 'b', 'LineWidth', LW); title('Psi(t)', 'fontsize', 18); hold on;
    subplot(2,1,1); plot(tf, psif, '--r', 'LineWidth', LW); set(gca,'FontSize',18); 
    xlabel('t [s]', 'fontsize', 18); ylabel('Psi [rad]', 'fontsize', 18); % legend('Referência', 'Navio', 'Location', 'SouthEast');
    subplot(2,1,2); plot(t, Vd, 'b', 'LineWidth', LW); title('V(t)', 'fontsize', 18); hold on;
    subplot(2,1,2); plot(tf, vf, '--r', 'LineWidth', LW); set(gca,'FontSize',18);
    xlabel('t [s]', 'fontsize', 18); ylabel('V [m/s]', 'fontsize', 18); % legend('Referência', 'Navio', 'Location', 'SouthEast');

  % Sinais de Controle
    figure(4); 
    subplot(2,1,1); plot(t, U1d, 'b', 'LineWidth', LW);  title('U1(t)', 'fontsize', 18); hold on;
    subplot(2,1,1); plot(tf, tu1, '--r', 'LineWidth', LW); set(gca,'FontSize',18);
    xlabel('t [s]', 'fontsize', 18); ylabel('U1 [m/s]', 'fontsize', 18); % legend('Referência', 'Navio', 'Location', 'SouthEast');
    subplot(2,1,2); plot(t, U2d, 'b', 'LineWidth', LW);  title('U2(t)', 'fontsize', 18); hold on;
    subplot(2,1,2); plot(tf, tu2, '--r', 'LineWidth', LW); set(gca,'FontSize',18);
    xlabel('t [s]', 'fontsize', 18); ylabel('U2 [rad/s]', 'fontsize', 18); % legend('Referência', 'Navio', 'Location', 'SouthEast');
