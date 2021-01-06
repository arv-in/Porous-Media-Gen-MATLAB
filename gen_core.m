function [s] = gen_core(cd,N)
    a = randperm(N*N*N);% creates randomized array of length n-cube
    a = a./(N*N*N);             % converting a in range 0 to 1
    a = im2bw(a,cd);             % binarizing a  below cd 0 (black - matrix)
    a = 1.-a;                       % converting below cd values to 1 (white- matrix origin point)
    s = reshape(a,N,N,N);          % converting a to 3d array
    %imshow(s(:,:,50))
end
