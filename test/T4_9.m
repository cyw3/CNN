%���������ݶȷ���SCG��
%����˼�룺

%��ͬ�Ĺ����ݶȷ��Ĺؼ����� ��delta��ȡֵ��ͬ
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainscg');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)