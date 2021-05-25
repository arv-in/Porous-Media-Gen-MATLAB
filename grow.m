function [solid] = grow(s1,N,phi,ps)
solid = zeros(N,N,N);
phi_c =1;    % Initially no matrix => poroosity =1
while (phi_c>phi)
for i = 1:N
    for j = 1:N
        for k = 1:N
            if s1(i,j,k)==1
                for x = -1:1
                    for y = -1:1
                        for z = -1:1
                            if (((i + x) > 0 && (j + y) > 0 && (k + z) > 0 && (i + x) < N + 1 && (j + y) < N + 1 && (k + z) < N + 1))
                                switch (abs(x) + abs(y) + abs(z))
                                    case 0
                                        solid(i+x,j+y,k+z) = 1;
                                    case 1             % face neighbour                           
                                            if (rand() < ps(i,j,k))
                                                solid(i+x,j+y,k+z) = 1;
                                            end
                                    case 2             % edge neighbour
                                        pe = ps(i,j,k);
                                        if (rand() < 0.125*pe)
                                            solid(i+x,j+y,k+z) = 1;
                                        end
                                    case 3             % point neighbour
                                        pp = ps(i,j,k)/96.0; 
                                        if (rand() < pp) 
                                            solid(i+x,j+y,k+z) = 1;
                                        end
                                end                               
                            end
                        end
                    end
                end
            end
        end
    end
end

matrix = sum(sum(sum(solid)));
phi_c = 1-(matrix/(N*N*N))

s1 = solid;
end

end
