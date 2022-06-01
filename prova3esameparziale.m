%% testo
%Data la funzione f (x) = sin(2x) + e^x + 1 definita nell'intervallo [−2, 0.1], eseguire le seguenti operazioni:
% 1. calcolare il polinomio di interpolazione semplice lagrangiano che interpola la funzione nei nodi {−2, −1.25, −0.7, 0.1},
% 2. in una finestra grafica visualizzare la funzione f, il polinomio interpolante e i relativi nodi di interpolazione,
% 3. calcolare l'errore di interpolazione in norma infinito, considerando una griglia equispaziata di 1000 nodi in [−2, 0.1],
% 4. calcolare l'approssimazione nel senso dei minimi quadrati con un polinomio di secondo grado e aggiungerla al gra􏰁co,
% 5. calcolare l'errore di questa approssimazione in norma infinito, considerando una griglia equispaziata di 1000 nodi in [−2, 0.1]. E' migliore della precedente approssimazione?
% 6. calcolare l'integrale della funzione esatta,
% 7. calcolare l'integrale del polinomio interpolante lagrangiano e l'errore assoluto commesso
% 8. calcolare l'integrale del polinomio ai minimi quadrati e l'errore assoluto commesso. Quale errore è più piccolo?
close all
clc
clear 

a = -2;
b = 0.1;
intervallo = linspace (a, b, 1000); 
nodi = [-2, -1.25, -0.7, 0.1];
f = @(x) sin(2*x) + exp(x) + 1; %funzione assegnata

y_f = f(intervallo); %funz calcolata nell'intervallo
y_nodi = f(nodi); %funzione calcolata nei nodi

%1.
coeff_lagr = polyfit (nodi, y_nodi, length(nodi)-1); %coefficienti polinomio interpolatore
pol_lagr = polyval (coeff_lagr, intervallo); %polinomio interpolatore

%2.
plot (intervallo, y_f);
hold on
plot (intervallo, pol_lagr, 'g--');
plot (nodi, y_nodi, '*');
grid on

%3
errore_lagrange = norm(pol_lagr - y_f, "inf"); %errore dell'approssimazione lagrange
%4
coeff_minquad = polyfit (nodi, y_nodi, 2); %coefficienti polinomio int. minimi quadrati
pol_minquad = polyval(coeff_minquad, intervallo); %polinomio int. minimi quadrati
plot (intervallo, pol_minquad); %aggiungo al grafico
%5
errore_minquad = norm(pol_minquad - y_f, 'inf'); %errore dell'approssimazione con minimi quadrati

if errore_lagrange<errore_minquad
    disp('Meglio interpolazione Lagrange');
else
    disp ('Meglio interpolazione minimi quadrati');
end

legend ('funzione', 'polinomio interpolatore lagrange', 'punti di interpolazione', 'pol. interp. min quad');

% primitiva = @(x) -cos(2*x)/2+exp(x)+x;
% Int = primitiva(b) - primitiva(a);
Integrale = quad(f, a, b, 10^-14); %equivalente alle prime due istruzioni, volendo aggiungere tolleranza.

%7
integranda_lagr=@(x) polyval(coeff_lagr,x); %funzione integranda lagrangiana
I_lagr=quad(integranda_lagr,a,b,10^-14); %integrale lagrange
err_int_lagr = abs(Integrale - I_lagr); %errore di approssimazione con lag

%8
integranda_minquad  =@(x) polyval (coeff_minquad, x); %funzione integranda minimi quadrati
I_minquad = quad(integranda_minquad, a,b, 10^-14); %integrale minimi quadrati
err_int_mq = abs(Integrale - I_minquad); %errore di approssimazione con min. quad.

if err_int_lagr<err_int_mq
    disp('meglio integrazione lagrange');
else disp('meglio integrazione minimi quadrati');
end


