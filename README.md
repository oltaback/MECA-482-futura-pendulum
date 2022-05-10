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


![Furuta Pendulum Operational View Points (1)](https://user-images.githubusercontent.com/103209385/167545141-1b77b99e-ccc9-4f41-b6cd-6e033509dcbe.jpg)


The figure below displays the system architecture being analyized in this project. It shows the movemement of the system and its purpose at scale. 

![image](https://user-images.githubusercontent.com/103209385/167541313-5af5c753-19fa-494f-922a-f64d5a656e25.png)




Data analyization of the system is accomplished through logical (functional) diagram. The logical diagram shwon in the figure below describes the relationship between the of different data varibales captured within this control system. These diagrams can also give insight into different mechanism neccessary for system operation. The mechanisms are subject, but int limited to power sources, sensors, motors, etc. Overall, the two diagrams dispayed provide a new understanding of the system model.

![Logical Diagram ](https://user-images.githubusercontent.com/103209385/167544915-35f39dcf-457b-4889-969b-233f9d1e9a9e.jpg)

The figure below displays an image of the control system theory behind this project. It highlights the basic anatomy behind the controller and its functionality.

![image](https://user-images.githubusercontent.com/103209385/167540489-10cbdfe6-5e80-4cb7-8394-fd5e4566cc8f.png)



# 3. Math Modeling  
The matlab code displayed below took heavy influence from the Quanser resource provided. Initally, the base model constraints of teh system, motor and electronics were impleneted. Then, these control variables were theoritically suppose to be tied to simulink and coppelia models to run the control system. However, the errors in our intial matlab code prevented the group from expanding on these results. The code is displayed in the image below. 



# 4. Simulation
Ideally, the simulation would have produced underdamping charactertics on the follwoing graphs displayed below. The underdamping trends would have shown stabilization of our system, primarily of the vertical pendulum arm operating in the up-right positiion. The figures below show the pole map where the underdamping characteristics should have been displayed.

![image](https://user-images.githubusercontent.com/103209385/167546674-69ce93a7-458b-4c5a-a206-a5f437cf4a68.png)



# 5. Presentation

# 6. Results 
Unfortunately, our project came to halut. We had continous errors with our matlab code we were unable to solve. The transisiton from matlab to Coppellia gave the group trouble. If our errors and matlab had been deteremined, we believe our control system would have been successful. The errors specified is displayed in the image below.

![image](https://user-images.githubusercontent.com/103209385/167542106-a03d5fad-ec67-4f57-ac86-bd4fc81dfb6b.png)

# 7. References 
