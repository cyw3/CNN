%Elman������

%���������ֵ����
P = round(rand(1,8));
%ת���ɵ�Ԫ������ʽ
Pseq = con2seq(P)

%��ʼ�����磬��������ֵ�������
net = newelm([0 1],[5,1],{'tansig','logsig'});

Y = sim(net,Pseq);
Y

%ת�������Ϊ������ʽ
z = seq2con(Y);
z{1,1}




















