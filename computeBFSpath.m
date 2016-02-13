function [Path] = computeBFSpath(G, start, goal)
%input: a graph described by its adjacency table, a start node, and a goal
%node.
%Output: a ptha from stst to goal along the BFS tree rooted at start

[tree, parent_list]= computeBFStree(G, start); % access parent_list

num_nodes = max(size(tree)); % stores number or nodes

for i=1:num_nodes % iterates through number of nodes
node(i)=tree(1,i);    % nodes of the tree, tree taken from computeBFtree
end
for i=2:num_nodes
       parent(node(i)) = parent_list(i);  %assign parents to the parent list
end
parent(node(1)) = node(1);
Path = [goal];  % initiate a Path vector which starts at goal node
u = goal;
while parent(u)~= u  % traverse until you reach the root node
    u =parent(u);
    Path = [u Path];  % add u to front of path because we are working backwards to start
end
end