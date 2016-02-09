%自组织竞争神经网络
p = [.1 .8 .1 .9; .2 .9 .1 .8]

net = newc([0 1;0 1],2);
wts = net.IW{1,1}
biases = net.b{1}
net.trainParam.epochs = 500;

%向量聚类分析
%权值调整使用的Kohonen学习规则，阈值调整使用的阈值学习规则
net = train(net,p);

net.trainFcn

a = sim(net,p)
ac = vec2ind(a)

wts = net.IW{1,1}
biases = net.b{1}
