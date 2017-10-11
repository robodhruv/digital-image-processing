%% MyMainScript

tic;
%%
input_img=imread('../images/yaleB04_P00A-005E-10.pgm');
input_img=im2double(a);
U = mySVDYaleDatabasing(); %Gives us the orthogonal matrix U
%imshow(mySVDYaleReconstructor(input_img, U ,25 ));
K= [2 10 20 50 75 100 125 150 175]
%%
figure('Position', [100, 100, 800, 800])
for i=1:9
    subplot(3,3,i);
    subimage(mySVDYaleReconstructor(input_img, U, K(i)));
    title(strcat('k = ', int2str(K(i))))
end
    



%%
toc;
