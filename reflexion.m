function [u] = reflexion(theta_x,theta_y)
%REFLEXION Laser reflexion computation based on Snell's law in vector form
    u_x = 1 - 2*cos(theta_x - pi/4)^2;
    u_y = (1 - 2*sin(theta_y + pi/4)^2)*(-2*cos(theta_x - pi/4)*sin(theta_x - pi/4));
    u_z = 4*cos(theta_y + pi/4)*sin(theta_y + pi/4)*cos(theta_x - pi/4)*sin(theta_x - pi/4);
    u = [u_x, u_y, u_z];
    u = u / norm(u);
end