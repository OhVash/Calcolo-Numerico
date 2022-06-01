%% ES-1
% Calcolare il polinomio interpolatore di grado n = 5 della funzione f(x) = e^x sin(2x), usando una griglia uniforme sull'intervallo [0, 2].
% Visualizzare i risultati, riportando sullo stesso grafico:
% - la funzione f(x)
% - il polinomio di interpolazione p(x) 
% - i punti di interpolazione.

n = 5; %grado del polinomio
fx = @(x) exp(x).*sin(2*x); %funzione

nodi = linspace (0, 2, n+1); %nodi (ascisse)
y = fx(nodi); %valore della funzione nei vari nodi

intervallo = linspace (0, 2); %griglia uniforme

coeff = polyfit(nodi, y, n); %coefficienti del polinomio che "fitta" i dati Y

polinomio = polyval (coeff, intervallo); %polinomio calcolato nell'intervallo

plot (intervallo, fx(intervallo), "g--");
hold on
plot (intervallo, polinomio, "r");
hold on
plot (nodi, y, "*");
legend ("funzione", "polinomio int", "nodi")

%% ES 2 
clear
clc
close all

%Ripetere l%esercizio precedente ma con funzione di Runge f(x) = 1/(1+x^2)
% − 5 ≤ x ≤ 5
% - con i nodi di Chebyshev definiti sull'intervallo [a, b]
%   xi = ((a+b)/2 - (b-a)/2)*cos((2i+1)/(2n+2)π)  i=0,...,n
% - con nodi equispaziati


a = -5; %limite sx intervallo
b = 5; %limite dx intervallo
n = 10; %grado polinomio
intervallo1 = linspace (a, b);

f = @(x) 1 ./ (1 + x.^2); %funzione di Runge
nodi1 = linspace (a, b, n+1); %intervallo nodi equispaziati

fnodi1 = f(nodi1); %calcolo funzione nei nodi equispaziati

coeff = polyfit(nodi1, fnodi1, n); %coefficienti pol. interpolatore nodi eq.

pol = polyval(coeff, intervallo1); %polinomio interpolatore nodi eq.

n_cheb = (((a+b)/2) - ((b-a)/2))*cos((2*[0:n]+1)/((2*n)+2)*pi);  %nodi chebyshev "[0:grado]"

f_cheb = f(n_cheb); %calcolo funzione nei nodi di chebyshev

coeff_cheb = polyfit(n_cheb, f_cheb, n); %coefficienti pol. interp. chebyshev

pol_cheb = polyval (coeff_cheb, intervallo1); %polinomio interpolatore chebychev

plot (intervallo1, f(intervallo1), "r");
hold on
plot (intervallo1, pol, "b");
hold on 
plot (nodi1, fnodi1, "r*");
hold on
plot (intervallo1, pol_cheb, "g--");
hold on 
plot (n_cheb, f_cheb, 'b*');
grid on;

legend ("funzione di Runge", "polinomio int. nodi eq.", "nodi equispaziati", "polinomio int. chebyshev", "nodi chebyshev");

%% ES. 3
%Calcolare l' errore di interpolazione su una griglia di 100 nodi, 
%relativo alla funzione f (x) = e^x * cos(4x), con x ∈ [−3, 3], 
% usando una griglia di interpolazione equispaziata con n = 5, 10, 20, 40 nodi e la matrice di Vandermonde.

clear
clc
close all

a = -3;
b = 3;
fun = @(x) exp(x) .* cos(4*x); %funzione assegnata

griglia = linspace(a, b, 100); %griglia di interpolazione
nodi2 = linspace(a, b, 5); %griglia equispaziata di 5 nodi [10,20,40]

y_nodi= fun (nodi2); %funzione nella griglia di "5" [10,20,40] nodi equispaziati

V = vander(nodi2); %matrice di vandermonde

coeff2 = V\y_nodi'; %coefficienti polinomio di interpolazione
pol2 = polyval (coeff2, griglia); %polinomio interpolatore
y_corretto = fun(griglia);

errore = norm(pol2 - y_corretto, "inf");

%non richiesto ma grafico che mostra funzione, polinomio int e punti.
plot (griglia, y_corretto, "r");
hold on;
plot (griglia, pol2, "b--");
hold on;
plot (nodi2, y_nodi, "*");
legend ("funzione", "polinomio interpolatore", "nodi di interpolazione")
grid on;
title ('Es. 3');
%aumentando i nodi sempre più preciso.

%% ES. 3 CON FOR FATTO BENE
clear
close all
clc

a = -3;
b = 3;
fun = @(x) exp(x) .* cos(4*x); %funzione assegnata
griglia = linspace(a, b, 100); %griglia di interpolazione
count = 0;

for n = [5, 10, 20, 40]
    count = count +1;
    nodi2 = linspace(a, b, n); %griglia equispaziata di [5, 10,20,40] nodi
    y_nodi= fun (nodi2); %funzione nella griglia di [5, 10,20,40] nodi equispaziati

    V = vander(nodi2); %matrice di vandermonde

    coeff2 = V\y_nodi'; %coefficienti polinomio di interpolazione
    pol2 = polyval (coeff2, griglia); %polinomio interpolatore
    y_corretto = fun(griglia);

    errore(count) = norm(pol2 - y_corretto, "inf");

    %non richiesto ma grafico che mostra funzione, polinomio int e punti.
    subplot(1, 4, count);
    plot (griglia, y_corretto, "r");
    hold on;
    plot (griglia, pol2, "b--");
    hold on;
    plot (nodi2, y_nodi, "*");
    title(n, 'nodi');
    legend ("funzione", "polinomio interpolatore", "nodi di interpolazione")
    grid on;
    %aumentando i nodi sempre più preciso. 
end

 %grafico dell'errore:
    figure
    plot ([1:count], errore);
    title ('grafico dell errore')
    xlabel('count');

%% ES. 4
%Interpoliamo la funzione f (x) = sin(x) con 22 nodi equispaziati sull’intervallo [−1, 1].
%Generiamo un insieme perturbato di valori ~f(xi) delle valutazioni funzionali f(xi) = sin(xi) con
% ~f(xi) = f(xi)(1 + (−1)^i*10−4).
%Osserviamo come varia l'errore di interpolazione su una griglia di 100 nodi equispaziati.

clear
close all
clc
n = 22; %numero nodi
a = -1;
b = 1;
griglia = linspace (a, b);
funz = @(x) sin(x);
val_funz = funz(griglia); %y funzione
nodi3 = linspace (a, b, n); %nodi
y_nodi3 = funz(nodi3); %calcolo funzione nei nodi
coeff3 = polyfit (nodi3, y_nodi3, n-1); %coeff polinomio interpolatore
pol3 = polyval(coeff3, griglia); %polinomio interpolatore

y_pert =  y_nodi3 .* (1+(-1).^(1:n)*10^(-4)); %valori perturbati nei nodi
coeff_pert = polyfit(nodi3, y_pert,n-1); %coefficienti polinomio perturbato
pol_pert = polyval(coeff_pert, griglia); %polinomio perturbato

%errori:
errore_dati = norm (y_nodi3 - y_pert, "inf"); %errore sui dati perturbati
errore_pol = norm (pol3 - val_funz); %errore sul polinomio interp.
errore_pol_pert = norm (pol_pert - val_funz); %errore sul polinomio interp. perturbato

%grafico
plot (griglia, val_funz); %funzione
hold on;
plot (griglia, pol3, 'r'); %polinomio int.
hold on;
plot (griglia, pol_pert, 'g--'); %polinomio pert.
hold on;
plot (nodi3, y_nodi3, 'r*'); %nodi interp.
hold on;
plot (nodi3, y_pert,'g*'); %nodi perturbati.
grid on;
legend ('funzione', 'pol. interp', 'pol perturbato', 'nodi interp', 'nodi perturbati')

%% ES. 5 

clear
clc
close all

n = 10;
a = -1;
b = 1;

griglia = linspace(a,b); 

funzione = @(x) exp(x)+1; %funzione
y_fun = funzione(griglia); %valori funzione

 
nodi4 = linspace (a,b, n+1); %nodi interpolazione
y_nodi4 = funzione(nodi4); %valori y nei nodi

v = vander(nodi4); %matrice vandermonde
coeff4 = v\y_nodi4'; %coefficienti polinomio interpolatore
pol4 = polyval (coeff4, griglia); %polinomio interpolatore

epsi = (-1)^n*10^(-5);
y_prt = y_nodi4 + epsi; %valori perturbati nei nodi
coeff_prt = polyfit(nodi4, y_prt, n); %coefficienti pol. perturbato
pol_prt = polyval(coeff_prt, griglia); %pol. inter. perturbato

max1 = max(abs(coeff4'- coeff_prt)); %max1

t = linspace (-1,1, 101); %vettore intervallo t
y_t = funzione (t); %valori y nell'intervallo t
coeff_t = polyfit(t, y_t, 100); %coeff. pol interp. t
pol_t = polyval (coeff_t, griglia); %polinomio interp. t

y_t_prt = y_t + epsi; %valori perturbati t
coeff_t_prt = polyfit (t, y_t, 100); %coeff pol. int. in t perturbato 
pol_t_prt = polyval (coeff_t_prt, griglia); %polinomio int. t perturbato

max2 = max(abs(pol_t - pol_t_prt));

n_cheb1 = cos(((2*[0:n]+1)*pi)/(2*n+2)); %nodi di chebyshev
y_cheb = funzione(n_cheb1); %valori nei nodi di chebyshev
coeff_cheb1 = polyfit(n_cheb1, y_cheb, n); %coefficienti nodi pol. int. chebyshev
pol_cheb1 = polyval (coeff_cheb1, griglia); %polinomio interp. nei nodi di chebyshev

plot(griglia, pol4); %polinomio interpolatore
hold on
plot (griglia, pol_prt, '--'); %polinomio interpolatore perturbato
plot (nodi4, y_nodi4, 'b*'); %nodi
plot (nodi4, y_prt, 'r*'); %nodi perturbati
plot(griglia, pol_cheb1, '.'); %polinomio int. chebyshev
plot (n_cheb1, y_cheb, 'y*'); %nodi cheb
grid on; 
legend ('polinomio inter.', 'polinomio pert.', 'nodi interp.', 'nodi perturb.', 'polinomio cheb', 'nodi cheb');

%perturbazione pressochè nulla

% figure
% plot(t, y_t);
% hold on
% plot (t,y_t_prt);
%grid on:

%perturbazione pressochè nulla

%% ES. 6
% Approssimare la radice quadrata di x = 0.6 considerando l%interpolazione 
% nella forma di Lagrange con nodi i tre quadrati perfetti x0 = 0.49, x1 = 0.64, x2 = 0.81. 
% Stimare il resto di interpolazione e calcolare lo scarto rispetto al valore ottenuto con il comando sqrt di Matlab. 
% Ripetere le operazioni aggiungendo il nodo di interpolazione x = 0.36.

clear
clc
close all

%approssimazione della radice con 3 nodi
n = 3;
x = 0.6; 
rad_x = sqrt(x); %valore da approssimare

quadr_p = [0.49, 0.64, 0.81];
rad_p = sqrt(quadr_p); %vettore con radici degli elem. del vettore precedente
coeff = polyfit(quadr_p, rad_p, n-1);
appross = polyval(coeff, 0.6); %approssimazione del valore

errore = abs(appross - rad_x);

%approssimazione della radice con 4 nodi
n1 = 4;
quadr_p1 = [0.49, 0.64, 0.81, 0.36];
rad_p1 = sqrt(quadr_p1);

coeff1 = polyfit(quadr_p1, rad_p1, n1-1);
appross1 = polyval(coeff1, 0.6);

errore1 = abs(appross1 - rad_x);

%% ES. 7 
clear
clc
close all
a = -1;
b = 1;
n = 10;

interval = linspace (a, b); %intervallo
nodi = linspace (a, b, n-1); %nodi

for i = 1:length(interval)
    wn(i) = abs(prod(interval(i)-nodi)); %calcolo funzione wn
end
  
plot (interval ,wn); %grafico funzione wn
hold on

n_cheb = (((a+b)/2) - ((b-a)/2))*cos((2*[0:n]+1)/((2*n)+2)*pi); %nodi chebyshev

for i = 1:length(interval)
    wn_cheb(i) = abs(prod(interval(i)-n_cheb)); %calcolo funzione wn con nodi chebyshev
end

plot (interval, wn_cheb); %grafico funzione wn con nodi chebyshev
grid on;
legend ('wn normale', 'wn chebyshev');

%% CONFRONTO TRA INT. SEMPLICE / COMPOSITA E SPLINE

clear 
clc
close all

x = [-55:10:65];
y = [-3.25, -3.37, -3.35, -3.2, -3.12, -3.02, -3.02, -3.07, -3.17, -3.32, -3.3, -3.22, -3.1];

n = length(x);

plot (x, y, '*'); %punti interpolazione
hold on

intervallo = linspace (-55, 65);

%INTERPOLAZIONE SEMPLICE
coeff_s = polyfit (x, y, n-1);
pol_s = polyval (coeff_s, intervallo);
plot (intervallo, pol_s);

%INTERPOLAZIONE COMPOSITA
pol_c = interp1(x, y, intervallo);
plot (intervallo, pol_c, 'g');

%INTERPOLAZIONE SPLINE
pol_sp = spline (x, y, intervallo);
plot(intervallo, pol_sp);

legend('punti interp', 'semplice', 'composita', 'spline');





