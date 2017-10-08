function [ U, alpha,Average ] = mySVDDatabasing( k )

s = '../../../att_faces/s';
f = im2double(imread(strcat(s,int2str(1),'/',int2str(1),'.pgm')));
f = f(:);
A = f;  
for i=1:32
    for j = 1:6 
        f = im2double(imread(strcat(s,int2str(i),'/',int2str(j),'.pgm')));
        f = f(:);
        if i + j == 2
            continue;
        end
        A = [A f];
    end
end
Average = mean(A, 2);
X = bsxfun(@minus, A, Average);
[U, S, ~] = svd(X);
[~, permutation] = sort(diag(S), 'descend');
S = S(permutation, permutation);
U = U(:, permutation);
U = U(:, 1:k);
n = sum(U.^2,1);
U = bsxfun(@rdivide, U, n);
alpha = U'*X;
end

