function [t, data] = gauss(a0, e0, i0, RA0, w0, TA0, mu, P, tmax, accs, params)
    options = odeset( ...
        'RelTol',1e-13, ...
        'AbsTol',1e-13, ...
        'InitialStep',P/1000);
    [t, data] = ode89(@(t, X) Xdot(t, X, mu, accs, params), ...
        [0 tmax], [a0, e0, i0, RA0, w0, TA0], options);
end

function Xdot = Xdot(t, X, mu, accs, params)
    a = X(1);
    e = X(2);
    i = X(3);
    RA = X(4);
    w = X(5);
    TA = X(6);

    [r_vec, v_vec] = rv_from_orb_elems(a, e, i, RA, w, TA, mu);

    %acc ECI
    acc = [0;0;0];
    for i = 1:length(accs)
        acc = acc + accs{i}(params{i}, [r_vec;v_vec]);
    end

   u = w + TA;

   Qxr = [ -sind(RA)*cosd(i)*sind(u)+cosd(RA)*cosd(u) cosd(RA)*cosd(i)*sind(u)+sind(RA)*cosd(u) sind(i)*sind(u);
            -sind(RA)*cosd(i)*cosd(u)-cosd(RA)*sind(u) cosd(RA)*cosd(i)*cosd(u)-sind(RA)*sind(u) sind(i)*cosd(u);
            sind(RA)*sind(i) -cosd(RA)*sind(i) cosd(i)];

    r = vecnorm(r_vec);
    h = vecnorm(cross(r_vec, v_vec));

    accRSW = Qxr * acc;

    R = accRSW(1); S = accRSW(2); W = accRSW(3);
    adot = 2*sqrt(a^3 / (mu * (1 - e^2))) * (e*R*sind(TA) + S*(1 + e*cosd(TA)));
    edot = (h/mu) * sind(TA)*R + (1/(mu*h)) * ((h^2+mu*r)*cosd(TA)+mu*e*r)*S;
    idot = (180/pi) * r*cosd(u) * W/h;
    RAdot = (180/pi)*r*sind(u)*W/(h*sind(i));
    wdot = (180/pi) * (((-1/(e*h))*((h^2*cosd(TA)*R/mu) - ((r+(h^2/mu))*sind(TA)*S))) - r*sind(u)*W/(h*tand(i)));  
    TAdot = (180/pi) * ((h/r^2) + (1/(e*h))*(h^2*cosd(TA)*R/mu - ((h^2/mu)+r)*sind(TA)*S));

    Xdot = [
        adot
        edot
        idot
        RAdot
        wdot
        TAdot
        ];
end