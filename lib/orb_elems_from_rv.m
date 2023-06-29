function [Omega, i, omega, nu, a, e] = orb_elems_from_rv(r, v, mu)
    h = cross(r, v);
    B = cross(v, h) - mu * r / vecnorm(r);
    N = cross([0;0;1], h);
    
    Omega = angle_0_360([1;0;0], N, [0;0;1]);
    i = acosd(h(3)/vecnorm(h));
    omega = acosd(dot(N, B)/(vecnorm(N)*vecnorm(B)));
    nu = angle_0_360(B, r, [0;0;1]);
    a = -mu / (2*(dot(v, v)/2 - mu/vecnorm(r)));
    e = vecnorm(B/mu);
end