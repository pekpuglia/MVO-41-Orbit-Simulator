function [t, data] = cowell(r0, v0, P, tmax, terminate_fn, accs, params)
    options = odeset( ...
        'RelTol',1e-13, ...
        'AbsTol',1e-13, ...
        'InitialStep',P/1000, ...
        'Events', terminate_fn);
    [t, data] = ode89(@(t, X) Xdot(t, X, accs, params), ...
        [0 tmax], [r0;v0], options);
end

function Xdot = Xdot(t, X, accs, params)
    acc = [0;0;0];
    for i = 1:length(accs)
        acc = acc + accs{i}(params{i}, X);
    end
    Xdot = [
        X(4:6)
        acc
        ];
end