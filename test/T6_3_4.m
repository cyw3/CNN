%Elam������Խ���ʱ���״̬ģʽ��ʶ��
%�����⣬�������Ĳ��ε����

%���Һ���
p1 = sin(1:20);
p2 = sin(1:20)*2;
%������������
t1 = ones(1,20);
t2 = ones(1,20)*2;

%�γ�����
p = [p1 p2 p1 p2]
t = [t1 t2 t1 t2]

time = 1:80;
plot(time,p,time,t,'--');
title('�����źż�Ŀ���ź�');
xlabel('ʱ��');
ylabel('���뼰Ŀ��');

%��������ʽ������ת����������ʽ
Pseq = con2seq(p)
Tseq = con2seq(t)

%�����ʼ��
%����������һ��������ֵ(�������ź�)��������ÿһ��ʱ�䲽������һ����ֵ(�����ֵ)
R = 1;
S2 = 1;
%���������
S1 = 10;
net = newelm([-2 2],[S1 S2],{'tansig','purelin'},'traingdx');

net.trainParam.epochs = 500;
net.trainParam.goal = 0.01;

[net,tr] = train(net,Pseq,Tseq);
semilogy(tr.epoch,tr.perf);
title('Elam����ľ�����');
xlabel('����');
ylabel('������');

%�������
a = sim(net,Pseq);
time = 1:length(p);
plot(time,t,'--',time,cat(2,a{:}));
title('���������Ŀ���ź�');
xlabel('ʱ��');
ylabel('�����Ŀ��');

p3 = sin(1:20)*1.6;
t3 = ones(1,20)*1.6;
p4 = sin(1:20)*1.2;
t4 = ones(1,20)*1.2;
pg = [p3 p4 p3 p4];
tg = [t3 t4 t3 t4];
pgseq = con2seq(pg);
������
a2 = sim(net,pgseq);

time = 1:length(pg);
plot(time,tg,'--',time,cat(2,a2{:}));
title('����źż�Ŀ���ź�');
xlabel('ʱ��');
ylabel('�����Ŀ��');