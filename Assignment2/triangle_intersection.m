function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************
flag = true;
reward = 0;
triangle = [P1(:,1), P2(:,1); P1(:,2), P2(:,2)];
for m = triangle
    for i = 1:3 
        iNeighbor = i + 1;
        if iNeighbor > 3
            iNeighbor = 1;
        end

        jNeighbor = iNeighbor + 3;
        j = i + 3;
        
        dy = m(jNeighbor) - m(j);
        dx = m(iNeighbor) - m(i);
        
        slope = dy / dx;
        bias = m(j) - slope * m(i);
        
        iVertex = 6 - (i+iNeighbor);
        jVertex = iVertex + 3;
        
        if abs(slope) == Inf
            sgn = m(i) - m(iVertex);
        else
            sgn = (m(jVertex) - slope * m(iVertex)) - bias;
        end
        
        if sgn
            sgn = sgn / abs(sgn);
        end
        
        for n = triangle
            if n == m
                continue;
            end

            for v = 1:3
                w = v + 3;
                
                if abs(slope) == Inf
                    side = m(i) - n(v);
                else
                    side = (n(w) - slope * n(v)) - bias;
                end
                
                if side
                    side = side / abs(side);
                end
                
                if (side + sgn)
                    reward = 0;
                    break;
                else
                    reward = reward + 1;
                    continue;
                end
            end
        end
        
        if reward >= 3
            flag = false;
            break;
        end
    end
    
    if flag == false
        break;
    end
end

% *******************************************************************
end