function [ leaderX leaderY leaderZ leaderGoX leaderGoY leaderGoZ] = LeaderMoviment( ...
    leaderX, leaderY, leaderZ, minBoundryEnvironment, maxBoundryEnvironment, ...
    leaderGoX, leaderGoY, leaderGoZ, ...
    nmrParticulas, vectorX, vectorY, vectorZ)
%LEADERMOVIMENT Summary of this function goes here
%   Detailed explanation goes here

t = 1;
% Faster than pursuers
aMax = 7;

covariance = [.5 0 0; 0 .5 0; 0 0 .5];

if (EuclideanDistance3(leaderX, leaderY, leaderZ, leaderGoX, leaderGoY, leaderGoZ) < random('unif', 0, 5))
    %     Criando uma nova estratégia do leader
    
    % Estratégia aleatória
    %     leaderGoX = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
    %     leaderGoY = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
    %     leaderGoZ = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
    
    % Estratégia mistura de gaussianas
    particles = [vectorX; vectorY; vectorZ]';
    obj = gmdistribution(particles,[2 0 0;0 2 0;0 0 2]);
    
    leaderGoX = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
    leaderGoY = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
    leaderGoZ = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
    
    while (obj.pdf([leaderGoX leaderGoY leaderGoZ]) > random('unif', 0, 1))
        leaderGoX = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
        leaderGoY = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
        leaderGoZ = random('unif', minBoundryEnvironment, maxBoundryEnvironment);
    end
else
    ax = (2*(leaderGoX - leaderX)/t^2);
    ay = (2*(leaderGoY - leaderY)/t^2);
    az = (2*(leaderGoZ - leaderZ)/t^2);
    
    ax = CheckMax(ax, -aMax, aMax);
    ay = CheckMax(ay, -aMax, aMax);
    az = CheckMax(az, -aMax, aMax);
    
    leaderNew = [leaderX; leaderY; leaderZ] + ([ax ay az] * covariance)'*(t^2)/2;
    leaderX = leaderNew(1);
    leaderY = leaderNew(2);
    leaderZ = leaderNew(3);
end
end