clc                     %to clear command window,      %%%%%%Code by Kulbir Singh Ahluwalia, SID 116836050, UMD
clear all               %#ok<CLALL> %to clear workspace
syms theta alpha d a    %to create symbolic variables

rot_z = [cos(theta) -sin(theta) 0 0; sin(theta) cos(theta) 0 0; 0 0 1 0; 0 0 0 1];      %Initialising homogeneous transforms
trans_z = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
trans_x = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
rot_x = [1 0 0 0; 0 cos(alpha) -sin(alpha) 0; 0 sin(alpha) cos(alpha) 0; 0 0 0 1];

master_cell = {rot_z trans_z trans_x rot_x}; %storing matrices in a cell
names = ["rot_z_theta","trans_z_d","trans_x_a","rot_x_alpha"]; 
%to store the names of the matrices in order, used later to print the different orders of matrices that produce desired H
                                                               

P = perms([1 2 3 4]);                            %or perms([1:4]), for all possible permutations of 4 elements in a vector
desired_H = rot_z * trans_z * trans_x * rot_x   %#ok<NOPTS> %desired homogeneous transformation H
count = 0;                                      %to count the number of matrice orders that multiply to reproduce the original H

fprintf('The following permutations of matrices multiply to reproduce the original H: -\n');
for i = 1:1:24
    Prod = master_cell{P(i,1)} * master_cell{P(i,2)} * master_cell{P(i,3)} * master_cell{P(i,4)};   
    %to find out the product of different orders of matrices
    if Prod == desired_H
        count = count + 1; %to know how many permutations produce the desired H       
        fprintf('H = %s * %s * %s * %s\n',names{P(i,1)},names{P(i,2)},names{P(i,3)},names{P(i,4)});  
        %to print the order of matrices that produces the desired H      
        %Prod; %to check the product just in case
    end
end
fprintf('There are %d ways to multiply these matrices to reproduce the original H', count);