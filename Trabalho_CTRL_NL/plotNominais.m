% Plotar as trajetórias nominais das variáveis do sistema (Estado e Controle)

  % Pré-Comandos
    close all; LW = 2;

  % Plano XD
    figure(1); set(gca,'FontSize',18);
    plot(Xd,Yd); title('Trajetoria Desejada no plano XY','fontsize', 18);
    xlabel('X [m]', 'fontsize', 18); ylabel('Y [m]', 'fontsize', 18);

  % Saídas do Sistema (X e Y)
    figure(2); 
    subplot(2,1,1); plot(t,Xd); title('Trajetoria Desejada para X(t)'); 
    xlabel('t [s]'); ylabel('X [m]'); set(gca,'FontSize',18);
    subplot(2,1,2); plot(t,Yd); title('Trajetoria Desejada para Y(t)','fontsize', 18); 
    xlabel('t [s]'); ylabel('Y [m]'); set(gca,'FontSize',18);

  % Varíavel de Estado (Psi e V)
    figure(3);
    subplot(2,1,1); plot(t,Psid); title('Trajetoria Desejada para Psi(t)','fontsize', 18); 
    xlabel('t [s]'); ylabel('Psi [Deg]'); set(gca,'FontSize',18);
    subplot(2,1,2); plot(t,Vd); title('Trajetoria Desejada para V(t)','fontsize', 18); 
    xlabel('t [s]'); ylabel('V [m/s]'); set(gca,'FontSize',18);

  % Sinais de Controle
    figure(4);
    subplot(2,1,1); plot(t,U1d); title('Trajetoria Desejada para U1(t)'); 
    xlabel('t [s]', 'fontsize', 18); ylabel('U1 [m/s]'); set(gca,'FontSize',18);
    subplot(2,1,2); plot(t,U2d); title('Trajetoria Desejada para U2(t)'); 
    xlabel('t [s]', 'fontsize', 18); ylabel('U2 [rad/s]'); set(gca,'FontSize',18);