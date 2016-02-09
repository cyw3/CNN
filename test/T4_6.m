%共轭梯度法

%弥补梯度法震荡和收敛性差的缺陷
%基本思想：寻找与负梯度方向和上一次搜索方向共轭的方向作为新的搜索方向
%加快训练速度，体改训练精度.速度快，少存储空间

%初始方向是负梯度
%新一轮方向是共轭方向，一般是当前负梯度方向上附加上上一次搜索方向：
%   Pk = -gk + delta*P(k-1)


%不同的共轭梯度法的关键在于 ，delta的取值不同
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

%Fletcher-Reeves共轭梯度法
net = newff(minmax(p),[3,1],{'tansig','purelin'},'traincgf');
net.trainParam.show = 5;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)



