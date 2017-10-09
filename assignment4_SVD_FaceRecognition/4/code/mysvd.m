
n [U,S,V] = mysvd(A)
    %% A = USV'
        % AA' = US2U'
        % A'A = VS2V'
    A1 = A*A';
    A2 = A'*A;
    P1 = eye(size(A));
    P1 = flip(P1,1);
    [U1, e1] = eig(A1);
    %U1(:,end) = -U1(:,end);
    U = U1 * P1;
    
    
    [V1,e3] = eig(A2);
    %V1(:,end) = -V1(:,end);
    V = V1 * P1;
    
    
    S = e1.^(1/2);
    S = real(S);
    S = P1 * S * P1;
    
    [m,n] = size(A);
    for i=1:n
        a1 = A*V(:,i);
        b1 = U(:,i);
        if (dot(a1,b1) <= 0)
            V(:,i) = -V(:,i);
        end
    end
    
end
