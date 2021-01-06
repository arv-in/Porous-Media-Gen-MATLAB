tic

N = 300;
phi = 0.4;
cd = 0.01;
%ps = 0.1;    %p_surface

ps = 0.1*rand(N,N,N);


%pe = ps/12.0;   %p_edge
%pp = pe/8.0;   % p_point

Grow_times = 0;

s1 = gen_core(cd,N);
%s2 = gen_core(0.02,N);
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
                                        if (rand() < pe)
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

% name = 'phi0o40cd0o0o01ps0o1_qsgs_matlab'
% string = sprintf('%s.dat',name)
% dlmwrite(string,s1,'delimiter',' ')

toc
for b = 1:N
imshow(solid(:,:,b))
end
%% Output to palabos

% for i = 1:N
%     for j = 1:N
%         for k = 1:N
%             if solid(i,j,k)==1
%                 for x = -1:1
%                     for y = -1:1
%                         for z = -1:1
%                             if (((i + x) > 0 && (j + y) > 0 && (k + z) > 0 && (i + x) < N + 1 && (j + y) < N + 1 && (k + z) < N + 1))
%                                 if solid(i+x,j+y,k+z) == 0
%                                     solid(i,j,k) = 2;
% %                                 switch (abs(x) + abs(y) + abs(z))
% %                                     case 0
% %                                         solid(i+x,j+y,k+z) = 1;
% %                                     case 1             % face neighbour
% %                                         if (rand() < ps)
% %                                             solid(i+x,j+y,k+z) = 1;
% %                                         end
% %                                     case 2             % edge neighbour
% %                                         if (rand() < pe)
% %                                             solid(i+x,j+y,k+z) = 1;
% %                                         end
% %                                     case 3             % point neighbour
% %                                         if (rand() < pp) 
% %                                             solid(i+x,j+y,k+z) = 1;
% %                                         end
%                                  end                               
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end
% solid = solid./2;
% imshow(solid(:,:,50))