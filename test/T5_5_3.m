%Ӧ��GRNN���к����ƽ�
P = [1 2 3 4 5 6 7 8];
T = [0 1 2 3 2 1 2 1];

plot(P,T,'.','markersize',30);
axis([0 9 -1 4])
title('���ƽ�����');
xlabel('P');
ylabel('T');

%ɢ������spread��ѡȡ����������֮��ľ���1��Сһ�㣬ɢ������ԽС���������Խ�ã��������߹⻬��Խ��
spread = 0.7;
net = newgrnn(P,T,spread);

%�������
A = sim(net,P);
hold on
outputline = plot(P,A,'o','markersize',10,'color',[1 0 0]);
title('�������');
xlabel('P');
ylabel('T��A');

%����
p = 3.5;
a = sim(net,p);
plot(p,a,'+','markersize',10,'color',[1 0 0]);
title('������ֵ');
xlabel('P��p');
ylabel('T��a');

P2 = 0:.1:9;
A2 = sim(net,P2);
plot(P2,A2,'linewidth',4,'color',[1 0 0]);
title('�ƽ�����');
xlabel('P��P2');
ylabel('T��A2');


