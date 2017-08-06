x = rand(50000, 1);
y = rand(50000, 1);
z = rand(50000, 1);

tic
minDistance(x, y, z);
toc

tic
minD_vec(x, y, z);
toc
