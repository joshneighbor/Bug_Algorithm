% Bug 1 test script
% algorithm should circle each obsticle, remember the closest location to goal
% return to that location and move towards goal from there

clear
start = [0 0]; goal = [5 3];
ss = .1;
obs = {[1 2], [1 0], [3 0]; [2 3] [4 1] [5 2]};


[path, dist_T] = computeBug1(start, goal, obs, ss)

figure
plot(path(:,1),path(:,2))

figure
plot(dist_T)