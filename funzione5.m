function [det1, cond1] = funzione5 (n);
%n = dimensione della matrice - input
%det = determinante della matrice -output
%cond = condizionamento della matrice -output

for i = 1:n
    A(i, n-i+1) = 2;
    if i~=n
        A(i,n-i)=-1;
    end
    if i~=1
        A(i,n-i+2)=-1;
    end
end
%disp (A);
det1 = det(A);
cond1 = cond(A);