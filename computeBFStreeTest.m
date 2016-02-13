function [tree, parent_list] = computeBFStreeTest(G, start)
                                       
% Input: a graph 'G' described by its adjacency table AdjTable and start node
% Output: pointers 'parents' describing the BFS tree rooted at 'start' and
% tree

G = {[2],[1 3 4],[2 5],[2],[3]}; % Sample G
start = [3]; %Sample Start

Q =[]; % initialize a Queue
size_G = max(size(G)); %Number of Nodes

for i=1:size_G %iterate through labeling creating nodes
node(i)=i;
end
Q = [Q node(start)]; % update our Q adding in the node we are starting from
for i=1:size_G
    parent(node(i)) = inf; %iterate through greating parent array, filling with infitity
end
parent(node(start)) = node(start); %labeling our start node in parent array

tree = []; % ititializing our tree
parent_list = 0;
while size(Q)> 0; % will loop until Q is empty
    v = Q(1); % sets v to be the first term in our queue
    tree = [tree Q(1)]; % moving first term in our queue into new array, initial first term will be start node
    Q(1)=[]; % remove the node we just added to tree from our queue
    neighbors = size(G{v}(1,:)); % creates list of neighbors to the nodes
    for j=1:neighbors(2) % iterates throught the neighbors
      u = G{v}(1,j); % sets u as a specific neighbor node from neighbors list
      if parent(u) == inf % if the parent of that node has not been labeled then set that node as v
        parent(u) = v; 
        Q = [Q u]; %updates the queue
        parent_list= [parent_list v]; %add to parent list which we return at the end
      end
    end
end
parent_list
end
