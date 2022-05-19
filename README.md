# MECA-482-furuta-pendulum
MECA 482 Final Project: Furuta Pendulum

By: Oliver Taback, Nick Croda, Marek Codron, Jacob Rivett, Jose Zamano

# Table of Contents
  1. Introduction
  2. Control_System_Design
  3. Math_Modeling
  4. Simulations
  5. Presentation
  6. Reference List 

# 1. Introduction 
The Furuta Pendulum consists of a driven arm rotating horizontally, and a pendulum attached to the arm that operates freely in the vertical direction. The mechanism is designed to be unconstrained pneumatically, and nonlinear due to centrifugal and gravitational forces on the coupler allowing a variety of different movements to occur. This project will examine creating a test platform in a control system, that will in turn, efficiently test this model fluidly, and at a low cost. The deliverables and design requirements for this project are stated below.

The goal of this project is to produce a control system that will balance the pendulum arm in the upright position during the testing phase. A motor placed on the base piece of the pendulum possesses the ability to direct movement. Keeping these variables in consideration, the control system will essentially force the vertical pendulum arm to balance. 

![Furuta](https://user-images.githubusercontent.com/92506151/169388442-3bdb163d-f34c-4871-b16f-936ecf6e4834.jpg)


Deliverables: 
  - Mathematical Model of system designed in MATLAB
  - Operational and logical diagrams of the control system
  - Control system via MATLAB that states the code designed to meet all requirements of the mathematical model 
  - Open designed control system to link to Coppelia Simulink via MATLAB program

Project contains:
  - Matlab Software: Responsible for Coppelia and simulink initialization. Displays initial state-space calculations and derivation equations necessary to setup control system
  - Simulink: Contains mathematical model of the control system and its purpose for functional use
  - Coppelia: Physics simulation software that will simulate the control system working on theoretical hardware. Essentially verifying whether the control system functions properly 

# 2. Control System Design 
Primarily, operational and logical viewpoints are created to theoretically determine the placement of all components before physically building the model. These viewpoints are widely used across control system architecture design. The operational view point essentially shows what happens, and were within the system this process occurs. The figure below describes the operational viewpoint for this control system architecture. In this viewpoint, two sensors are placed on each arm. One of the horizontally rotating arm, and one on the vertically rotating arm. The data taken from these axises of rotation is essential the mathematical model. 

![Furuta Pendulum Operational View Points (2)](https://user-images.githubusercontent.com/103209385/168148443-cedd4c9c-813b-49d3-a2b3-9fe3d36d0f1d.jpg) 

The figure below displays the system architecture being analyzed in this project. It shows the movement of the system and its purpose at scale. 


![image](https://user-images.githubusercontent.com/103209385/167541313-5af5c753-19fa-494f-922a-f64d5a656e25.png)




Data analyzation of the system is accomplished through logical (functional) diagram. The logical diagram shown in the figure below describes the relationship between the different data variables captured within this control system. These diagrams can also give insight into different mechanism necessary for system operation. The mechanisms are subject, but not limited to, power sources, sensors, motors, etc. Overall, the two diagrams displayed provide a new understanding of the system model.

![Logical Diagram  (2)](https://user-images.githubusercontent.com/103209385/168144217-28d10323-8986-4ba0-886d-110aa92e29d1.jpg)



The figure below displays an image of the control system theory behind this project. It highlights the basic anatomy behind the controller and its functionality.

![image](https://user-images.githubusercontent.com/103209385/167540489-10cbdfe6-5e80-4cb7-8394-fd5e4566cc8f.png)



# 3. Math Modeling  

The setup file Matlab code is displayed in the image below.
![image](https://user-images.githubusercontent.com/103209385/169362050-927ab8b1-f36f-4abe-9090-c63d94cc791f.png)

Further code allowing for accurate testing of the system is displayed in the image shown below.
![image](https://user-images.githubusercontent.com/103209385/169362427-38c3c468-05e7-4142-9061-fe611a08953e.png)




Ideally, the simulation would have produced underdamping characteristics on the following graphs displayed below. The underdamping trends would have shown stabilization of our system, primarily of the vertical pendulum arm operating in the up-right position. The figures below show the pole map where the underdamping characteristics would be displayed if the Matlab code was correctly adapted to run the testing. Unfortunately, the errors experienced halted the group from moving forward. Ideally, this code would have presented figures of an undamping graph. 

![image](https://user-images.githubusercontent.com/103209385/169365442-b8b34a7b-9c50-4f74-888c-c13b4d0ffc2c.png)




# 4. Simulation

The Matlab code showcased previously took heavy influence from the Quanser resource provided and helped guide us to create our simulation model. Initially, the base model constraints of the system, motor, and electronics were implemented. These control variables were to be tied to Simulink and Coppelia models to run the control system. However, the errors in our initial Matlab code prevented the group from expanding on these results.

The figure below displays our Simulink that coincides with our written Matlab code from previous section. 

![image](https://user-images.githubusercontent.com/103209385/167558207-1916dad6-f06a-4ce7-a109-fccf4dbc34c6.png)


# 5. Presentation

- Please use link below for video presentation of the project.
- https://youtu.be/qa5i3wHae0M

# 6. Results 

Unfortunately, our project came to a halt. We had continuous errors with our Matlab code we troubleshoot and were unable to solve. The transition from Matlab to Coppelia gave the group difficulties. If our errors had taken less time, we would have had the opportunity to link the Simulink and Coppellia to the working Matlab code.

Although errors were experienced, the Matlab code successfully determines poles, desired poles, control gain, and more. This data is specified in the image displayed below.

![image](https://user-images.githubusercontent.com/103209385/169360845-6537d99d-fca9-4a16-aa16-0920e958d9c8.png)


![image](https://user-images.githubusercontent.com/103209385/169357676-0b6243ce-5465-4609-912a-0c258026b107.png)


# 7. References 

The following list below shows all references that influenced a variety of aspects in our control system design project.

Regular API reference. regular API reference. (n.d.). Retrieved May 9, 2022, from https://www.coppeliarobotics.com/helpFiles/en/apiFunctions.htm

Hernández-Guzmán Victor Manuel., & Silva-Ortigoza Ramón. (2019). Automatic control with experiments. Springer International Publishing.

Wikipedia, Furuta Pendulum, Retrieved by Jan., 27, 2020 from
https://en.wikipedia.org/wiki/Furuta_pendulum

Quanser, Rotary Inverted Pendulum, Retrieved by Jan, 27, 2020 from
https://www.quanser.com/products/rotary-inverted-pendulum/

Control System Tutorials for MATLAB and Simulink, Retrieved by Jan, 27, 2020 from
http://ctms.engin.umich.edu/CTMS/index.php?example=InvertedPendulum&section=SystemModeling

Kildare, R., Hansen E., Leon, E., PID Control of Furuta Pendulum, Control System Design Project Fall
2019

Pick and place application with Kuka KR16 Robot Using V-Rep, Retrieved from Internet, Jan 28, 2020
https://www.youtube.com/watch?v=CVoV08T0Aqo
