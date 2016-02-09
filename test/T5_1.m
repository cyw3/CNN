
%GRNN网络，输出就相当于向量接近的样本期望值的加权均值
P = [4 5 6];
T = [1.5 3.6 6.7];

%生成GRNN网络
net = newgrnn(P,T);

v = sim(net,4.5);
v


