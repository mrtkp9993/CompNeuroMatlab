% Spectrogram
% Source: Erik Lee Nylen and Pascal Wallisch,
% Neural Data Science
fs  = 1000;
dur = 2;
t   = 0:1/fs:dur;
freq1 = 2;
freq2 = 3;
signal = sin(2 * pi * freq1 * t) + sin(2 * pi * freq2 * t);
noisySignal = signal + randn(1, length(t));

windLength = 1024;
wind = kaiser(windLength);
overl = length(wind)-1;
yFreqs = 0:20;
figure
subplot(1,2,1)
spectrogram(noisySignal,wind,overl,yFreqs,fs,'yaxis');
wind = hanning(windLength);
subplot(1,2,2)%9
spectrogram(noisySignal,wind,overl,yFreqs,fs,'yaxis');
colormap(hot)
saveas(gcf, 'figs/A9_spectrogram.png')
