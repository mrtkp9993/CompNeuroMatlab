% Principal Component Analysis
% Modified version of code on page 311-312
% Source: Wallisch, Lusignan, Benayoun, Baker, Dickey, Hatsopoulos
% MATLAB for Neuroscientists, 2nd Edition
load('data/Chap17_SpikeSorting.mat')

[coeff, score, latent] = pca(double(wf));
plot(score(:,1),score(:,2),'.','MarkerSize',1)
xlim([-300 300])
ylim([-250 250])
xlabel('PC1')
ylabel('PC2')
