% Heat map example
% Source: Erik Lee Nylen and Pascal Wallisch,
% Neural Data Science
load('data/tenIntensities.mat')

for ii = 1:size(A2, 1)
    A3(ii, :) = (sum(A2{ii, 1}) ./ 10);
end
A3(:, 22:100) = [];
figure
h = pcolor(A3);
set(h,'Facecolor','interp')
set(h,'Linestyle','none')
set(gca,'YDir','reverse')
colormap('hot')
h = colorbar;
ylabel(h, 'mean spikes per time bin')
xlabel('time (in milliseconds)')
ylabel('stimulus intensity')
title('heat map of mean spiking for stimuli of varying intensity')
saveas(gcf, 'figs/A7_heat_map.png')
