function [] = roo()
 [A]=matre_x();
 size(A)
 eig(A)
[m, lam_re, lam_im] = ro(A);
save('MyMatrices.mat', 'm', 'lam_re', 'lam_im');
% load('MyMatrices.mat');
    % Уровни для контурного графика
    levels1 = [0:14];
    levels2 = [-2:2:15];
    levels3 = [1,1];
    % 3D график
    figure;
    mesh(lam_re, lam_im, log10(m));
xlabel('Re(\lambda)');
    ylabel('Im(\lambda)');
    zlabel('log_{10}||(A-\lambda I)^{-1}||');
    zlim([0, 20]);
    zticks(0:3:20);
    set(gca, 'ZColor', [1 0 0]);
    set(gca, 'FontSize', 25);

    % Контурный график
    figure;
    % Здесь представляется график спектральных портретов сверху, при этом уточняются окрестности собственных значений.
    gh =14;
    [CS, h] = contour(lam_re, lam_im, log10(m), levels1);
    % Здесь на контур добавляются значения нормы резольвенты.
    clabel(CS, h, levels2(levels2 <= gh), 'FontSize', 25, 'Color', 'k');
% Здесь строится красная линия, показанная на рисунках c и d, которая представляет нормы резольвенты, равную единице
    hold on;
    [CS, h] = contour(lam_re, lam_im, log10(m), levels3, 'r', 'LineWidth', 2);
    clabel(CS, h, levels2(levels2 <= gh), 'FontSize', 25, 'Color', 'k');

    xlabel('Re \lambda');
    ylabel('Im\lambda');
%    set(gca, 'FontWeight', 'bold');
    set(gca, 'FontSize',25);
