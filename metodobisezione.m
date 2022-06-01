%calcolo di radici attraverso il metodo
%di bisezione
clear
clc
close all

tolleranza=10^-5;
a=0;
b=1.5;

err=1;

i=1;

while err>tolleranza
    x=(a+b)/2;
    if (cos(2*a)^2-a^2)*(cos(2*x)^2-x^2)<0
        b=x;
    elseif (cos(2*a)^2-a^2)*(cos(2*x)^2-x^2)==0
        disp('x è radice');
        return;
    else
        a=x;
    end
    err=abs(b-a);
    e(i)=err;
    i=i+1;
end

%calcolo di radici attraverso il metodo
%di bisezione
clear
clc
close all

tolleranza=10^-5;
a=0;
b=1.5;

err=1;

i=1;

while err>tolleranza
    x=(a+b)/2;
    if (cos(2*a)^2-a^2)*(cos(2*x)^2-x^2)<0
        b=x;
    elseif (cos(2*a)^2-a^2)*(cos(2*x)^2-x^2)==0
        disp('x � radice');
        return;
    else
        a=x;
    end
    err=abs(b-a);
    e(i)=err;
    i=i+1;
end
semilogy(e);

