%�����ݶȷ�

%�ֲ��ݶȷ��𵴺������Բ��ȱ��
%����˼�룺Ѱ���븺�ݶȷ������һ������������ķ�����Ϊ�µ���������
%�ӿ�ѵ���ٶȣ����ѵ������.�ٶȿ죬�ٴ洢�ռ�

%��ʼ�����Ǹ��ݶ�
%��һ�ַ����ǹ����һ���ǵ�ǰ���ݶȷ����ϸ�������һ����������
%   Pk = -gk + delta*P(k-1)


%��ͬ�Ĺ����ݶȷ��Ĺؼ����� ��delta��ȡֵ��ͬ
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

%Fletcher-Reeves�����ݶȷ�
net = newff(minmax(p),[3,1],{'tansig','purelin'},'traincgf');
net.trainParam.show = 5;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)



