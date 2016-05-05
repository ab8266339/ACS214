G=tf([684],[1 12 57 0]),
num=[684],
den=[1 12 57 0],
z=0.59;
t=0.1,
x=0.59,
wb=(4/(t*x))*((1-(2*x^2))+((4*z^4)-(4*z^2)+2)^0.5)^0.5
wbnew=20*wb,
tsampling=(2*pi)/wbnew,
format long,
[numz,denz]=c2dm(num,den,tsampling),

gz=tf(numz, denz, tsampling),
gcz=feedback(gz,1),
step(gcz)

numznew=[numz].*[(-1)^3 (-1)^2 (-1) 1]
denznew=[denz].*[(-1)^3 (-1)^2 (-1) 1]
[numx, denx]=bilinear(numznew, denznew, 0.5 )

xco=(tsampling/2)*-1
numw=[numx].*[(xco)^3 (xco)^2 (xco) 1]
denw=[denx].*[(xco)^3 (xco)^2 (xco) 1]
gw=tf(numw,denw)

figure()
bode(gw)