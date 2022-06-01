function x = sost_indietro (A,b)

[n,m] = size (A); %calcolo grandezza matrice

x(n) = b(n)/A(n,n);%passo base

for i = n-1:-1:1 %passi successivi

    x(i) = (b(i)-A(i,i+1:n)*(x(i+1:n))')/A(i,i);
    
end