
% FRUPEN Setup file 

function [k, n,info,Ep,Ek,Kswing1,Kswing2,Mu,eps]= FURPEN_Setup;

%call statespace file equations
FURPEN_SSE;

%Transfer function system
desired_poles = [p1, p2, p3, p4]


k = [0 0 0 0]

%controller gain calcualtion
[k, prec, message] = place(A,B,desired_poles);
% Companion state-feedback control gain
Kc = [0 0 0 0];
disp('  ');
disp('Control gain');
disp(k);
disp('egianvalues');
disp(eig(A-B*k));

[num, den]=ss2tf(A-B*k,B,C,D)
TRAN =tf(num, den);
%disp("Transfer Function for Furuta Pendulum")
