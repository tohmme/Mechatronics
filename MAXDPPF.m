function PPF = MAXDPPF(Xic)

global Wp Wz g0 G damp

gamma = Wz/Wp;

s = tf('s');

a = sqrt(4*gamma^2*Xic^2/(gamma^2-1)+1);
beta = 4*gamma^2*Xic^2/(g0^2*(4*gamma^2*Xic^2+gamma^2-1));
Xif = 2*Xic*sqrt((gamma^2-1)/(4*gamma^2*Xic^2+gamma^2-1));
Wf = Wp*a;
gf = beta*g0;

PPF = gf*Wf^2/(s^2+2*Xif*Wf*s+Wf^2);

opts = bodeoptions;
opts.Title.FontSize = 14;
opts.XLabel.FontSize = 14;
opts.YLabel.FontSize = 14;
opts.TickLabel.FontSize = 14;
opts.FreqUnits = 'Hz';
opts.MagUnits  = 'abs';
opts.FreqScale = 'log';
opts.MagScale = 'log';

figure(1);
hold on;
bode(G/(1-PPF*G),opts);
grid on
title('Closed-Loop')
xlim([1 1000])

figure(2);
LoopGain = -PPF*G;
opts.MagUnits  = 'dB';
opts.MagScale = 'linear';
bode(LoopGain,opts);
title('Loop-Gain')
grid on
xlim([1 1000])

figure(3);
Sensitivity = 1/(1-PPF*G);
bode(Sensitivity,opts);
grid on
title('Sensitivity')
xlim([1 1000])

end