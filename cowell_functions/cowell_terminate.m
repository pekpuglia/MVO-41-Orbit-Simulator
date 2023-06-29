%https://www.mathworks.com/matlabcentral/answers/282449-how-to-stop-ode45-when-one-of-states-reach-certain-value
function [value, isterminal, direction] = terminate(t, X, Re, enable)
    if enable
        value = (vecnorm(X(1:3)) - Re <= 100);
    else
        value = 0;
    end
    isterminal = 1;
    direction = 0;
end