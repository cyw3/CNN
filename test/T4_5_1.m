%���ñ��ƽ�����Ϊ���Һ���
%Ƶ�ʲ�����Ϊk=1��n=10
k =1;
p = [-1:0.05:1];
t = sin(k*pi*p);

plot(p,t,'-');
title('Ҫ�ƽ��ķ����Ժ���');
xlabel('ʱ��');
ylabel('�����Ժ���');

%������Ԫ��Ŀ
n = 5;
net = newff(minmax(p),[n,1],{'tansig','purelin'},'trainlm');
y1 = sim(net,p);

%�����������
figure;                                                                           
plot(p,t,'-',p,y1,'--')
title('δѵ�������������');
xlabel('ʱ��');
ylabel('�������--  ԭ����-');

%����ѵ��
net.trainParam.epochs = 50;
net.trainParam.goal = 0.01;
net = train(net,p,t);

%�������
y2 = sim(net,p);

figure;
plot(p,t,'-',p,y1,'--',p,y2,'--');
title('ѵ���������������');
xlabel('ʱ��');
ylabel('�������');

%��������Գ̶�Խ�ߣ�����BP�����Ҫ��Խ�ߡ�
%������Ԫ����ĿԽ�࣬BP����ƽ������Ժ���������Խǿ��ѵ��ʱ��Ҳ��Խ��

%�ı�����Ժ�����Ƶ�ʺ�BP����������Ԫ����Ŀ





