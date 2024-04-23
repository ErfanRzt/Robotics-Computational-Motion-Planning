function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);

%%% All of your code should be between the two lines of stars.
% *******************************************************************
route = [start_coords];
position = start_coords;

step = sqrt(gx.^2 + gy.^2);
gx = gx ./step;
gy = gy ./step;

for i = 1:max_its
    goal_distance = sqrt( (position(1)-end_coords(1))^2 + (position(2)-end_coords(2))^2 );
    
    if goal_distance < 2.00
        break;
    end
    
    delta = [ gx( round(position(2)), round(position(1)) ), ...
              gy( round(position(2)), round(position(1)) )];
    successive_pos = position + delta;
    
%     round(successive_pos);
    
    if round(successive_pos(1)) <= size(f, 2) && round(successive_pos(1)) >= 1
        position(1) = successive_pos(1);
    end
    
    if round(successive_pos(2)) <= size(f, 1) && round(successive_pos(2)) >= 1
        position(2) = successive_pos(2);
    end
    
    route = [route; position];

end

% *******************************************************************
end
