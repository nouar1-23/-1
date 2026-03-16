function[A1]=matre_x()



main_diag = -1 : -0.1 : -1.9;

upper_diag1 = 10* ones(1, 9);
upper_diag2 = 50 * ones(1, 9);
D1 = diag(main_diag) + diag(upper_diag1, 1);
D2 = diag(main_diag) + diag(upper_diag2, 1);

L_main = ones(1, 10);

L1_sub = -1 * ones(1, 9);

L1 = diag(L_main) + diag(L1_sub, -1);
in_v_L1=inv(L1);


A1 = L1 * D1 * in_v_L1;
A2 = L1 * D2 * in_v_L1;
