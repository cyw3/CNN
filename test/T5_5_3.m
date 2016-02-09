%应用GRNN进行函数逼近
P = [1 2 3 4 5 6 7 8];
T = [0 1 2 3 2 1 2 1];

plot(P,T,'.','markersize',30);
axis([0 9 -1 4])
title('待逼近函数');
xlabel('P');
ylabel('T');

%散布常数spread的选取比输入向量之间的距离1稍小一点，散布常数越小，数据拟合越好，但是曲线光滑度越差
spread = 0.7;
net = newgrnn(P,T,spread);

%网络测试
A = sim(net,P);
hold on
outputline = plot(P,A,'o','markersize',10,'color',[1 0 0]);
title('检测网络');
xlabel('P');
ylabel('T和A');

%测试
p = 3.5;
a = sim(net,p);
plot(p,a,'+','markersize',10,'color',[1 0 0]);
title('新输入值');
xlabel('P和p');
ylabel('T和a');

P2 = 0:.1:9;
A2 = sim(net,P2);
plot(P2,A2,'linewidth',4,'color',[1 0 0]);
title('逼近函数');
xlabel('P和P2');
ylabel('T和A2');


