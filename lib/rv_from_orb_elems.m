function [r, v] = rv_from_orb_elems(a, e, i, Omega, omega, ni, mu)
    p = a*(1-e^2);
    
    r_perifocal = p / (1+e*cosd(ni)) * [
        cosd(ni)
        sind(ni)
        0];
    
    v_perifocal = sqrt(mu/p) * [
        [
        cosd(ni) -sind(ni)
        sind(ni) cosd(ni)] * [e*sind(ni);1+e*cosd(ni)]
        0
    ];

    perifocal_equatorial = rotz(-omega) * rotx(-i) * rotz(-Omega);
    r = perifocal_equatorial \ r_perifocal;
    v = perifocal_equatorial \ v_perifocal;
end