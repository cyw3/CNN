%�����ݶ��½���
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];


%��������ѹ��������Ӱ�죬Ȩֵ����ȡ���� ����������������
%��ǰ����ѵ��ʱ������������û�иı䣬Ȩֵ����ֵ���������Ų���delt_inc����
%�иı�ʱ�����Ų���delt_dec��С
%Ϊ0ʱ������ֵ����
net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainrp');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
