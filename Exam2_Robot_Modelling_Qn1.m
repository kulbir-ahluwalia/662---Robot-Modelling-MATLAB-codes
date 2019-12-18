%the code is run for finding every Ai matrix after making the necessary changes to theta, a ,d and alpha
%A1, A2, A3... are stored in the workspace as we find each Ai
%then in the end, we just find the final T by multiplying all Ai

syms  alpha d a theta 
syms theta1 theta2 theta3 theta5 theta6
syms l1 l2 l3 l4 l5 l6
syms d4    %to create symbolic variables

rot_z = [cos(theta) -sin(theta) 0 0; sin(theta) cos(theta) 0 0; 0 0 1 0; 0 0 0 1];      %Initialising homogeneous transforms
trans_z = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
trans_x = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
rot_x = [1 0 0 0; 0 cos(alpha) -sin(alpha) 0; 0 sin(alpha) cos(alpha) 0; 0 0 0 1];
final = (rot_z*trans_z*trans_x*rot_x);

%theta = theta1;   
theta_i = 0;
theta_angle_rad = deg2rad(theta_i);
theta =  theta6 + theta_angle_rad;

d = l6;
a = 0;

alpha = 0;
alpha = deg2rad(alpha);

final = subs(final); %updates values of variables
A6 = simplify(final);
disp(A6);

% A1  %to see the final values of Ai matrices
% A2
% A3
% A4
% A5
% A6
% 
% The matrices that we got are stored as comments
% 
% A1 =
%
% [ -sin(theta1), 0, cos(theta1),  0]
% [  cos(theta1), 0, sin(theta1),  0]
% [            0, 1,           0, l1]
% [            0, 0,           0,  1]
%  
%  
% A2 =
%  
% [ -sin(theta2), 0, cos(theta2), 0]
% [  cos(theta2), 0, sin(theta2), 0]
% [            0, 1,           0, 0]
% [            0, 0,           0, 1]
%  
%  
% A3 =
%  
% [ -sin(theta3), -cos(theta3), 0,  l4*sin(theta3)]
% [  cos(theta3), -sin(theta3), 0, -l4*cos(theta3)]
% [            0,            0, 1,         l2 + l3]
% [            0,            0, 0,               1]
%  
%  
% A4 =
%  
% [  0,  0, 1,       0]
% [ -1,  0, 0,       0]
% [  0, -1, 0, d4 + l5]
% [  0,  0, 0,       1]
%  
%  
% A5 =
%  
% [ cos(theta5), 0,  sin(theta5),  0]
% [ sin(theta5), 0, -cos(theta5),  0]
% [           0, 1,            0, l4]
% [           0, 0,            0,  1]
%  
%  
% A6 =
%  
% [ cos(theta6), -sin(theta6), 0,  0]
% [ sin(theta6),  cos(theta6), 0,  0]
% [           0,            0, 1, l6]
% [           0,            0, 0,  1]
% 


T = simplify(A1*A2*A3*A4*A5*A6)






