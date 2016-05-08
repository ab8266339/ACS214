% this is section3
G=tf(684,[1 12 57 0])
po=10;
fprintf('selected overshoot 10 percent')
[dp]=over2damp(po)
figure(1)
bode(G)
figure()
Gc=feedback(G,1)
step(Gc)
fprintf('By looking at bode')
[Gm,Pm,Wcg,Wcp] = margin(G);
Pm=60-Pm
alpha=1/0.05
GM=1/sqrt(alpha)
[MAG,PHASE,W] = bode(G)
phase= interp1( squeeze(MAG), squeeze(PHASE), GM)
w= interp1( squeeze(MAG), W, GM)
Z=w/sqrt(alpha)
P=alpha*Z
Klead=tf([1 Z],[1 P])*alpha
GKlead=G*Klead
figure(2)
GKleadc=feedback(G*Klead,1);
step(GKleadc)
% GKleadcs=step(GKleadc)
% figure(3)
% findpeaks(GKleadcs)
% PKS=findpeaks(GKleadcs);
[Gm2,Pm2,Wcg2,Wcp2] = margin(GKlead)
figure(4)
bode(GKlead)
Pm=60-Pm2;
alpha2=3.33
[MAG,PHASE,W] = bode(GKlead)
GM2=(1/sqrt(alpha2))
phase2= interp1( squeeze(MAG), squeeze(PHASE), GM2)
w2= interp1( squeeze(MAG), W, GM2)
Z2=w2/sqrt(alpha2)
P2=alpha2*Z2
Klead2=tf([1 Z2],[1 P2])*alpha2
G2Klead=GKlead*Klead2;
% % % % % % % % % % % % 
G2Kleadc=feedback(G2Klead,1)
figure(5)
step(G2Kleadc)
figure(6)
bode(G2Klead)
figure(7)
G2KleadK=GKlead*Klead2*(1/1.28);
G2KleadKc=feedback(G2KleadK,1);
step(G2KleadKc)