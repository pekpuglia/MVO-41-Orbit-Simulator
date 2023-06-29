function plot_cowell(name, t, data, Re, mu)
%     figure
%     plot(vecnorm(data(:, 1:3)'))
% 
%     colors = t;
%     figure
%     colormap(hsv)
%     [Xs, Ys, Zs] = sphere;
%     surf(Re*Xs, Re*Ys, Re*Zs, 'FaceColor','blue', 'FaceAlpha', 0)
%     hold on
%     %https://www.mathworks.com/matlabcentral/answers/254696-how-to-assign-gradual-color-to-a-3d-line-based-on-values-of-another-vector
%     patch([data(:,1); nan], [data(:,2); nan], [data(:,3); nan], [colors;nan], 'FaceColor', 'none', 'EdgeColor', 'interp', 'LineWidth', 3)
%     axis equal

    Omega = [];
    i = [];
    omega = [];
    nu = [];
    a = [];
    e = [];

    for j = 1:length(t)
        [Omega(j), i(j), omega(j), nu(j), a(j), e(j)] = orb_elems_from_rv(data(j,1:3), data(j,4:6), mu);
    end

    figure
    subplot(5, 1, 1)
    plot(t, Omega)                                              
    title("Right Ascension (degrees)")
    subplot(5, 1, 2)
    plot(t, omega)
    title("Argument of perigee (degrees)")
    subplot(5, 1, 3)
    plot(t, a)
    title("Semimajor Axis (m)")
    subplot(5, 1, 4)
    plot(t, e)
    title("Eccentricity")
    subplot(5, 1, 5)
    plot(t, i)
    title("Inclination (degrees)")
    saveas(gcf, "cowell" + name + "_orb_elems", "png")

    ra = a .* (1+e);
    rp = a .* (1-e);
    figure
    plot(t, ra, 'DisplayName',"Apogee")
    hold on
    plot(t, rp, 'DisplayName',"Perigee")
    saveas(gcf, "cowell" + name + "apo_peri", "png")
end