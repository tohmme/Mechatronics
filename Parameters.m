clear all
clc
load('system.mat')
global Wp Wz g0 G damp
s = tf('s');
sys = ss(sys.A, sys.B, sys.C, sys.D);

%% part 1
% mode 1 
Wp = 2270;     % Frequency of the pole
Wz = 2310;     % Frequency of the zero
g0 = 0.0023637946479806407;        % Constant gain of G

G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G1 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);
damp = 0.02;
PPF1 = MAXDPPF(damp)

figure
bode(G)
hold on
bode(G/(1-G*PPF1))

%% part 2
% mode 2
Wp = 4147;     % Frequency of the pole
Wz = 4397;     % Frequency of the zero
% g0 = 0.0023637946479806407;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G2 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);
PPF2 = MAXDPPF(damp)

% mode 3
Wp = 5160;     % Frequency of the pole
Wz = 5484;     % Frequency of the zero
% g0 = 0.0023637946479806407;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G3 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);
PPF3 = MAXDPPF(damp)

% mode 4
Wp = 6886;     % Frequency of the pole
Wz = 7101;     % Frequency of the zero
%g0 = 0.0023637946479806407;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G4 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);
PPF4 = MAXDPPF(damp)

% mode 5
Wp = 7153;     % Frequency of the pole
Wz = 8520;     % Frequency of the zero
%g0 = 0.0023637946479806407;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G5 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);
PPF5 = MAXDPPF(damp)

% sys1 = feedback(sys,PPF1,5,5,+1);
sys1 = feedback(sys,PPF1,5,5);
sys2 = feedback(sys1,PPF2,5,5);
sys3 = feedback(sys2,PPF3,5,5);
sys4 = feedback(sys3,PPF4,5,5);
sys5 = feedback(sys,PPF5,5,5);

figure
hold on
bode(sys(1,1))
bode(sys3(1,1))

%% Part 3

%mode 1 on sys2
Wp = 2277;     % Frequency of the pole
Wz = 3134;     % Frequency of the zero
g0 = 0.0030725573652674453;     % Constant gain of G
damp = 0.2;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1); 
G_1 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1); 
PPF_1 = MAXDPPF(damp)

%mode 2 on sys4
Wp = 4147;     % Frequency of the pole
Wz = 5116;     % Frequency of the zero
g0 = 0.002792543841237339;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G_2 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1); 
PPF_2 = MAXDPPF(damp)

%mode 3 on sys3
Wp = 7153;     % Frequency of the pole
Wz = 7896;     % Frequency of the zero
g0 = 0.002379578300956397;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);% Primary system
G_3 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1); 
PPF_3 = MAXDPPF(damp)

%mode 4 on sys5
Wp = 6886;     % Frequency of the pole
Wz = 7101;     % Frequency of the zero
g0 = 0.0023631973991540163;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G_4 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1); 
PPF_4 = MAXDPPF(damp)

%mode 5 on sys4
Wp = 7153;     % Frequency of the pole
Wz = 8376;     % Frequency of the zero
g0 = 0.002792543841237339;
G = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1);     % Primary system
G_5 = g0*(s^2/Wz^2+2*0.001/Wz*s+1)/(s^2/Wp^2+2*0.001/Wp*s+1); 
PPF_5 = MAXDPPF(damp)

sys_1 = feedback(sys,PPF_1,2,2);
sys_2 = feedback(sys_1,PPF_2,4,4);
sys_3 = feedback(sys_2,PPF_3,3,3);
sys_4 = feedback(sys_3,PPF_4,5,5);
sys_5 = feedback(sys_4,PPF_5,4,4);

% figure
% hold on
% bode(sys(1,1))
% bode(sys_1(1,1))
