clear
close all
clc

a= 1; 
b = 11;

x = linspace (a, b, 11);
y = [11249, 17440, 16055, 14300, 1818, 776, 6509, 5492, 4094, 4877, 12757];
n = length(y);
coeff= polyfit (x, y, 1);
plot(x, y, '--'); %grafico contagi
hold on
intervallo = linspace(1, 12); %intervallo per approssimare contagi dicembre
plot (intervallo, polyval(coeff, intervallo)); %retta
coeff_parabola = polyfit(x, y,2);
plot (intervallo, polyval(coeff_parabola,intervallo));
%con parabola 12° mese con circa 11000 contagi
%con retta 12° mese con circa 3000 contagi
% molto variabile
legend ('andamento contagi', 'retta approssimante', 'parabola approssimante');

