% this is section 4
G=tf(684,[1 12 57 0])
Gc=feedback(G,1)
damp=over2damp(10)
T=0.2
Wb=(4/(T*damp))* sqrt((1-2*damp^2 )+sqrt(4*damp^4-4*damp^2+2)) 
Ws=20*Wb
Ts=(2*pi)/Ws
format long
Gz=c2d(G,Ts,'zoh')
Gzc=feedback(Gz,1)
figure(1)
step(Gzc)
hold on
step(Gc)
Gw=Gz2Gw(Gz,Ts)
% denz=Gz.den{1,1}
% numz=Gz.num{1,1}
% dent=denz.*[-1 1 -1 1]
% numt=numz.*[-1 1 -1 1]
% [numx denx]=bilinear(numt,dent,0.5)
% Gx=tf(numx,denx)
% xpara=(Ts/2)*-1
% numw=[numx].*[xpara^3 xpara^2 xpara 1]
% denw=[denx].*[xpara^3 xpara^2 xpara 1]
% Gw=tf(numw,denw)
Gwc=feedback(Gw,1)
figure(2)
bode(Gw)
figure(3);
step(Gwc);
[Gm,Pm,Wcg,Wcp] = margin(Gw);
Pm=(60-Pm)+0.1*(60-Pm)
alpha=1/0.05
GM=1/sqrt(alpha)
[MAG,PHASE,W] = bode(Gw)
phase= interp1( squeeze(MAG), squeeze(PHASE), GM);
w= interp1( squeeze(MAG), W, GM);
Z=w/sqrt(alpha)
P=alpha*Z
Klead=tf([1 Z],[1 P])*alpha
GwKlead=Gw*Klead
figure(2)
GwKleadc=feedback(Gw*Klead,1);
step(GwKleadc)
GwKleadcs=step(GwKleadc);
figure(3);
findpeaks(GwKleadcs);
PKS=findpeaks(GwKleadcs);
[Gm2,Pm2,Wcg2,Wcp2] = margin(GwKlead)
figure(4)
bode(GwKlead)
Pm=(60-Pm2)+0.1*(60-Pm2 )
alpha2=1/0.3
[MAG,PHASE,W] = bode(GwKlead);
GM2=(1/sqrt(alpha2))
phase2= interp1( squeeze(MAG), squeeze(PHASE), GM2)
w2= interp1( squeeze(MAG), W, GM2)
Z2=w2/sqrt(alpha2)
P2=alpha2*Z2
Klead2=tf([1 Z2],[1 P2])*alpha2
Gw2Klead=GwKlead*Klead2;
Gw2Kleadc=feedback(Gw2Klead,1)
figure(5)
step(Gw2Kleadc)
figure(6)
bode(Gw2Klead)
step1=step(Gw2Kleadc)
P1=findpeaks(step1)
K1=1/P1(1)
figure(7)
% The K1 was found by using the inverse of the previous step response's peak value
Gw2KleadK1=GwKlead*Klead2*K1;
Gw2KleadKc=feedback(Gw2KleadK1,1);
step(Gw2KleadKc)
Gz2KleadK1=c2d(Gw2KleadK1,Ts,'zoh')
Gz2KleadK1c=feedback(Gz2KleadK1,1)
figure(8)
step(Gz2KleadK1c)
step2=step(Gz2KleadK1c)
P2=findpeaks(step2)
K2=1/P2(1)
% The K2 was found by using the inverse of the previous step response's peak value


% Gz2KleadK1=c2d(Gw2KleadK1,Ts,'zoh')
% Gz2KleadK1c=feedback(Gz2KleadK1,1)
% figure(8)
% step(Gz2KleadK1c)
Gw2KleadK1K2=GwKlead*Klead2*K1*K2;
Gw2KleadK1K2c=feedback(Gw2KleadK1K2,1)

% Gz2KleadK1K2=GwKlead*Klead2*K1*K2;

% z=tf('z')\
Gz2KleadK1K2=c2d(Gw2KleadK1K2,Ts,'zoh')
Gz2KleadK1K2c=feedback(Gz2KleadK1K2,1)
Kzlead1=tf([5063.02 -4936.98],[313.02 -186.98],Ts)
Kzlead2=tf([868.4 -798.1],[285.15 -214.85],Ts)
GzKzlead1Kzlead2=Gz*Kzlead1*Kzlead2
GzKzlead1Kzlead2c=feedback(GzKzlead1Kzlead2*K1*K2,1)
figure(8)
step(Gw2KleadK1K2c,Gz2KleadK1K2c,GzKzlead1Kzlead2c)
% wpara=2/Ts*([(z-1)/(z+1)])
% denw=sym(Gz2KleadK1.den{1,1})
% numw=sym(Gz2KleadK1.num{1,1})
% 
% denz=denw.*wpara
% numz=numw.*wpara
% denzarray=sym2cell(denz)
% [denz]=denzarray{1,1:6}
% numzarray=sym2cell(numz)
% [numz]=numzarray{1,1:6}
% 
% denztf=denz
% numztf=numz
% Gz=numztf/denztf
% Gz=numz/denz
% % Gzc=feedback(Gz,1,1,1,1,1,1)
% bode(Gz)
% Gzz2KleadK1K2c=c2d(Gz2KleadK1K2c,Ts,'zoh')
% figure(9)
% step(Gzz2KleadK1K2c)