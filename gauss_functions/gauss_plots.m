% % Plota a órbita
% function gauss_plots(state)
%     figure;
%     plot3(state(:, 1), state(:, 2), state(:, 3));
%     axis equal;
%     xlabel('X (km)');
%     ylabel('Y (km)');
%     zlabel('Z (km)');
%     title('Órbita - Gauss');
% end

% Plota parâmetros orbitais
function gauss_plots(t,params,mu)
    a = params(:,1);
    e = params(:,2);
    i = params(:,3);
    RA = params(:,4);
    w = params(:,5);
    t = t/(24*3600); % dias

    ra = a.*(1+e); % km
    rp = a.*(1-e); % km

%     figure
%     plot(t,ra-6378,'g',t,rp-6378,'r');
%     title('Altitudes - Gauss');
%     legend('Apogeu','Perigeu');
%     xlabel('Tempo (dias)');
%     ylabel('Altitude (km)');
%     xlim([t(1) t(end)]);

    figure
    subplot(2,1,1);
    plot(t,a);
    title('Semi-eixo Maior (km) - Gauss');
    xlabel('Tempo (dias)');
    ylabel('a (km)');
    xlim([t(1) t(end)]);
    subplot(2,1,2);
    plot(t,a-a(1));
    title('Variação do Semi-eixo Maior (km) - Gauss');
    xlabel('Tempo (dias)');
    ylabel('Δa (km)');
    xlim([t(1) t(end)]);

    figure
    subplot(2,1,1);
    plot(t,e);
    title('Excentricidade - Gauss');
    xlabel('Tempo (dias)');
    ylabel('e');
    xlim([t(1) t(end)]);
    subplot(2,1,2);
    plot(t,e-e(1));
    title('Variação da Excentricidade - Gauss');
    xlabel('Tempo (dias)');
    ylabel('Δe');
    xlim([t(1) t(end)]);

%     figure
%     subplot(2,1,1);
%     plot(t,h);
%     title('Momento Angular Específico - Gauss');
%     xlabel('Tempo (dias)');
%     ylabel('h (km²/s)');
%     xlim([t(1) t(end)]);
%     subplot(2,1,2);
%     plot(t,h-h(1));
%     title('Variação do Momento Angular Específico - Gauss');
%     xlabel('Tempo (dias)');
%     ylabel('Δh (km²/s)');
%     xlim([t(1) t(end)]);

    figure
    subplot(3,1,1);
    plot(t,i,'g');
    title('Inclinação - Gauss');
    xlabel('Tempo (dias)');
    ylabel('Ângulo (deg)');
    xlim([t(1) t(end)]);
    subplot(3,1,2);
    plot(t,w,'r');
    title('Argumento de Perigeu - Gauss');
    xlabel('Tempo (dias)');
    ylabel('Ângulo (deg)');
    xlim([t(1) t(end)]);
    subplot(3,1,3);
    plot(t,RA,'b');
    title('Longitude do Nodo Ascendente - Gauss');
    xlabel('Tempo (dias)');
    ylabel('Ângulo (deg)');
    xlim([t(1) t(end)]);

%     figure
%     subplot(3,1,1);
%     plot(t,rad2deg(incl)-rad2deg(incl(1)),'g');
%     title('Variação da Inclinação - Gauss');
%     xlabel('Tempo (dias)');
%     ylabel('Ângulo (deg)');
%     xlim([t(1) t(end)]);
%     subplot(3,1,2);
%     plot(t,rad2deg(w)-rad2deg(w(1)),'r');
%     title('Variação do Argumento de Perigeu - Gauss');
%     xlabel('Tempo (dias)');
%     ylabel('Ângulo (deg)');
%     xlim([t(1) t(end)]);
%     subplot(3,1,3);
%     plot(t,rad2deg(W)-rad2deg(W(1)),'b');
%     title('Variação da Longitude do Nodo Ascendente - Gauss');
%     xlabel('Tempo (dias)');
%     ylabel('Ângulo (deg)');
%     xlim([t(1) t(end)]);
end