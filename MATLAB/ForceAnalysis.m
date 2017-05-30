function M = ForceAnalysis(G,lcm,l,n,P)
    % Friction force
    F = 0.2*P;      %[N]
    % Input from servo encoder
    phi = [0 0];    %[deg]
    
    % For static configurations B = [0,0]
    if n == 1   
        B = InertialForce(m,l,lcm,phi);
    end
    if n ~= 1
        B = [0 0];
    end

    A = [1 0 -1 0 0 0; 
        0 -1 0 1 0 0; 
        0 0 sin(phi(1))*l(1) cos(phi(1))*l(1) -1 1; 
        0 0 1 0 0 0; 
        0 0 0 1 0 0; 
        0 0 0 0 0 1];

    C = [-B(1)*sin(phi(1));
        G(1) + B(1)*cos(phi(1));
        (B(1) + G(1)*cos(phi(1)))*lcm(1);
        -B(2)*sin(phi(2)) + P*sin(phi(2)) - F*cos(phi(2));
        P*cos(phi(2)) - G(2) - B(2)*cos(phi(2)) + F*sin(phi(2));
        P*l(2) - B(2)*lcm(2) - G(2)*cos(phi(2))*lcm(2)];

    M = A\C;    %[R01x; R01y; R12x; R12y; Mr1; Mr2]

end