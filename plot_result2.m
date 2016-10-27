function plot_result2(beta1,beta01,alpha,X,y)
    [n,p]=size(X);
    distance=y.*sum([X*beta1,repmat(beta01,n,1)],2);
    scatter(distance,alpha);
    xlabel('distance');
    ylabel('\alpha');
end
