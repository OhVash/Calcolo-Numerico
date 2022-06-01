clear
clc
close all

%A = [3 0 4;7 4 2;-1 -1 -2];
%A=[-3 3 -6;-4 7 -8;5 7 -9];
%A=[4 1 1;2 -9 0;0 -8 -6];
A=[7 6 9;4 5 -4;-7 -3 8];
b = A * [5 4 7]';

x=zeros(3,1);
max_iter=1000;
iter=0;
toll = 10^-5;


%in forma matriciale
D=diag(diag(A));
E=tril(A,-1);
F=triu(A,1);

B=-inv(E+D)*F;
Q=inv(E+D)*b;

r_sp=norm(eig(B), "inf"); %raggio spettrale
if r_sp > 1
    disp ('non converge')

else
    while iter<max_iter && norm(b-A*x) > toll %criterio residuo
        %while iter<max_iter
        xo=x;
        x=B*x+Q;
    %     if norm(x-xo)<toll %criterio incremento
    %         break;
    %     end
        iter=iter+1;
    end

end

err = norm([5 4 7]' - x);
r_sp
iter
err

