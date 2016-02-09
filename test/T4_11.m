%一步正割法OSS
%在每一次的迭代中，假设上一次的循环的Hessian阵是恒定矩阵，省去矩阵求逆的步骤
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainoss');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
