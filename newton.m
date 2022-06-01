function [approx, num_iter] = newton(x0, fun, dfun, toll, max_iter)
%algoritmo di Newton
x = x0;
approx = [x];
num_iter = 0;
crit_arr = 1;

while(num_iter < max_iter && crit_arr > toll)
    num_iter = num_iter + 1;
    x_next = x - (fun(x)/dfun(x));
    approx = [approx; x_next];
    %crit_arr = abs(x_next - x); %criterio incremento
    crit_arr = abs(fun(x_next)); %criterio residuo
    x = x_next;
end
