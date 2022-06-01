clear 
close
clc

A = [3 0 4; 7 4 2; -1 -1 2];
b = A * [5 4 7]'; %vettore 5 4 7 noto

x = ones(3, 1); %inizializzazione x per avere più efficienza
x0 = ones(3, 1);
max_iterazioni = 100;
tolleranza = 10^-6;

count = 0;

k=0;
while k < max_iterazioni && norm(b-A*x) > tolleranza
    for k = 1:max_iterazioni
     for i = 1:3
         s=A(i,:)*x0(:)- A(i,i)*x0(i);
         %s = sum(A(i,:)*x0(:)) - A(i,i)*x0(i) %somma è inutile
         x(i,1)=(b(i)-s)/A(i,i);
     end
     x0=x;
     if(norm(b-A*x) < tolleranza)
         break
     end
     count=count+1
    end
end

disp (x);
disp ('Iterazioni fatte: ')
disp (count);

errore = norm([5 4 7]' - x);


