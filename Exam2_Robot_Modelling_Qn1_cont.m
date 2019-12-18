syms  alpha d a theta 
syms theta1 theta2 theta3 theta5 theta6
syms l1 l2 l3 l4 l5 l6
syms d4    %to create symbolic variables

% We have Ais and T from previous MATLAB code

% The matrices that we got are:-

A1 = [ -sin(theta1), 0, cos(theta1),  0;
  cos(theta1), 0, sin(theta1),  0;
            0, 1,           0, l1;
            0, 0,           0,  1];
 
 
A2 = [ -sin(theta2), 0, cos(theta2), 0;
  cos(theta2), 0, sin(theta2), 0;
            0, 1,           0, 0;
            0, 0,           0, 1];
 
 
A3 = [ -sin(theta3), -cos(theta3), 0,  l4*sin(theta3);
 cos(theta3), -sin(theta3), 0, -l4*cos(theta3);
            0,            0, 1,         l2 + l3;
            0,            0, 0,               1];
 
 
A4 = [  0,  0, 1,       0;
 -1,  0, 0,       0;
  0, -1, 0, d4 + l5;
  0,  0, 0,       1];
 
 
A5 =[ cos(theta5), 0,  sin(theta5),  0;
 sin(theta5), 0, -cos(theta5),  0;
           0, 1,            0, l4;
           0, 0,            0,  1];
 
 
A6 = [ cos(theta6), -sin(theta6), 0,  0;
 sin(theta6),  cos(theta6), 0,  0;
           0,            0, 1, l6;
           0,            0, 0,  1];

% A1  %to see the final values of Ai matrices
% A2
% A3
% A4
% A5
% A6

%%
T =[ cos(theta6)*(cos(theta5)*(cos(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) + cos(theta2)*sin(theta1)*sin(theta5)) + sin(theta6)*(cos(theta1)*cos(theta3) - sin(theta1)*sin(theta2)*sin(theta3)), cos(theta6)*(cos(theta1)*cos(theta3) - sin(theta1)*sin(theta2)*sin(theta3)) - sin(theta6)*(cos(theta5)*(cos(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) + cos(theta2)*sin(theta1)*sin(theta5)), sin(theta5)*(cos(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) - cos(theta2)*cos(theta5)*sin(theta1), l6*cos(theta1)*sin(theta3)*sin(theta5) - l2*cos(theta2)*sin(theta1) - l3*cos(theta2)*sin(theta1) - l5*cos(theta2)*sin(theta1) - l6*cos(theta2)*cos(theta5)*sin(theta1) - d4*cos(theta2)*sin(theta1) + l6*cos(theta3)*sin(theta1)*sin(theta2)*sin(theta5);
 cos(theta6)*(cos(theta5)*(sin(theta1)*sin(theta3) - cos(theta1)*cos(theta3)*sin(theta2)) - cos(theta1)*cos(theta2)*sin(theta5)) + sin(theta6)*(cos(theta3)*sin(theta1) + cos(theta1)*sin(theta2)*sin(theta3)), cos(theta6)*(cos(theta3)*sin(theta1) + cos(theta1)*sin(theta2)*sin(theta3)) - sin(theta6)*(cos(theta5)*(sin(theta1)*sin(theta3) - cos(theta1)*cos(theta3)*sin(theta2)) - cos(theta1)*cos(theta2)*sin(theta5)), sin(theta5)*(sin(theta1)*sin(theta3) - cos(theta1)*cos(theta3)*sin(theta2)) + cos(theta1)*cos(theta2)*cos(theta5), d4*cos(theta1)*cos(theta2) + l2*cos(theta1)*cos(theta2) + l3*cos(theta1)*cos(theta2) + l5*cos(theta1)*cos(theta2) + l6*cos(theta1)*cos(theta2)*cos(theta5) + l6*sin(theta1)*sin(theta3)*sin(theta5) - l6*cos(theta1)*cos(theta3)*sin(theta2)*sin(theta5);
                                                                                           - cos(theta6)*(sin(theta2)*sin(theta5) - cos(theta2)*cos(theta3)*cos(theta5)) - cos(theta2)*sin(theta3)*sin(theta6),                                                                                             sin(theta6)*(sin(theta2)*sin(theta5) - cos(theta2)*cos(theta3)*cos(theta5)) - cos(theta2)*cos(theta6)*sin(theta3),                                                     cos(theta5)*sin(theta2) + cos(theta2)*cos(theta3)*sin(theta5),                                                                                                                                  l1 + l6*(cos(theta5)*sin(theta2) + cos(theta2)*cos(theta3)*sin(theta5)) + sin(theta2)*(d4 + l5) + sin(theta2)*(l2 + l3);
                                                                                                                                                                                                             0,                                                                                                                                                                                                             0,                                                                                                                 0,                                                                                                                                                                                                                                                        1]
 
% Put the values of link lengths
l1 = 0.04;
l2 =  0.04;
l3 =  0.04;
l4 =  0.04;
l5 =  0.04;
l6 = 0.04;

% We have the vector for joint variables as :-
%q1 = [45, 30, 0, 5, 60, 0];
% We write q1 in radians and degrees:-
theta1 = deg2rad(45);
theta2 = deg2rad(30);
theta3 = deg2rad(0);
d4 = 0.05;
theta5 = deg2rad(60);
theta6 = deg2rad(0);

% Homogeneous transform for q1 = [45, 30, 0, 5, 60, 0] (in deg and cm)
T_q1 = subs(T)

% We get the T as:-
% T =[     0.7071, 0.7071, -1.6653e-16, -0.1041;
%     -0.7071, 0.7071,  1.1102e-16,  0.1041;
%  2.2204e-16,      0,           1,  0.1650;
%           0,      0,           0,       1]

%%
% Write the general equation for Rotation about z as:-
% For the rotations, 
theta10 = deg2rad(30);
theta11 = deg2rad(45);
theta12 = deg2rad(60);
rot_z1 = [cos(theta10) -sin(theta10) 0 0; sin(theta10) cos(theta10) 0 0; 0 0 1 0; 0 0 0 1];     
rot_y1 = [cos(theta11) 0 sin(theta11) 0; 0 1 0 0; -sin(theta11) 0 cos(theta11) 0;  0 0 0 1];
rot_z2 = [cos(theta12) -sin(theta12) 0 0; sin(theta12) cos(theta12) 0 0; 0 0 1 0; 0 0 0 1];   

Final_homogeneous_after_rotation = rot_z1*rot_y1*rot_z2;

x=0.01; y=0.02; z=0.03; %in meters
trans_all = [1 0 0 x; 0 1 0 y; 0 0 1 z; 0 0 0 1];

% End effector homogeneous transform after rotation ZYZ and translation:-
desired_H = T_q1*trans_all*Final_homogeneous_after_rotation

% Desired H was obtained as:-
% desired_H =[  0.5657, -0.4621,  0.6830, -0.0872;
%   0.7450,  0.6415, -0.1830,  0.1189;
%  -0.3536,  0.6124,  0.7071,  0.1949;
%  0,       0,       0,       1]

% Now we have to compare desired_H and T to get the angles and the
% translation for the prismatic joint 

% So there are 16 equations and 6 unknowns.



















