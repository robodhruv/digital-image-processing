function [U,alpha, A,Average, B] = mySVDYaleDatabasing( k )

s = '../../../CroppedYale/';
B = dir(s);
B = B(3:end,:);
A = zeros(192*168, 1);  
for i=1:38
    D = dir(strcat(s,B(i).name));
    D = D(3:end, :);
    for j = 1:40
        f = im2double(imread(strcat(s,B(i).name,'/',D(j).name)));
        f = f(:);
        A = [A f];
    end
end
A = A(:, 2:end);
Average = mean(A, 2);
X = bsxfun(@minus, A, Average);
[U, S, ~] = svd(X, 'econ');
[~, permutation] = sort(diag(S), 'descend');
%S = S(permutation, permutation);
U = U(:, permutation);
U = U(:,1:k);
n = sum(U.^2,1);
U = bsxfun(@rdivide, U, n);
alpha = U'*X;
end

