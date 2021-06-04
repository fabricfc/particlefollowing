function [ vectorX, vectorY, vectorZ ] = ...
    FollowLeader(leaderX, leaderY, leaderZ, nmrParticulas, vectorX, vectorY, vectorZ)
%FOLLOWLEADER Summary of this function goes here
%   Detailed explanation goes here

t = 1;
aMax = 2;
covariance = [.5 .1 .3; .1 .5 .1; .3 .1 .5];

for i=1:nmrParticulas
    particleI = [vectorX(i); vectorY(i); vectorZ(i)];
    
    ax = (2* (random('norm', leaderX, 4) - particleI(1))/t^2);
    ay = (2* (random('norm', leaderY, 4) - particleI(2))/t^2);
    az = (2* (random('norm', leaderZ, 4) - particleI(3))/t^2);    
        
    ax = CheckMax(ax, -aMax, aMax);
    ay = CheckMax(ay, -aMax, aMax);
    az = CheckMax(az, -aMax, aMax);    

    particleNew = particleI + ([ax ay az] * covariance)'*(t^2)/2;
    
%     distance1 = EuclideanDistance3( ...
%         particleI(1), particleI(2), particleI(3),...
%         leaderX, leaderY, leaderZ);
%     
%     distance2 = EuclideanDistance3( ...
%         particleNew(1), particleNew(2), particleNew(3),...
%         leaderX, leaderY, leaderZ);
%         
%     while (distance2 > distance1)
%         ax = random('unif', -1, 1);
%         ay = random('unif', -1, 1);
%         az = random('unif', -1, 1);
% 
%         
% 
%         particleNew = particleI + [ax; ay; az]*(t^2)/2;
%         
%         distance2 = EuclideanDistance3( ...
%             particleNew(1), particleNew(2), particleNew(3),...
%             leaderX, leaderY, leaderZ);
%     end
    
    
    vectorX(i) = particleNew(1);
    vectorY(i) = particleNew(2);
    vectorZ(i) = particleNew(3);
end

end

