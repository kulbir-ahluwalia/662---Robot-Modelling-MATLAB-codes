%Submitted by Kulbir Singh Ahluwalia, SID: 116836050
%Matlab code to compute the joint torques required to produce an end effector wrench [1; 0; 0; 0; 0; 0]
%defining symbolic variables
syms  alpha d a theta 
syms theta1 theta2 theta3
syms l1 l2 l3 l4 
syms z0 z1 z2 z3
syms o0 o1 o2 o4      

%We already have the values of A1, A2, A3 and A4 from Exam 1
A1 = [ -sin(theta1), -(3^(1/2)*cos(theta1))/2, cos(theta1)/2, 0;
        cos(theta1), -(3^(1/2)*sin(theta1))/2, sin(theta1)/2, 0;
        0, 1/2, 3^(1/2)/2, l1;
        0, 0, 0, 1];

A2 = [ -sin(theta2), 0, cos(theta2), 0;
       cos(theta2), 0, sin(theta2), 0;
       0, 1, 0, l2;
       0, 0, 0, 1];

A3 = [ cos(theta3 + pi/3), 0, -sin(theta3 + pi/3), 0;
       sin(theta3 + pi/3), 0, cos(theta3 + pi/3), 0;
       0, -1, 0, 0;
       0, 0, 0, 1];

A4 = [ 1, 0, 0, 0;
       0, 1, 0, 0;
       0, 0, 1, l3 + l4;
       0, 0, 0, 1];

% We use subs for symbolic substitution 
% "simplify" is used for simplifying the representation of the equation
%Evaluate all different T's

T_0_1 = simplify(subs(A1));
T_0_2 = simplify(subs(A1*A2));
T_0_3 = simplify(subs(A1*A2*A3));
T_0_n = simplify(subs(A1*A2*A3*A4));

theta1 = deg2rad(150);      %define control variables
theta2 = deg2rad(45);
theta3 = deg2rad(30);
l4 = 2;

l1 = 1.5;                   %define fixed values
l2 = 1;
l3 = 0.5;

o0 = [0; 0; 0];             %defining o0 and z0
z0 = [0; 0; 1];
ZeroMatrix = [0; 0; 0];

z1 = T_0_1(1:3, 3);         %defining z1 and o1 from A1
o1 = T_0_1(1:3, 4);         

z2 = T_0_2(1:3, 3);         %defining z2 and o2 from A2
o2 = T_0_2(1:3, 4);         

z3 = T_0_3(1:3, 3);         %defining z3 from A3
o4 = T_0_n(1:3, 4);         %defining o4 from A4

%defining the Jacobian
J = [cross(z0,(o4-o0))  cross(z1,(o4-o1))  cross(z2,(o4-o2))  z3        ;
     z0                 z1                 z2                 ZeroMatrix];

J_t = transpose(J);
F = [1; 0; 0; 0; 0; 0];

Torque = J_t * F ;           %to calculate the torque vector

theta1 = deg2rad(150);      %define the control variable values
theta2 = deg2rad(45);
theta3 = deg2rad(30);
l4 = 2;

l1 = 1.5;                    %define the fixed values
l2 = 1;
l3 = 0.5;

J_decimal_values = simplify(subs(vpa(J)))   %vpa is used to convert to decimal values
Torque = simplify(subs(Torque));
Torque_decimal_values = vpa(Torque)

Round_off_till = 3;        %set the number of decimal places till which you want to round off
f = 10.^Round_off_till;    % .^ is used for element wise power
%In this case, first we multiply by 1000 and then round off to nearest decimal, then
%finally divide by 1000 to get the required answer
Torque_decimal_values_rounded = round(f*Torque_decimal_values)/f ; 
Torque_decimal_values_rounded = vpa(Torque_decimal_values_rounded)
