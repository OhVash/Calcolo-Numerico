clear
close all
clc

A = [4 1 1; 2 -9 0; 0 -8 -6];
D = diag(diag(A)); 
C = A-D;

x0 = [5 4 7]'; %x0 assegnato
b = A*x0; 

x = ones(3,1); % inizializzazione vettore
d_inv = inv(D); %inversa di D

Bj = -d_inv * C;
qj = d_inv * b;
n = 100; %max iterazioni
count = 0;
toll = 10^-5;

%calcolo del raggio spettrale per vedere se la matrice converge
autovB = eig(Bj); %troviamo gli autovalori
raggio_sp = norm(eig(Bj), 'inf'); %raggio spettrale
if raggio_sp > 1
    disp('non converge')
else
    while count < n  && norm(b- A*x)>toll
    x = Bj*x+qj;
    count = count + 1;
    end
end
disp('trovato il vettore x :');
disp(x);
disp('con');
disp(count );
disp('iterazioni');

