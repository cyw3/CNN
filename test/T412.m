%Levenberg-Marquardt训练方法
%使用H=J(T)J，替代Hessian矩阵
%g= J(T)e
%J是雅克比（Jacobian）矩阵,含有网络训练误差的一节导数，是权值和阈值的函数
%e是网络训练误差向量
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainlm');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
