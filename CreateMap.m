function [handler handlerTargets vectorX, vectorY, vectorZ ] = ... 
    CreateMap(nmrParticulas, minBoundryEnvironment, maxBoundryEnvironment)
%CREATEMAP Summary of this function goes here
%   Detailed explanation goes here    
     
    [vectorX vectorY vectorZ] = ResetPositions( ... 
        true, nmrParticulas, minBoundryEnvironment, maxBoundryEnvironment);
    
    % Create figure
    figure1 = figure('xvisual',...
        '0x27 (truecolor, depth 24, rgb mask 0xff0000 0xff00 0x00ff)');
    
    % create axes
    axes1 = axes('parent',figure1);
    % uncomment the following line to preserve the x-limits of the axes
    xlim(axes1,[minBoundryEnvironment maxBoundryEnvironment]);
    % uncomment the following line to preserve the y-limits of the axes
    ylim(axes1,[minBoundryEnvironment maxBoundryEnvironment]);
    % uncomment the following line to preserve the z-limits of the axes
    zlim(axes1,[minBoundryEnvironment maxBoundryEnvironment]);
    grid(axes1,'on');
    hold(axes1,'all');
    
    hold on;
    handler = plot3(vectorX, vectorY, vectorZ, 'b*');
    handlerTargets = plot3(0, 0, 0, 'r+');
    hold off;
end

