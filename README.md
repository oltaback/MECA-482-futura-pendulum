# MECA-482-furuta-pendulum
Oliver Taback, Marek Codron, Jacob Rivett, Jose, 2022 Spring, MECA 482


# Table of Contents
  1. Introduction
  2. Control_System_Design
  3. Math_Modeling
  4. Simulations
  5. Presentation
  6. Refrence List 

# 1. Introduction 
The Furuta Pendulum consists of a driven arm rotating horizontally, and a pendulum attached to the arm that operates freely in the vertically. The mechanism is designed to be unconstrained pneumatically, and nonlinear due to centrifugal and gravitational forces on the coupler allowing a variety of different movements to occur. This project will examine creating a test platform in a control system, that will in turn, efficiently test this model fluidly, and at a low cost. The deliverable sand desgin requirements for this project are stated below.

The goal of this project is to produce a control system that will balance the pendulumarm in the upright position during the testing phase. A motor placed on the base piece of the pendulum possesses the ability to direct movement. Keeping these variables in consideration, the control system will essentially force the vertical pendulum arm to balance. 

Deliverables: 
  - Mathematical Model of system designed in MATLAB
  - Operational and logical diagrams of the control system
  - Control system via MATLAB that states the code designed to meet all requirements of the mathematical model 
  - Open designed control system to link to Coppelia Simu via MATLAB program

Project contains:
  - Matlab Software: responsible for Coppelia and simulink initalization. Displays initial state-space calucaltions and derivation equations necessary to setup control system
  - Simulink: contains mathematical model of the control system and its purpose for functional use
  - Coppelia: physicis simulation software that will simulate the control system working on theoritical hardware. Essentially varifying whether the control sstem functions properly 

# 2. Control System Design 
Primarily, operational and logical viewpoints are created to theoritcally deteremine the placement of all components before physically building the model. These view points are widely used across control system archecture design. The operational view point essentially shows what happens, and were within the system this process occurs. The figure below describes the operational viewpoint for this control system archetecture. In this viewpoint, two sensors are placed on the each arm. One of the horizontally rotating arm, and one on the vertically rotating arm. The data taken from these axises of rotation is essential to the mathematical model. 

<p align = "center">
  <img src = ![Furuta Pendulum Operational View Points (2)](https://user-images.githubusercontent.com/103209385/168148443-cedd4c9c-813b-49d3-a2b3-9fe3d36d0f1d.jpg) style = "margin:10px 10px">
</p>

The figure below displays the system architecture being analyized in this project. It shows the movemement of the system and its purpose at scale. 

<p align = "center">
  <img scr =![image](https://user-images.githubusercontent.com/103209385/167541313-5af5c753-19fa-494f-922a-f64d5a656e25.png) style = "margin:10px 10px">
</p>



Data analyization of the system is accomplished through logical (functional) diagram. The logical diagram shwon in the figure below describes the relationship between the of different data varibales captured within this control system. These diagrams can also give insight into different mechanism neccessary for system operation. The mechanisms are subject, but int limited to power sources, sensors, motors, etc. Overall, the two diagrams dispayed provide a new understanding of the system model.

![Logical Diagram  (2)](https://user-images.githubusercontent.com/103209385/168144217-28d10323-8986-4ba0-886d-110aa92e29d1.jpg)



The figure below displays an image of the control system theory behind this project. It highlights the basic anatomy behind the controller and its functionality.

![image](https://user-images.githubusercontent.com/103209385/167540489-10cbdfe6-5e80-4cb7-8394-fd5e4566cc8f.png)



# 3. Math Modeling  
The matlab code displayed below took heavy influence from the Quanser resource provided. Initally, the base model constraints of teh system, motor and electronics were impleneted. Then, these control variables were theoritically suppose to be tied to simulink and coppelia models to run the control system. However, the errors in our intial matlab code prevented the group from expanding on these results. The code is displayed in the image below. 

The figure below displays our simulink that coincides with our writen matlab code. 

![image](https://user-images.githubusercontent.com/103209385/167558207-1916dad6-f06a-4ce7-a109-fccf4dbc34c6.png)

The matlab code is displayed below 


%%Furuta Pendulum - full code
% MECA 482 Spring 2022 Final Project 
% inital parameters for functional pendulum displayed below 
% allows for coppliea sim to evaluate and analyze

% begins with guide of all parameters/constraints displays by:
% setup_rotpen.m

%start with clearing all previousky run codes
clear;
clc;
clf;
format long;

%initialization of pendulum arm positions need to be set to zero before
%caliibration
% all content displays in rads/s
% these paramters are defautled to 0 value at start

%integrate conditions for real world scenarios
g = 9.81; %m/s^2
ng=0.9
nm=0.69
% Motor Torque Constant (N.m/A)
kt = 1.088 * 0.2780139 * 0.0254; % = .00767
Rm = 2.6;

%% System Constraints - "Measured" from the Furuta System
% System Configuration: 'ROTARY_ARM' & 'MEDIUM_12IN'
mp = 0.127;            % mp = pendulum arm mass - [kg]
mr = 0.257;            % mr = rotar arm mass - [kg]

Lp = 0.33655;      % Lp = Total Length of Pendulum Arm - [m]
lp = Lp./2;       % lp = Distance from pivot to center of gravity - [m]

Lr = 0.2159;                   % Lr = Total Length of Rotor Arm - [m]
lr = (2 + 7/16) * 0.0254;      % lr =Distance from pivot to center of gravity: calced from experiment - [m]

Jp = mp .* Lp.^2 ./ 12;      % Jp = The Moment of Inertia of Pendulum Arm around center of Mass (Lp/2) - [kg/m^2]
Jr = mr .* Lr.^2 ./ 12;      % Jr = The Moment of Inertia of Rotor Arm around center of Mass (Lr/2) - [kg/m^2]

Br = 113.5e-3;   % Br = Viscous Torque Friction - 
Bp = 0.0024;   % Bp = Damping of Pendulum Arm  - [N*m*s/rad]
    

%% System Constants 
Kgi = 14;       % Internal Gear Ratio (of the Planetary Gearbox)
Kge = 5;        % (1x) 24-tooth gear, (2x) 72-tooth gear, (1x) 120-tooth gear

% Total Gear ratio = K_g
Kg = Kgi * Kge;

% Derivation of the state space equations
Jt = (Jp.*mp.*(Lr.^2)) + (Jr.*Jp) + ((1./4).*Jr.*mp.*(Lp.^2));

% Constant place holders
z2 = ((1./4).*(mp.^2).*(Lp.^2).*Lr.*g);
z3 = (-Br.*Jp - (1./4).*Br.*mp.*(Lp.^2));
z4 = ((-1./2).*mp.*Lp.*Lr.*Bp);
z5 = ((1./2).*mp.*Lp.*g.*(Jr + mp.*(Lr.^2)));
z6 = ((-1./2).*mp.*Lp.*Lr.*Br);
z7 = (-Jr.*Bp - Bp.*mp.*Lr.^2);
z8 = (Jp + (1./4).*mp.*(Lp.^2));
z9 = ((1./2).*mp.*Lp.*Lr);

V_m_modifier = (ng .* Kg .* nm .* kt)./(Rm);

%% Motor Constraints - assumption of SVR motor
% High Gear Configuration:
Kgi = 14;       % Internal Gear Ratio (of the Planetary Gearbox)
Kge = 5;        % (1x) 24-tooth gear, (2x) 72-tooth gear, (1x) 120-tooth gear

% Total Gear ratio = K_g
Kg = Kgi * Kge;     

 % Motor Rotor Inertia (kg.m^2)
Jm_rotor = 3.9e-7;      
Jtach = 0;
 
% Motor Equivalent Inertia (kg.m^2)
Jm = Jm_rotor + Jtach;
%
% External Gears Inertias (kg.m^2)
% J24: 24-tooth Gear Inertia (on the Motor Shaft)
m24 = 0.005; % mass (kg)
r24 = 0.5 / 2 * 0.0254; % radius (m)
J24 = m24 * r24^2 / 2;
% J72: 72-tooth Gear Inertia (on the Potentiometer Shaft)
m72 = 0.030; % mass (kg)
r72 = 1.5 / 2 * 0.0254; % radius (m)
J72 = m72 * r72^2 / 2;
% J120: 120-tooth Gear Inertia (on the Load Shaft)
m120 = 0.083; % mass (kg)
r120 = 2.5 / 2 * 0.0254; % radius (m)
J120 = m120 * r120^2 / 2;

% Sets constant motor model parameters.

% Armature Resistance (Ohm)
Rm = 2.6;

% Motor Torque Constant (N.m/A)
kt = 1.088 * 0.2780139 * 0.0254; % = .00767

% Motor Back-EMF Constant (V.s/rd) 
km = 0.804 / 1000 * (60 / (2 * pi )); % = .00767

% Internal Gear Ratio (of the Planetary Gearbox)
Kgi = 14;

% Gearbox Efficiency
ng = 0.90;

% Motor ElectroMechanical Efficiency
eta_m = 0.69;    

% Set the amplifier Maximum Output Voltage (V) and Output Current (A)
VMAX_AMP = 24;
IMAX_AMP = 4;
K_AMP = 1;

% Potentiometer Sensitivity (rd/V)
K_POT = -(352 * pi / 180 / 10);

% Encoder Resolution, for a quadrature encoder, (rd/count)    
K_ENC = 2 * pi / ( 4 * 1024 );


%% State sp%% State Space Representation - Build Open Loop Response
% Add here linearized system model instead of zero
A = zeros(4);       % Creates Empty 4x4 Matrix - A = System Matrix
A(1,3) = 1;
A(2,4) = 1;
A(3,2) = (1./Jt) .* z2;
A(3,3) = (1./Jt) .* z3;
A(3,4) = (1./Jt) .* z4;
A(4,2) = (1./Jt) .* z5;
A(4,3) = (1./Jt) .* z6;
A(4,4) = (1./Jt) .* z7;

% Add here input vector instead of zero
B = zeros(1,4)';    % Creates Empty 1x4 Matrix - B = Input Matrix
B(3,1) = V_m_modifier .* (1./Jt) .* z8;
B(4,1) = V_m_modifier .* (1./Jt) .* z9;

% Shows we have two outputs
C = zeros(2,4);       % Creates Empty 4x4 Matrix - C = Output Matrix - Should it be 4x4? or 2x4?
C(1,1) = 1;
C(2,2) = 1;

D = zeros(1,2)';    % Creates Empty 1x4 Matrix - D = Feedforward matrix - Should it be 1x4 or 1x2?



%actuator dyanmics (not applicable in this situation)
A(3,3) = A(3,3) - Kg^2*kt*km/Rm*B(3);
A(4,3) = A(4,3) - Kg^2*kt*km/Rm*B(4);
B = Kg * kt * B / Rm;

Con_F_ss = ctrb(A,B);   % The system is controllable if Con_F_ss has a full rank n

% Determines the Observability Matrix os the SS Model
Obs_F_ss = obsv(A,C);   % The model is observable if Obs_F_ss has a full rank n
% Note: The Obs_F_ss = 0, therefore the SS Model is full
% rank and is thus an observable system

%% Balance Control
% Balance control enable range (rad)
epsilon = 12.0 * pi / 180;
% Control Specifications
zeta = 0.7;
wn = 4;



%% Display

% labels created for SS Model 
states = {'x1','x2','x3','x4'};
inputs = {'V_m'};
outputs = {'theta','alpha'};

% Open loop system model
Furuta_ss = ss(A,B,C,D,'Statename', states,'InputName',inputs,'OutputName',outputs)



% Shows Laplace transfer function of the system in the s-domain
Furuta_laplace = tf(Furuta_ss)               

% pole function and plot check
Pole = pole(Furuta_ss);

% Pole zero map of the State Space Model
figure(1);
h = pzplot(Furuta_ss);    % the x indicates a pole and o indicates a zero
grid on;

% Places the above plotted zeros and poles into a column vector
[p,z] = pzmap(Furuta_ss);  

% Computes and plots the poles and zeros of each input/output pair of the dynamic system model
figure(2);
h2 = iopzplot(Furuta_ss)

%% Balance Controller Module 
% determination of gain matrix 

%%below display the control variables 

%damping ratio
zeta = 0.7;
%natural frequency - [rads/s]
wn = 4;

% deteremination of wanted pole placement 
sigma = zeta .* wn
wd = wn .* (sqrt(1 - (zeta.^2)))

% range of Balance control(radians)
epsilon = 12.0 * pi / 180;

%calculaion of p1 and p2
p1 = complex(-sigma,wd);    %p1 = -sigma + wd j;
p2 = complex(-sigma,-wd);   %p2 = -sigma - wd j;
% Choosen closed-loop poles 
p3= -30
p4=-40
% pole placememnt 
desired_poles = [p1, p2, p3, p4]


K = [0 0 0 0]

%controller gain calcualtion
[K, prec, message] = place(A,B,desired_poles);
% Companion state-feedback control gain
Kc = [0 0 0 0];
% Convert back from companion form





%% Control Parameters for Swing Up Function

% velocity computation
% Cutoff frequency (rad/s)
wcf_1 = 2 * pi * 10.0;
% Pendulum High-pass filter in PD control used to compute velocity
% Cutoff frequency (rad/s)
wcf_2 = 2 * pi * 10.0;

%inherited from SS model 
alpha = C(2,2);
theta = C(1,1);

%maluable control gain
mu = 1;

% Kinetic Energy of Pendulum (J)
KEE = (1./2).*Jp.*(alpha_dot.^2);

% Potential Energy of Pendulum (J) 
PEE_upright_position = mp.*g.*Lp;

% Potential Energy of Pendulum (J) -
PEE_down_position = 0;

%Total exerted energy of pendulum is 0 from initital position
Etot = 0;

% Max Torque of the Motor - (SRV02 motor)
Tmax = (ng.*Kg.*nm.*kt.*(5))./Rm;

% Maximum acceleration of pivot (m/s^2) - 
amax = Tmax./(mr.*Lr);

%max accel displayed by control signal 
u_max_SS = 20;


# 4. Simulation
Ideally, the simulation would have produced underdamping charactertics on the follwoing graphs displayed below. The underdamping trends would have shown stabilization of our system, primarily of the vertical pendulum arm operating in the up-right positiion. The figures below show the pole map where the underdamping characteristics should have been displayed.

![image](https://user-images.githubusercontent.com/103209385/167546674-69ce93a7-458b-4c5a-a206-a5f437cf4a68.png)



# 5. Presentation

# 6. Results 
Unfortunately, our project came to halut. We had continous errors with our matlab code we were unable to solve. The transisiton from matlab to Coppellia gave the group trouble. If our errors and matlab had been deteremined, we believe our control system would have been successful. The errors specified is displayed in the image below.

![image](https://user-images.githubusercontent.com/103209385/167542106-a03d5fad-ec67-4f57-ac86-bd4fc81dfb6b.png)

# 7. References 
