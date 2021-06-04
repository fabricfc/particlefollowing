function [ vectorX vectorY vectorZ ] = ...
    ResetPositions(uniform, nmrParticulas, minBoundryEnvironment, maxBoundryEnvironment)
%RESETPOSITIONS Summary of this function goes here
%   Detailed explanation goes here

    if (uniform)
        vectorX = random('unif', minBoundryEnvironment, maxBoundryEnvironment, 1, nmrParticulas);
        vectorY = random('unif', minBoundryEnvironment, maxBoundryEnvironment, 1, nmrParticulas);
        vectorZ = random('unif', minBoundryEnvironment, maxBoundryEnvironment, 1, nmrParticulas);
    else
        % Reset positions
        vectorX = zeros(nmrParticulas);
        vectorY = zeros(nmrParticulas);
        vectorZ = zeros(nmrParticulas);
    end
end

