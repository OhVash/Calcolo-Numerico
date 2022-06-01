%% METODO SOSTITUZIONE IN AVANTI 
function x = sost_avanti(A, b)

[n,m] = size (A); %calcolo grandezza matrice

x(1) = b(1)/A(1,1); %passo base

for i = 2:n %passi successivi

    x(i) = (b(i)-A(i,1:i-1)*x(1:i-1))'/A(i,i);
    
end

