function [x,y] = intersection(u,z0,ratio)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    t = z0 / u(3);
    x = floor(t*u(1)/ratio);
    y = floor(t*u(2)/ratio);
end