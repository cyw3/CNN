%����֯����������
p = [.1 .8 .1 .9; .2 .9 .1 .8]

net = newc([0 1;0 1],2);
wts = net.IW{1,1}
biases = net.b{1}
net.trainParam.epochs = 500;

%�����������
%Ȩֵ����ʹ�õ�Kohonenѧϰ������ֵ����ʹ�õ���ֵѧϰ����
net = train(net,p);

net.trainFcn

a = sim(net,p)
ac = vec2ind(a)

wts = net.IW{1,1}
biases = net.b{1}
