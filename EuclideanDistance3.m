function [ distance ] = EuclideanDistance3( x1, y1, z1, x2, y2, z2)
%DISTANCE Summary of this function goes here
%   Detailed explanation goes here
    distance = sqrt((x1-x2)^2 + (y1-y2)^2 + (z1-z2)^2);
end

