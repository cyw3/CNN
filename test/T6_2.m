%Elman神经网络

%随机产生二值向量
P = round(rand(1,8));
%转换成单元排列形式
Pseq = con2seq(P)

%初始化网络，并对输入值仿真计算
net = newelm([0 1],[5,1],{'tansig','logsig'});

Y = sim(net,Pseq);
Y

%转换输出量为向量形式
z = seq2con(Y);
z{1,1}




















