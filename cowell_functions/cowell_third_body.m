function a = third_body(params, X, t)
    a = internal_third_body(params.mu3, params.R3, params.w3, params.nu30, t, X);
end

function a = internal_third_body(mu3, R3, w3, nu30, t, X)
    nu3 = nu30 + w3 * t;
    pos = R3 * [
        cosd(nu3)
        sind(nu3)
        0];
    rrel = X(1:3) - pos;
    a = - mu3 * rrel / vecnorm(rrel)^3 + mu3 * (-pos) / vecnorm(pos)^3;
end