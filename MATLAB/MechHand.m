% Const values for our configuration
m = [0.1 0.1];
G = [9.81*m(1) 9.81*m(2)];
lcm = [5 5];
l = [10 10];

% Force needed to manipulate object
P = PressingForce(0.5,1);
    
ForceAnalysis(G,lcm,l,0,P)

for i = 1:5
    P = PressingForce(0.5,i);
    M = ForceAnalysis(G,lcm,l,0,P);
    M1(i) = M(5);
    M2(i) = M(6);
end

figure;
hold on;
x = 1:1:5;
plot(x,M1)
plot(x,M2)
title('Plot of moments of rotation to weight of held object')
xlabel('Force P [N]')
ylabel('Moments [Nm]')
legend('Moment of base joint','Moment of second joint')