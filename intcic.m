clear
close all
clc

f= @(x) x - sqrt(2);
a = 10;
b = 20;
interval = linspace(a,b, 3);
H = (b-a)/2;

val_trapz = trapz(interval, f(interval));
for i = 1:length(interval)-1
val = H/2 * (f(interval(1)+f(interval(end)))+2*sum(f(interval(i))));
cavs = H/6 * (f(interval(1))+2*sum(f(i)) + 4*sum((f(interval(i)+interval(i+1))/2)+f(interval(end))));
end