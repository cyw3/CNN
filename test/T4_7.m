%不同的共轭梯度法的关键在于 ，delta的取值不同
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

%Polak-Ribiere共轭梯度法
net = newff(minmax(p),[3,1],{'tansig','purelin'},'traincgp');
net.trainParam.show = 5;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
