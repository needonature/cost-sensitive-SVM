function [beta,beta0,alpha]=svm_dual(C1,C2,X,y)
    [n,p]=size(X);
    X_=diag(y)*X;
    H=X_*X_';
    f=-ones(n,1);
    A=[eye(n);-eye(n)];
    C=C1/2*(ones(n,1)+y)+C2/2*(ones(n,1)-y);
    b=[C;zeros(n,1)];
    Aeq=y';
    beq=0;
    alpha=quadprog(H,f,A,b,Aeq,beq);
    beta=sum(diag(alpha)*diag(y)*X)';
    m=intersect(find(abs(alpha-C)>=0.0001),find(alpha>0.0001));
    z=y-X*beta;
    beta0=sum(z(m))/length(m);
end
