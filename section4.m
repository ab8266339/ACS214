% this is section 4
G=tf(684,[1 12 57 0])
damp=over2damp(10)
Wb=(4/(T*damp))* sqrt((1-2*damp^2 )+sqrt(4*damp^4-4*damp^2+2)) 