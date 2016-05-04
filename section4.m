% this is section 4
G=tf(684,[1 12 57 0])
Gc=feedback(G,1)
damp=over2damp(10)
T=0.5
Wb=(4/(T*damp))* sqrt((1-2*damp^2 )+sqrt(4*damp^4-4*damp^2+2)) 
Ws=20*Wb
Ts=(2*pi)/Ws
Gz=c2d(G,Ts)
Gzc=feedback(Gz,1)
figure(1)
step(Gzc)
hold on
step(Gc)
Gzd=