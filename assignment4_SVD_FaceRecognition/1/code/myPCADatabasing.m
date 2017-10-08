function [V, alpha, Average] = myPCADatabasing(k)

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
L = X'*X;
[W, D] = eig(L);
[~, permutation] = sort(diag(D), 'descend');
%D = D(permutation, permutation);
W = W(:, permutation);
W = W(:, 1:k);
V = X*W;
n = sqrt(sum(V.^2,1));
V = bsxfun(@rdivide, V, n);
alpha = V'*X;