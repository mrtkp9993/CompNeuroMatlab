% Entropy
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

for ii = 1:8
    ind = find(direction == ii);
    table(:, ii) = histc(R(ind), [0 19.5 30 100]);
end
table = table(1:3, :);

disp('')
disp('Table 1: Observed counts of stimulus-response pairs for the sample neuron')
disp(table)

pSR = table / sum(sum(table));
disp('')
disp('Table 2: Joint probability distribution P(S,R) for the sample neuron')
disp(pSR)

pS=sum(pSR);
pR=sum(pSR');

entropy_stimulus = -sum(pS .* log2(pS));
disp('')
disp('Entropy of stimulus S')
disp(entropy_stimulus)

mutual_inf = zeros(3,8);
for i=1:3
    for j=1:8
        if(pSR(i,j)~=0)
            mutual_inf(i,j)=pSR(i,j)*log2(pSR(i,j)/(pR(i).*pS(j)));
        end
    end
end
mutual_inf = sum(sum(mutual_inf));
disp('')
disp('Mutual information')
disp(mutual_inf)
