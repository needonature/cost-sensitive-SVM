function err=classification_error(C1,C2,beta1,beta01,X,y)
    [n,p]=size(X);
    result=sum([X*beta1,repmat(beta01,n,1)],2);
    z=y(find(result.*y<0));
    err=sum(C1/2*(1+z)+C2/2*(1-z));
end
