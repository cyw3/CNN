%径向基函数网络
%多用于函数逼近、分类

%1、问题提出
P = -1:0.1:1;
T = [-.9602 -.5770 -.0729 .3771 .6405 .6600 .4609...
    .1336 -.2013 -.4344 -.5000 -.3930 -.1647 .0988...
    .3072 .3960 .3449 .1816 -.0312 -.2189 -.3201];

plot(P,T,'+');
title('训练样本');
xlabel('输入向量P');
ylabel('目标向量T');

%目标是：找到一个函数，能够满足这些数据点的输入输出关系的。曲线拟合

%2、网络设计
%两层，隐层是径向基神经元，输出层是线性神经元
p = -3:.1:3;
%radbas高斯函数
a = radbas(p);
plot(p,a);
title('径向基函数传递函数');
xlabel('输入p');
ylabel('输出a');

a2 = radbas(p-1.5);
a3 = radbas(p+2);
a4 = a + a2*1 + a3*0.5;
plot(p,a,'b-',p,a2,'b-',p,a3,'b-',p,a4,'m--');
title('径向基传递函数权值之和');
xlabel('输入p');
ylabel('输出a');

%调整权值、阈值，即改变径向基函数的位置和宽度，实现任何曲线的你和

%newrb()构建一个径向基函数网络，自动根据输入向量和期望值调整、
%设定均方差进度eg、散布常数sc
eg = 0.02;
sc = 1;
net = newrb(P,T,eg,sc);

%NEWRB, neurons = 6, MSE = 0.00046188

%3、网络测试
%将输出与期望值绘制在一张图上。
plot(P,T,'+');
xlabel('输入');
X = -1:.01:1;
Y = sim(net,X);
hold on;
plot(X,Y);
hold off;
legend({'输入','输出'});


