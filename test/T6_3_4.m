%Elam网络可以进行时间和状态模式的识别
%振幅检测，输出输入的波形的振幅

%正弦函数
p1 = sin(1:20);
p2 = sin(1:20)*2;
%期望输出的振幅
t1 = ones(1,20);
t2 = ones(1,20)*2;

%形成序列
p = [p1 p2 p1 p2]
t = [t1 t2 t1 t2]

time = 1:80;
plot(time,p,time,t,'--');
title('输入信号及目标信号');
xlabel('时间');
ylabel('输入及目标');

%将矩阵形式的样本转换成序列形式
Pseq = con2seq(p)
Tseq = con2seq(t)

%网络初始化
%网络检输出测一个单输入值(即波形信号)，并且在每一个时间步长都有一个单值(即振幅值)
R = 1;
S2 = 1;
%反馈网络层
S1 = 10;
net = newelm([-2 2],[S1 S2],{'tansig','purelin'},'traingdx');

net.trainParam.epochs = 500;
net.trainParam.goal = 0.01;

[net,tr] = train(net,Pseq,Tseq);
semilogy(tr.epoch,tr.perf);
title('Elam网络的均方差');
xlabel('步长');
ylabel('均方差');

%网络测试
a = sim(net,Pseq);
time = 1:length(p);
plot(time,t,'--',time,cat(2,a{:}));
title('网络输出和目标信号');
xlabel('时间');
ylabel('输出和目标');

p3 = sin(1:20)*1.6;
t3 = ones(1,20)*1.6;
p4 = sin(1:20)*1.2;
t4 = ones(1,20)*1.2;
pg = [p3 p4 p3 p4];
tg = [t3 t4 t3 t4];
pgseq = con2seq(pg);
。‘；
a2 = sim(net,pgseq);

time = 1:length(pg);
plot(time,tg,'--',time,cat(2,a2{:}));
title('输出信号及目标信号');
xlabel('时间');
ylabel('输出及目标');