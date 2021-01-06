function t = is_interface(i,j,k,solid,N)
    if s1(i,j,k)==1
        for x = -1:1
            for y = -1:1
                for z = -1:1
                            if (((i + x) > 0 && (j + y) > 0 && (k + z) > 0 && (i + x) < N + 1 && (j + y) < N + 1 && (k + z) < N + 1))
                                if solid(i+x,j+y,k+z)==0
                                    solid(i,j,k)=2
%                                 switch (abs(x) + abs(y) + abs(z))
%                                     case 0
%                                         solid(i+x,j+y,k+z) = 1;
%                                     case 1             % face neighbour
%                                         if (rand() < ps)
%                                             solid(i+x,j+y,k+z) = 1;
%                                         end
%                                     case 2             % edge neighbour
%                                         if (rand() < pe)
%                                             solid(i+x,j+y,k+z) = 1;
%                                         end
%                                     case 3             % point neighbour
%                                         if (rand() < pp) 
%                                             solid(i+x,j+y,k+z) = 1;
%                                         end
%                                 end                               
                            end
                        end
                    end
                end
            end
        end
    end