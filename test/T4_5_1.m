%设置被逼近函数为正弦函数
%频率参数设为k=1，n=10
k =1;
p = [-1:0.05:1];
t = sin(k*pi*p);

plot(p,t,'-');
title('要逼近的非线性函数');
xlabel('时间');
ylabel('非线性函数');

%隐层神经元数目
n = 5;
net = newff(minmax(p),[n,1],{'tansig','purelin'},'trainlm');
y1 = sim(net,p);

%网络输出曲线
figure;                                                                           
plot(p,t,'-',p,y1,'--')
title('未训练网络的输出结果');
xlabel('时间');
ylabel('仿真输出--  原函数-');

%网络训练
net.trainParam.epochs = 50;
net.trainParam.goal = 0.01;
net = train(net,p,t);

%网络测试
y2 = sim(net,p);

figure;
plot(p,t,'-',p,y1,'--',p,y2,'--');
title('训练后网络的输出结果');
xlabel('时间');
ylabel('仿真输出');

%网络非线性程度越高，对于BP网络的要求越高。
%隐层神经元的数目越多，BP网络逼近非线性函数的能力越强，训练时间也就越长

%改变非线性函数的频率和BP网络隐层神经元的数目





