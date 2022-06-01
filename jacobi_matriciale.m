clear 
close
clc

A = [3 0 4; 7 4 2; -1 -1 2];
b = A * [5 4 7]'; %vettore 5 4 7 noto
max_iterazioni = 100;
tolleranza = 10^-6;

D = diag(diag(A));
C = A - D;
D_inv = inv(D);
B = -D_inv*C;
q = D_inv*b;
k=0;

x= ones(3,1);

%calcolo del raggio spettrale per vedere se la matrice converge
autovB = eig(B); %troviamo gli autovalori
raggio_sp = norm(eig(B), 'inf'); %raggio spettrale
if raggio_sp > 1
    disp('non converge')
else
    %ciclo per trovare x
    while k < max_iterazioni && norm(b-A*x) > tolleranza
    x = B*x+q;
    k = k+1;
    end
    errore = norm([5 4 7]' - x);
    disp(errore);
    disp(x);
    disp(k);
end

