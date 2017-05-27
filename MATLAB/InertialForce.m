function B = InertialForce(m,l,lcm,phi)
    
    % Inputs from servo encoder
    omg = [1 1];
    eps = [0.1 0.1];

    acm = [lcm(1)*sqrt(eps(1)^2 + omg(1)^4) 
        sqrt( (eps(1)*l(1))^2 + (omg(1)^2*l(1))^2 + (eps(2)*lcm(2))^2 + (omg(2)^2*lcm(2))^2 + (eps(1)*l(1)*eps(2)*lcm(2) + omg(1)^2*l(1)*omg(2)^2*lcm(2))*(cos(phi(1)-phi(2))) + (omg(1)^2*l(1)*eps(2)*lcm(2) + eps(1)*l(1)*omg(2)^2*lcm(2))*(sin(phi(1)-phi(2))) )];

    B(1) = m(1)*acm(1);
    B(2) = m(2)*acm(2);
    
end