%newsom()   ��Ҫ�������²�����
%����������״̬�ռ�
%���羺������Ԫ����
%���˽ṹ
%���뺯��
%����׶�ѧϰ����
%����׶β���
%�����׶�ѧϰ����
%�����׶����ھ���

net = newsom([0 2;0 1],[2 3])

P = [.1 .3 1.2 1.1 1.8 1.7 .1 .3 1.2 1.1 1.8 1.7;...
    .2 .1 .3 .1 .3 .2 1.8 1.8 1.9 1.9 1.7 1.8]
cla
plot(P(1,:),P(2,:),'o','markersize',8)
hold on
plotsom(net.iw{1,1},net.layers{1}.distances)
hold off

net.trainParam.epochs = 1000;
net = train(net,P);

plotsom(net.iw{1,1},net.layers{1}.distances)











