% Curve Fit Example
% Source: Wallisch, Lusignan, Benayoun, Baker, Dickey, Hatsopoulos
% MATLAB for Neuroscientists, 2nd Edition
x = 0:0.1:30;
y = cos(x) + randn(1, length(x));

fitfuncstr = 'p(1) + p(2) * cos(theta - p(3))';
fitfunc    = inline(fitfuncstr, 'p', 'theta');
p = nlinfit(x, y, fitfunc, [1 1 0]);
yFit = fitfunc(p, x);

figure
plot(x, y, 'DisplayName', 'Actual')
hold on
plot(x, yFit, 'k', 'DisplayName', 'Fitted')
hold off
xlabel('Time (Sec)')
ylabel('Simulated response')
legend
saveas(gcf, 'figs/A3_curve_fitting.png')
