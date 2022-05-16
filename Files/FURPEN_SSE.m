
% State space setup for pendulum 
% constants
Jp=.5;
Mp=6;
Lr=12;
Jr=.6;
Lp=15;
g=9.81;
Br=10;
Bp=15;
Kg=16;
kt=2;
km=3;
Rm=.3;
zeta = 0.7; %damping ratio
wn = 4;   %natural frequency - [rads/s]

A = eye(4,4);
B = [0;0;0;1];
C = eye(2,4);
D = zeros(2,1);

Jt=Jp*Mp*Lr^2+Jr*Jp+(1/4)*Jr*Mp*Lp^2;
A=[0 0 1 0;0 0 0 1;0 (1/(4*Jt))*Mp^2*Lp^2*Lr*g (-1/Jt)*Br*(Jp+1/4*Mp*Lp^2) (-1/(2*Jt))*Bp*Mp*Lp*Lr;0 .5*Mp*Lp*g*(Jr+Mp*Lr^2)/Jt (1/(2*Jt))*Mp*Lp*Lr*Br (-1/Jt)*Bp*(Jr+Mp*Lp^2)];
B=[0;0;(1/Jt)*(Jp+.25*Mp*Lp^2);(1/(2*Jt))*Mp*Lp*Lr];
C=eye(2,4);
D=zeros(2,1);
% Actuator Dynamics
B=Kg*kt*B/Rm;
A(3,3)=A(3,3)-Kg^2*kt*km/Rm*B(3);
A(4,3)=A(4,4)-Kg^2*kt*km/Rm*B(4);

%names
states = {'x1','x2','x3','x4'};
inputs = {'V_m'};
outputs = {'theta','alpha'};


sigma = zeta .* wn
wd = wn * (sqrt(1 - (zeta.^2)))

poles = eig(A)


p1 = complex(-sigma,wd);    
p2 = complex(-sigma,-wd); 
p3 = -sigma*10
p4 = -5.9473
%%Furuta_ss = ss(A,B,C,D,'Statename', states,'InputName',inputs,'OutputName',outputs) % Open loop system model