function theta = angle_0_360(v1, v2, reference_direction)
    v1 = v1/vecnorm(v1);
    v2 = v2/vecnorm(v2);

    cos_theta = dot(v1, v2);
    sin_theta = sign(dot(cross(v1,v2), reference_direction)) * norm(cross(v1, v2));

    atg = atan2d(sin_theta, cos_theta);
    if atg < 0
        theta = atg + 360;
    else
        theta = atg;
    end
end