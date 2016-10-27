%svm_primal
X=hdf5read('toy.hdf5','/X');
y=hdf5read('toy.hdf5','/y');

C11=1;C21=1;
[beta11,beta011,epsilon]=svm_primal(C11,C21,X,y);
plot_result1(beta11,beta011,epsilon,X,y);

C12=1;C22=10;
[beta12,beta012,epsilon]=svm_primal(C12,C22,X,y);
plot_result1(beta12,beta012,epsilon,X,y);

C13=10;C23=1;
[beta13,beta013,epsilon]=svm_primal(C13,C23,X,y);
plot_result1(beta13,beta013,epsilon,X,y);


%svm_dual
X=hdf5read('toy.hdf5','/X');
y=hdf5read('toy.hdf5','/y');

[beta21,beta021,alpha1]=svm_dual(C11,C21,X,y);
plot_result2(beta11,beta011,alpha1,X,y);

[beta22,beta022,alpha2]=svm_dual(C12,C22,X,y);
plot_result2(beta12,beta012,alpha2,X,y);

[beta23,beta023,alpha3]=svm_dual(C13,C23,X,y);
plot_result2(beta13,beta013,alpha3,X,y);


%4.b.v
classification_error(C11,C21,beta11,beta011,X,y)
classification_error(C12,C22,beta12,beta012,X,y)
classification_error(C13,C23,beta13,beta013,X,y)
