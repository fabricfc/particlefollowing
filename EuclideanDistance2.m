function [ distance ] = EuclideanDistance2(x1, y1, x2, y2)
%DISTANCE Summary of this function goes here
%   Detailed explanation goes here
    distance = sqrt((x1-x2)^2 + (y1-y2)^2);
end

