function [ a ] = CheckMax( a, aMin, aMax)
%CHECKMAX Summary of this function goes here
%   Detailed explanation goes here

    if (a > aMax)
        a = aMax;
    else
        if (a < aMin)
            a = aMin;
        end
    end
end

