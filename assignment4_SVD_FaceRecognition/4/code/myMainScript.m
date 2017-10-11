%% Q4. SVD using Eigen Decomposition
% Dhruv Ilesh Shah, Dhanvi Sreenivasan and Bhavesh Thakkar

%% mySVD.m
% <include>mySVD.m</include>

%% Validation

A = rand(7);
[U S V] = mySVD(A);
err = A - U*S*V';
% err is the difference matrix of the original and reconstructed A

disp(norm(err))
% Clearly, we see that the reconstruction is perfect (floating point accuracy)
% and hence, the routine works as required.