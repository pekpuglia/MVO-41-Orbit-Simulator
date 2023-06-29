function a = sph_grav(params, X)
    a = internal_sph_grav(params.mu, X(1:3));
end

function a = internal_sph_grav(mu, rMm)
    a = mu * (-rMm) / norm(rMm)^3;
end