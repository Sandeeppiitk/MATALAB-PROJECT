%given experimental data
clc; clear all; close all
T = [96.70 92.70 84.60 77.10 73.20 68.60 66.70 66.30];
X1 = [0.0159 0.0476 0.1475 0.3515 0.5097 0.7595 0.8889 0.9408];
y1e = [0.1100 0.2521 0.4716 0.6786 0.7923 0.8953 0.9536 0.9702];
y1 = zeros(1,8);
y2 = zeros(1,8);
X2 = 1-X1;
a12 = 26.3731;
a21 = 551.6333;
v1 = 40.73;
v2 = 18.07;
R = 8.314 ;
%antoine const
Ac = [8.08097 1582.271 239.726 8.07131 1730.630 233.426];
Pr = 760 ;
for i = 1:8
   L12 = v2/v1 *exp(-a12/(R*T(1,i)));
   L21 = v1/v2 * exp(-a21/(R*T(1,i)));
   G1 = exp(-log(X1(1,i) + X2(1,i)*L12)+X2(1,i)*(L12/(X1(1,i)+X2(1,i)*L12)-L21/(X2(1,i)+X1(1,i)*L21)));
   G2 = exp(-log(X2(1,i) + X1(1,i)*L21)+X1(1,i)*(L21/(X2(1,i)+X1(1,i)*L21)-L12/(X1(1,i)+X2(1,i)*L21)));
   P1sat = 10^(Ac(1)-Ac(2)/(T(1,i)+Ac(3)));
   P2sat = 10^(Ac(4)-Ac(5)/(T(1,i)+Ac(6)));
   y1(1,i) = X1(1,i)*G1*P1sat/Pr;
   y2(1,i) = X2(1,i)*G2*P2sat/Pr;

end
plot(X1,y1);

plot(X1,T,'-');
hold on;
plot(y1,T);
hold off;

plot(y1,T,'*');
hold on;
plot(y1e,T);
hold off;


