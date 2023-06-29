function a = j2(params, X)
    a = internal_j2(X(1:3), params.J2, params.mu, params.Re);
end

function a = internal_j2(r, J2, mu, Re)
    r_norm = vecnorm(r);
    a = 3/2*J2*mu*Re^2/r_norm^4 * ...
    r / r_norm .* (5*(r(3)/r_norm)^2 - [1;1;3]);
end