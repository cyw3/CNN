%概率神经网络
%主要是用于模式分类问题

%PNN网络第一层的输入权值IW为输入样本的转置矩阵P'
P = [0 0;1 1;0 3;1 4;3 1;4 1;4 3]';
Tc = [1 1 2 2 3 3 3];

%期望值应用函数ind2vec()转换一下：
T = ind2vec(Tc);
T

%设计PNN网络，输出使用vec2ind()转换函数输出行向量的形式
net = newpnn(P,T);
Y = sim(net,P);
Yc = vec2ind(Y);

Y
Yc

%验证网络分类功能
P2 = [1 4;0 1;5 2]';

Y = sim(net,P2);
Yc = vec2ind(Y);

