addpath("lib/")
%% Initial conditions
rp0 = 150000;
ra0 = 250000;
Omega0 = 340;
i0 = 10.1;
omega0 = 58;
nu0 = 332;
a0 = (rp0 + ra0)/2;
e0 = (ra0-rp0) / (ra0+rp0);

%% Earth Constants
Re = 6378;
mu = 398600;
%% Sanity checks
energy = -mu/(2*a0)
P = 2*pi*sqrt(a0^3/mu)
%% Spherical gravity parameters
grav_p.mu = mu;
%% Drag parameters
drag_p.Cd = 2.2;
drag_p.omega_earth = 72.9211e-6; %rad/s
drag_p.Am2 = pi/4; %m^2
drag_p.Re = Re; %km
drag_p.Msat = 100; %kg
%% Third body parameters
moon_p.mu3 = 4905;
moon_p.R3 = 384400;
moon_p.w3 = 360/(28*24*3600);
moon_p.nu30 = 0;

%% Non-spherical Earth parameters
j2_p.J2 = 0.001082;
j2_p.mu = mu;
j2_p.Re = Re;
%% Solução por Cowell do caso com arrasto
addpath("cowell_functions/")
addpath("gauss_functions/")
%%
[x0, v0] = rv_from_orb_elems(a0, e0, i0, Omega0, omega0, nu0, mu);
[t, data] = cowell(x0, v0, P, 100*P, ...
    @(t, X) cowell_terminate(t, X, Re, true), ...
    {@cowell_sph_grav, @cowell_third_body, @cowell_j2}, ...
    {grav_p,    moon_p, j2_p});
%%
plots("testecowell", t, data, Re, mu)
%%
[t, data] = gauss(a0, e0, i0, Omega0, omega0, nu0, mu, P, P, ...
    {@cowell_drag}, ...
    {drag_p});
%%
gauss_plots(t, data, mu)