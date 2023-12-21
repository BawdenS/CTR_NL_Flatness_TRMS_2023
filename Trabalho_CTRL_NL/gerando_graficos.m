
addpath('./Resultado/Export_fig');
close all; LW = 2; flagPrint = 1;

fig = figure('Units', 'normalized', 'Position', [0 0 0.35 0.35]);
plot(SAIDA_ARFAGEM.time,SAIDA_ARFAGEM.signals.values)
title('Gráfico da arfagem pelo tempo');
xlabel('tempo[s]');
ylabel('graus[°]');
axis tight;
if(flagPrint == 1)
%       maximize(gcf);
  export_fig('./Resultado/grafico_GUINADA', '-eps', '-transparent'); 
  eps2pdf('./Resultado/grafico_GUINADA.eps', './Resultado/grafico_GUINADA.pdf', 1);
end


close all





fig2= figure('Units', 'normalized', 'Position', [0 0 0.35 0.35]);
plot(SAIDA_GUINADA.time,SAIDA_GUINADA.signals.values)
title('Gráfico da arfagem pelo tempo');
xlabel('tempo[s]');
ylabel('graus[°]');
axis tight;
% saveas(fig, 'grafico_arfagem.pdf');
% print(fig, 'grafico_arfagem.pdf', '-dpdf', '-loose');









if(flagPrint == 1)
%       maximize(gcf);
  export_fig('./Resultado/grafico_GUINADA', '-eps', '-transparent'); 
  eps2pdf('./Resultado/grafico_GUINADA.eps', './Resultado/grafico_GUINADA.pdf', 1);
end