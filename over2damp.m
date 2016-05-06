function [ r ] = dampingratio( po )
%OVERSHOOT Summary of this function goes here
r=sqrt((log(po/100)^2)/(pi^2+(log(po/100)^2)))
%   Detailed explanation goes here
return

end

