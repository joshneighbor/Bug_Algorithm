function [path, dist_T] = computeBug1Trial(start, goal, obs, ss)
%input start and goal locations, list of obsticles (obs) and length of step
%size (ss).
%Output: A sequence which denotes the path from start to goal or if goal is
%not reachable, returns a failure message
current_position = start;
path = [start]; dist1 = [norm(start - goal)];

while norm(current_position - goal) > ss % run while distance to goal is greater than step size
    Direction_V = (goal - current_position)/norm(goal - current_position);% vector of normalized path to goal
    M = [];
    
    for i = 1:max(size(obs))  % iterates through different obsticles
        [D_poly] = computeDistancePointToPolygon(current_position, obs{i});
        M = [M; D_poly]; % keeps track of shortest distance to each obsticle
    end
    
    [ N , P] = min(M); % N saves min dist to obs and P stores indices of min obs
    
    if N < ss %  if the distance to obs is < step size
        
        q_start = current_position; % position when robot first encounters obstacle
        dist_g = [norm(q_start - goal)]; % keeps track of distance to goal
        condition_start = 0; % condition variable so we know when we have circled obsticle 
        MinimumDistance = inf; % initialize the min dist to goal as infinity
        
% % % %         while norm(q_start - current_position) < ss*1
% % % %             
% % % %             [unit_v,vertex] = computeTangentVectorToPolygon(current_position, obs{P});%move around obsticle
% % % % %             if vertex == 1
% % % % %                 sst = ss/50;
% % % % %             else
% % % % %                 sst = ss;
% % % % %             end
% % % %             current_position = current_position + (unit_v * ss/10).'; % sets new position as one step in the direction around obs
% % % %             path = [path;current_position]; %keep track of path to goal
% % % %         end
% % % %         norm(q_start - current_position)

        %Need this here so robot moves more than ss away from q_start
        [unit_v] = computeTangentVectorToPolygon(current_position, obs{P});%move around obsticle
        current_position = current_position + (unit_v * ss).'; % sets new position as one step in the direction around obs
        path = [path;current_position]; %keep track of path to goal
        dist_g = [dist_g ; norm(current_position - goal)];
        dist1 = [dist1, norm(current_position - goal)];

       while abs(MinimumDistance - norm(current_position - goal)) > ss % keep iterating until we have found min dist to goal along obs
           
           while condition_start == 0; % keeps iterating until traced entire circle
                
                [unit_v] = computeTangentVectorToPolygon(current_position, obs{P});%move around obsticle
                current_position = current_position + (unit_v * ss/4).'; % sets new position as one step in the direction around obs
                path = [path;current_position]; %keep track of path to goal
                dist_g = [dist_g ; norm(current_position - goal)];
                dist1 = [dist1, norm(current_position - goal)];

                if norm(current_position - q_start) < 1*ss
                    condition_start = 1; % exit while loup
                    MinimumDistance = min(dist_g); % stores shortest distance to goal.
                end
                
           end
           
            [unit_v] = computeTangentVectorToPolygon(current_position, obs{P});%move around obsticle
            current_position = current_position + (unit_v * ss/4).'; % sets new position as one step in the direction around obs
            path = [path;current_position]; %keep track of path to goal
            dist1 = [dist1, norm(current_position - goal)];
            
            
      end
       
    else
        current_position = current_position + (Direction_V * ss); % sets new position as one step in the direction of goal
        path = [path; current_position]; %keep track of path to goal
        dist1 = [dist1, norm(current_position - goal)];
        
    end
end


path = [path;goal]; % returns the complete path the bug took
dist_T = dist1;