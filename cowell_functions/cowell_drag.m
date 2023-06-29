function akms2 = cowell_drag(params, X, t)
    h = vecnorm(X(1:3)) - params.Re;
    rhokgm3 = atmosphere(h);
    v_air = cross([0;0;params.omega_earth], X(1:3)); %km/s
    v_rel = X(4:6) - v_air; %km/s
    akms2 = internal_drag(params.Am2*1e-6, params.Cd, rhokgm3*1e9, v_rel, params.Msat);
end

function a = internal_drag(A, Cd, rho, v, Msat)
    a = -0.5 * A * Cd * rho * vecnorm(v) * v / Msat;
end