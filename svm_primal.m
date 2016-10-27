function [beta,beta0,epsilon,C]=svm_primal(C1,C2,X,y)
    [n,p]=size(X);
    H=[eye(p),zeros(p,1+n);zeros(1+n,p+1+n)];
    f=[zeros(p+1,1);C1/2*(ones(n,1)+y)+C2/2*(ones(n,1)-y)];
    A1=[zeros(n,p+1),eye(n)];
    A2=repmat(y,1,p+1+n).*[X,ones(n,1),zeros(n,n)];
    A=[-A1-A2;-A1];
    b=[-ones(n,1);zeros(n,1)];
    alpha=quadprog(H,f,A,b);
    beta=alpha(1:p);
    beta0=alpha(p+1);
    epsilon=alpha(p+2:size(alpha));
    C=C1/2*(ones(n,1)+y)+C2/2*(ones(n,1)-y);
end
