%拟牛顿算法
%收敛速度比共轭梯度法，更快特别是对于维数较高的问题
%基本思想：引进一组矩阵来代替Hessian阵，既不需要计算二次导数，又能很好的逼近，避免了繁琐的计算

%替代的Hessian阵需要不断的修正。BFGS你牛顿回退法

%一般的牛顿法中迭代要用到的当前表现函数的二次导数（Hessian阵）Ak
%牛顿法收敛速度快，在一次迭代中，牛顿法都需要计算出表现函数的二次导数——Hessian阵
%

%不同的共轭梯度法的关键在于 ，delta的取值不同
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainbfg');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
