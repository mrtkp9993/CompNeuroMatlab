% Spike Density Function
% Source: Wallisch, Lusignan, Benayoun, Baker, Dickey, Hatsopoulos
% MATLAB for Neuroscientists, 2nd Edition
load('data/Chap20_Data.mat')

trialNum = 1;
binned = hist(trial(trialNum).spikeTimes, [0:.001:1]);
sigma = 0.015;
edges = [-3*sigma:.001:3*sigma];
kernel = normpdf(edges, 0, sigma) * 0.001;
s = conv(binned, kernel);
center = ceil(length(edges)/2);
s = s(center:1000 + center - 1);

figure
t=trial(trialNum).spikeTimes;
edges2=[0:.001:1];
plot(edges2(1:length(s)),s)
hold on
a=-.01;
b=-0.02;
for i=1:length(t)
    line([t(i) t(i)],[a b])
end
y=ylim;
axis([-0.1 1.1 -0.03 y(2)+0.01])
title(['Spike Density Function for Trial #' num2str(trialNum)])
xlabel('Time (s)')
saveas(gcf, 'figs/A5_spike_density_func.png')
