function plot_result1(beta,beta0,epsilon,X,y)
    x1=X(:,1);x2=X(:,2);
    scatter(x1,x2,20,'k');
    hold on;
    xw11=X(intersect(find(epsilon>0.0001),find(y==1)),1);
    xw12=X(intersect(find(epsilon>0.0001),find(y==1)),2);
    xw21=X(intersect(find(epsilon>0.0001),find(y==-1)),1);
    xw22=X(intersect(find(epsilon>0.0001),find(y==-1)),2);
    scatter(xw11,xw12,20,'+');
    scatter(xw21,xw22,20,'*');
    x01 = linspace(-4,12);
    x02=-beta(1)/beta(2)*x01-beta0/beta(2);
    plot(x01,x02,'r');
    x02=-beta(1)/beta(2)*x01-(beta0-1)/beta(2);
    plot(x01,x02,'y');
    x02=-beta(1)/beta(2)*x01-(beta0+1)/beta(2);
    plot(x01,x02,'y');
    hold off;
end
