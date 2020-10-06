% FFT example
fs  = 1000;
dur = 2;
t   = 0:1/fs:dur;
freq1 = 2;
freq2 = 3;
signal = sin(2 * pi * freq1 * t) + sin(2 * pi * freq2 * t);
noisySignal = signal + randn(1, length(t));

figure
subplot(3,1,1)
plot(t,signal,'color','k','linewidth',2)
xlabel('Time in Seconds');
ylabel('Value');
subplot(3,1,2)
plot(t,noisySignal,'color','k','linewidth',2)
xlabel('Time in Seconds');
ylabel('Value');

nyquist = fs/2;
fSpaceSignal = fft(noisySignal)/(length(t)/2);
fBase = linspace(0,nyquist,floor(length(noisySignal)/2)+1);
powerPlot = subplot(3,1,3);
halfTheSignal = fSpaceSignal(1:length(fBase));
complexConjugate = conj(halfTheSignal);
pow = halfTheSignal.*complexConjugate;
h = plot(fBase,pow, 'color','k','linewidth',2);
xlim([0 20]); ylim([0 1]);
powerPlot.XTick = 0:20;
xlabel('Frequency in Hz'); ylabel('Power');
saveas(gcf, 'figs/A8_fft.png')
