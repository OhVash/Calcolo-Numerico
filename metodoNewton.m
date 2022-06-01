%calcolo di radici attraverso il metodo
%di Newton

close all
clear
clc

fun = @(x) cos(2*x).^2 - x.^2;
dfun = @(x) -4*cos(2*x)*sin(2*x)-2*x;

x0 = 1;
max_iter = 100;
toll = 10^(-5);

[approx n_iter] = newton(x0, fun, dfun, toll, max_iter);

disp("Num iterazioni: " + n_iter);
approx

x_plot=linspace(-1.5, 1.5);
plot(x_plot, fun(x_plot));
grid on;

radice = fzero(fun, x0);
err = abs(radice - approx);
figure;
semilogy([1:n_iter+1], err, '-*');

