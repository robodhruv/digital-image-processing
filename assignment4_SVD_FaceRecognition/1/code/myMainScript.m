%% MyMainScript

tic;
%% Your code here
%k = [0 1 2 3 5 10 15 20 30 50 75 100 150 170];
%%
%rec_rate = arrayfun(@(x) myPCAChecker(x), k);
%plot(k,rec_rate);
%%
%rec_rate_SVD = arrayfun(@(x) mySVDChecker(x), k);
%plot(k, rec_rate_SVD);
%%
k1 = [5 10 15 20 30 50 60 65 75 100 200 300 500 1000];
[rec_rate_yale, rec_ratet_yale] = arrayfun(@(x) mySVDYaleChecker(x), k1);
plot(k1, rec_rate_yale);
hold on;
plot(k1, rec_ratet_yale);
toc;
