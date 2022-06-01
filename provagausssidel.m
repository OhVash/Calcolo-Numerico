clear
close all
clc

A=[7 6 9;4 5 -4;-7 -3 8];
x0 = [5 4 7]'; %x0 assegnato
b = A*x0; 

D = diag(diag(A));
E = tril(A, -1);
F = triu(A, 1);

EDinv = inv(E+D);
Bgs = -(EDinv)*F;
qgs = EDinv*b;

x = zeros(3,1);

iterazioni = 1000;
toll = 10^-5;
count = 0;
%autovalori e raggio spettrale
r_sp=norm(eig(Bgs), "inf"); %raggio spettrale
if r_sp > 1
    disp ('non converge')

else
    while count<iterazioni && norm(b-A*x) > toll %criterio residuo
        %while iter<max_iter
        xo=x;
        x=Bgs*x+qgs;
    %     if norm(x-xo)<toll %criterio incremento
    %         break;
    %     end
        count=count+1;
    end

end

err = norm([5 4 7]' - x);
r_sp
count
err


