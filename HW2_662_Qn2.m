%the code is run for finding every Ai matrix after making the necessary changes to theta, a ,d and alpha
%A1, A2, A3... are stored in the workspace as we find each Ai
%then in the end, we just find the final T by multiplying all Ai
%In qn 2, I just used B instead of A so that Ai were also preserved in the workspace along with Bi
syms  alpha d a theta theta1 theta2 theta3 l1 l2 l3 l4 d4 d1 d2 d3    %to create symbolic variables

rot_z = [cos(theta) -sin(theta) 0 0; sin(theta) cos(theta) 0 0; 0 0 1 0; 0 0 0 1];      %Initialising homogeneous transforms
trans_z = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
trans_x = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
rot_x = [1 0 0 0; 0 cos(alpha) -sin(alpha) 0; 0 sin(alpha) cos(alpha) 0; 0 0 0 1];
final = (rot_z*trans_z*trans_x*rot_x);

%theta = theta2;
theta = 0;
theta = deg2rad(theta);

d = d3;
a = 0;

alpha = 0;
alpha = deg2rad(alpha);

final = subs(final); %updates values of variables
A3 = final;

disp(A3); %to verify result

%T = (A1*A2*A3*A4*A5) %this is much longer, so we need to simplify
T = simplify(A1*A2*A3)
%T = simplify(B1*B2*B3*A1)

