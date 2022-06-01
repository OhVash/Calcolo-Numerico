%% ES. 1
clear
clc 
close all
toll = 10^-32; %tolleranza
n = 3; %dimensione matrice nxn
diag_p = rand(n,1); % valori diagonale principale
diag_s = rand(n-1, 1); %valori altre diag superiore e inferirore
A = diag(diag_p) + diag(diag_s, 1) + diag(diag_s, -1);
%calcolo dei determinanti
d(1) = 1;
d(2) = diag_p (1);
for i = 2:n
    if (abs(d(i))<=toll)
        disp ('matrice non fattorizzabile')
        return
    else d(i+1) = diag_p(i)*d(i)-diag_s(i-1)^2*d(i-1);
    end
end
%calcolo fattorizzazione LU
if (abs(d(n+1))<=toll)
    disp ('matrice singolare')
    %return
else
   disp ('il determinante della matrice è: ')
   d(n+1)
   u(1)=d(2)/d(1);
   for j=1:n-1
       u(j+1)= d(j+2)/d(j+1);
       l(j) = diag_s(j)*d(j)/d(j+1);
   end
   L = eye(n)+diag(ones(n-1, 1),-1)
   U = diag(u)+diag(diag_s, 1)
end


%% ES. 4
%inizializzazione matrici
A = [2 3 1; 1 -1 1; 0 2 2];
B = [1 2 1; -1 2 -1; 2 0 2];
C = [1 0 1; 0 1 1; 1 0 2];

%a
axb = A*B;
bxa = B*A;
diff = norm(axb -bxa); %c'è differenza quindi sono diversi

%b
abc1 = (A + B) + C;
abc2 = A + (B + C);
diff1 = norm(abc1 - abc2); %non c'è differenza

%c
abc3 = A*(B*C);
abc4 = (A*B)*C;
diff2 = norm (abc3- abc4); %non c'è differenza

%d
abt = (A*B)';
abt2 = B'*A';
diff3 = norm(abt- abt2); %non c'è differenza

%% ES.5
clear 
close all
clc
%file funzione5.m contiene la funzione
for n = 1:50;
[determinante(n), condizionamento(n)] = funzione5 (n);
end

x = [1:50];
subplot (1,2,1);
plot (x, determinante, 'r.');
title ('grafico determinante');
axis square
xlabel ('dimensione nxn matrice');
subplot (1,2,2);
plot (x, condizionamento, '.');
title ('grafico condizionamento');
axis square
xlabel ('dimensione nxn matrice');

%variante senza funzione
% for n=1:50
%     A = flip(diag(ones(n,1)*2)) + flip(diag(ones(n-1,1)*-1,-1));
%     A = A + flip(diag(ones(n-1,1)*-1,1));
%     determinante(n) = det(A);
%     condizionamento(n) = cond(A);
% end
% 
% subplot(1,2,1);
% plot([1:50],abs(determinante),'*');
% title('Determinante');
% subplot(1,2,2);
% plot([1:50],condizionamento,'*');
% title('Condizionamento');

%% ES. 6
clear 
clc
close all

A1 = hilb(1000);
B1 = rand (1000);

%a
x = ones(1000,1);
b = A1*x;

y= ones(1000,1);
c = B1*y;

%b
x1 = A1\b;
y1 = B1\c;

%c
errorex = norm (x1 - x, "inf") / norm(x, "inf");
errorey = norm (y1- y, "inf" ) / norm(x, "inf");
ca = cond(A1);
cb = cond (B1);

%d
inizio = 2;
fine = 50;
%cond2 = ones(fine-1,  1); %inizializzazione di cond2 rende più veloce il
%programma

for i = inizio:fine
    cond2(i-1) = cond(hilb(i)); 
end

semilogy (2:50, cond2); %grafico in scala semilogaritmica
grid on 
xlabel('dimensione');
ylabel('condizionamento');
title('condizonamento Hilbert');

