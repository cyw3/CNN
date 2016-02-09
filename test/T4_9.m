%量化共轭梯度法（SCG）
%基本思想：

%不同的共轭梯度法的关键在于 ，delta的取值不同
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainscg');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
