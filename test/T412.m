%Levenberg-Marquardtѵ������
%ʹ��H=J(T)J�����Hessian����
%g= J(T)e
%J���ſ˱ȣ�Jacobian������,��������ѵ������һ�ڵ�������Ȩֵ����ֵ�ĺ���
%e������ѵ���������
p = [-1 -1 2 2;0 5 0 5];
t = [-1 -1 1 1];

net = newff(minmax(p),[3,1],{'tansig','purelin'},'trainlm');
net.trainParam.show = 10;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

[net, tr] = train(net,p,t);
 
a = sim(net, p)
