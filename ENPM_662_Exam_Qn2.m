%% Qn2 - Drilling a hole

% Reevaluate T and put the values in cm and radian as wrench F in qn has
% the units Ncm

syms  alpha d a theta 
syms theta1 theta2 theta3 theta5 theta6
syms l1 l2 l3 l4 l5 l6
syms d4    %to create symbolic variables

T =[ cos(theta6)*(cos(theta5)*(cos(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) + cos(theta2)*sin(theta1)*sin(theta5)) + sin(theta6)*(cos(theta1)*cos(theta3) - sin(theta1)*sin(theta2)*sin(theta3)), cos(theta6)*(cos(theta1)*cos(theta3) - sin(theta1)*sin(theta2)*sin(theta3)) - sin(theta6)*(cos(theta5)*(cos(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) + cos(theta2)*sin(theta1)*sin(theta5)), sin(theta5)*(cos(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) - cos(theta2)*cos(theta5)*sin(theta1), l6*cos(theta1)*sin(theta3)*sin(theta5) - l2*cos(theta2)*sin(theta1) - l3*cos(theta2)*sin(theta1) - l5*cos(theta2)*sin(theta1) - l6*cos(theta2)*cos(theta5)*sin(theta1) - d4*cos(theta2)*sin(theta1) + l6*cos(theta3)*sin(theta1)*sin(theta2)*sin(theta5);
 cos(theta6)*(cos(theta5)*(sin(theta1)*sin(theta3) - cos(theta1)*cos(theta3)*sin(theta2)) - cos(theta1)*cos(theta2)*sin(theta5)) + sin(theta6)*(cos(theta3)*sin(theta1) + cos(theta1)*sin(theta2)*sin(theta3)), cos(theta6)*(cos(theta3)*sin(theta1) + cos(theta1)*sin(theta2)*sin(theta3)) - sin(theta6)*(cos(theta5)*(sin(theta1)*sin(theta3) - cos(theta1)*cos(theta3)*sin(theta2)) - cos(theta1)*cos(theta2)*sin(theta5)), sin(theta5)*(sin(theta1)*sin(theta3) - cos(theta1)*cos(theta3)*sin(theta2)) + cos(theta1)*cos(theta2)*cos(theta5), d4*cos(theta1)*cos(theta2) + l2*cos(theta1)*cos(theta2) + l3*cos(theta1)*cos(theta2) + l5*cos(theta1)*cos(theta2) + l6*cos(theta1)*cos(theta2)*cos(theta5) + l6*sin(theta1)*sin(theta3)*sin(theta5) - l6*cos(theta1)*cos(theta3)*sin(theta2)*sin(theta5);
                                                                                           - cos(theta6)*(sin(theta2)*sin(theta5) - cos(theta2)*cos(theta3)*cos(theta5)) - cos(theta2)*sin(theta3)*sin(theta6),                                                                                             sin(theta6)*(sin(theta2)*sin(theta5) - cos(theta2)*cos(theta3)*cos(theta5)) - cos(theta2)*cos(theta6)*sin(theta3),                                                     cos(theta5)*sin(theta2) + cos(theta2)*cos(theta3)*sin(theta5),                                                                                                                                  l1 + l6*(cos(theta5)*sin(theta2) + cos(theta2)*cos(theta3)*sin(theta5)) + sin(theta2)*(d4 + l5) + sin(theta2)*(l2 + l3);
                                                                                                                                                                                                             0,                                                                                                                                                                                                             0,                                                                                                                 0,                                                                                                                                                                                                                                                        1]
 
% Put the values of link lengths
l1 = 4;
l2 =  4;
l3 = 4;
l4 =  4;
l5 =  4;
l6 = 4;

% We have the vector for joint variables as :-
%q1 = [45, 30, 0, 5, 60, 0];
% We write q1 in radians and degrees:-
theta1 = deg2rad(45);
theta2 = deg2rad(30);
theta3 = deg2rad(0);
d4 = 5;
theta5 = deg2rad(60);
theta6 = deg2rad(0);

% Homogeneous transform for q1 = [45, 30, 0, 5, 60, 0] (in deg and cm)
T_q1 = subs(T)



% Defining the Tde and Tdt maztrices.
T_d_e = [0 1 0 0; -1 0 0 -2; 0 0 1 -1; 0 0 0 1]; %T_d_e represents the end effector frame (e) expressed in the drill frame (d)
T_d_t = [1 0 0 0;0 1 0 2; 0 0 1 10; 0 0 0 1]; %T_d_t represent the tip frame (t) expressed in the drill frame (d)
T_e_d = inv(T_d_e)

H_0_tip = T_q1 * T_e_d * T_d_t % final homogeneous transform representing the position and orientation of the tool tip

%% Preloaded Ais are used along with given T_e_d and T_d_t to obtain the elements of the jacobian matrix

% We use subs for symbolic substitution 
% "simplify" is used for simplifying the representation of the equation
%Evaluate all different T's

T_0_1 = simplify(subs(A1));
T_0_2 = simplify(subs(A1*A2));
T_0_3 = simplify(subs(A1*A2*A3));
T_0_4 = simplify(subs(A1*A2*A3*A4));
T_0_5 = simplify(subs(A1*A2*A3*A4*A5));
T_0_6 = simplify(subs(A1*A2*A3*A4*A5*A6));

o0 = [0; 0; 0];             %defining o0 and z0
z0 = [0; 0; 1];
ZeroMatrix = [0; 0; 0];

z1 = T_0_1(1:3, 3);         %defining z1 and o1 from A1
o1 = T_0_1(1:3, 4);         

z2 = T_0_2(1:3, 3);         %defining z2 and o2 from A2
o2 = T_0_2(1:3, 4);         

z3 = T_0_3(1:3, 3);         %defining z3 from A3
o4 = T_0_4(1:3, 4);         %defining o4 from A4

z4 = T_0_4(1:3, 3);         %defining z3 from A3
o5 = T_0_5(1:3, 4);         %defining o4 from A4

z5 = T_0_5(1:3, 3);         %defining z3 from A3
o6 = T_0_6(1:3, 4);         %defining o4 from A4

%defining the Jacobian
J = [cross(z0,(o6-o0))  cross(z1,(o6-o1))  cross(z2,(o6-o2))  z3           cross(z4,(o6-o4))   cross(z5,(o6-o5))    ;
     z0                 z1                 z2                 ZeroMatrix   z4                  z5  ];
J = subs(J)
J_t = transpose(J);
F = [0; 0; 10; 132.3876; 132.3876; 0]; % Wrench F given in question

Torque = J_t * F            %to calculate the torque vector, ANSWER!!!