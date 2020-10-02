% PETH Example
% Slightly modified version of code on page 290
% Source: Wallisch, Lusignan, Benayoun, Baker, Dickey, Hatsopoulos
% MATLAB for Neuroscientists, 2nd Edition
load('data/Chap17_Data.mat');

edges = [-1:.1:1];
peth  = zeros(length(edges), 1);
for jj = 1:length(spike)
    peth = peth + histc(spike(jj).times, edges);
end

figure
bar(edges, peth)
xlabel('Time (Sec)')
ylabel('# of spikes')
xlim([-1.1 1])
