%ɢ�������Ծ��������������Ƶ�Ӱ��
%һ������£�ɢ��������ѡȡȡ������������֮��ľ��룬Ҫ�������С���룬С��������

%1��Ƿ������Ԫ
%����������Ԫ��ɢ��������С����������н���Ҫ�������Ԫ��Ŀ
P = -1:0.1:1;
T = [-.9602 -.5770 -.0729 .3771 .6405 .6600 .4609...
    .1336 -.2013 -.4344 -.5000 -.3930 -.1647 .0988...
    .3072 .3960 .3449 .1816 -.0312 -.2189 -.3201];

plot(P,T,'+');
title('ѵ������');
xlabel('��������P');
ylabel('Ŀ������T');

eg = 0.02;
sc = .01;
net = newrb(P,T,eg,sc);

X = -1:0.01:1;
Y = sim(net,X);
hold on;
plot(X,Y);
hold off;



