%弹性梯度下降法
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];


%消除“挤压”函数的影响，权值修正取决于 函数导数的正负号
%当前两次训练时导数的正负号没有改变，权值和阈值的修正随着参数delt_inc增加
%有改变时，随着参数delt_dec减小
%为0时，修正值不变
net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainrp');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
