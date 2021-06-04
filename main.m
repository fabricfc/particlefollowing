clear all;
close all;
clc;

nmrParticulas = 500;
minBoundryEnvironment = 1;
maxBoundryEnvironment = 1000;

leaderX = 250;
leaderY = 250; 
leaderZ = 250;

leaderGoX = 250;
leaderGoY = 250;
leaderGoZ = 250;

[handler handlerTargets vectorX, vectorY, vectorZ] = ...
    CreateMap(nmrParticulas, minBoundryEnvironment, maxBoundryEnvironment);


while (1)
%     pause(1);

%     Random movement
%     [vectorX vectorY vectorZ] = ResetPositions( ...
%         true, nmrParticulas, minBoundryEnvironment, maxBoundryEnvironment);
    
    [leaderX leaderY leaderZ leaderGoX leaderGoY leaderGoZ] = ...
        LeaderMoviment(leaderX, leaderY, leaderZ, ...
        minBoundryEnvironment, maxBoundryEnvironment, ...
        leaderGoX, leaderGoY, leaderGoZ, ...
        nmrParticulas, vectorX, vectorY, vectorZ);

%     Follow the leader movement
    [vectorX vectorY vectorZ] =...
        FollowLeader(leaderX, leaderY, leaderZ, nmrParticulas, vectorX, vectorY, vectorZ);
    
    set(handlerTargets, 'xdata', leaderX, 'ydata', leaderY, 'zdata', leaderZ);
    set(handler, 'xdata', vectorX, 'ydata', vectorY, 'zdata', vectorZ);
    
    drawnow;
end