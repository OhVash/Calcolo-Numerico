clc
close all
clear

A = [3 0 4; 7 4 2; -1 -1 2];
b = A * [5 4 7]'; %vettore 5 4 7 noto
x = ones(3, 1); %inizializzazione x per avere più efficienza

max_iterazioni = 100;
tolleranza = 10^-6;
count = 0;
while count<max_iterazioni && norm(b-A*x) > tolleranza
    x_old = x;
    for i=1:3
        sum = 0;
        for j=1:i-1
            sum = sum + A(i,j)*x(j);
        end
        for k = i+1:3
            sum = sum + A(i,k)*x_old(k);
        end
        x(i)= 1/A(i,i)*(b(i)-sum);
    end
    count = count+1;
end