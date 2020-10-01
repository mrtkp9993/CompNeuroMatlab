% Raster plot example
% Slightly modified version of code on page 288-289
% Source: Wallisch, Lusignan, Benayoun, Baker, Dickey, Hatsopoulos
% MATLAB for Neuroscientists, 2nd Edition
load('data/Chap17_Data.mat');

edges = [-1:.005:1];
raster = zeros(length(spike), length(edges));
for jj = 1:length(spike)
    raster(jj, :) = histc(spike(jj).times, edges);
end

figure
imagesc(~raster)
colormap('gray')
xlabel('Time (Sec)')
ylabel('Trial #')
xticks([1 200 401])
xticklabels({'-1', '0', '1'})
