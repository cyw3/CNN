% ��֪��ģ�ͣ�������Ԫ���磬���Կɷ֣�������ǣ�������ֵ��Ԫ��ǿ�޷�����hardlim()��ʹ����������Ϊ��������
% ��S����֪����Ԫ��R�����룬��Ӧһϵ��ȨֵΪWi,j����ʾ��j������͵�i����Ԫ��Ȩֵ

% newp()��������һ����֪������
% net = newp(PR,S)              ni = (w1*p1+...+wR*pR)+bi
% ��ni���ڵ���0�����1����niС��0�����0
% PR��һ��RX2�׾��󣬱�ŷʽԪ�ص����ֵ����Сֵ��SΪ��Ԫ����Ŀ

% 1���������磻�������һ���������һ����Ԫ�ĸ�֪�������磬�������Сֵ�����ֵΪ[0 2]
net = newp([0 2], 1)
% �۲�������
inputweights = net.inputweights{1,1}
% inputweights = 
% 
%     Neural Network Weight
% 
%             delays: 0
%            initFcn: 'initzero'                ȱʡ�ĳ�ʼ��������Ȩֵ��ʼֵ��Ϊ0
%       initSettings: (none)
%              learn: true
%           learnFcn: 'learnp'              ȱʡ��ѧϰ����
%         learnParam: (none)
%               size: [1 1]
%          weightFcn: 'dotprod'       ���������hardlim()���ݺ�������Ϊ������dotprod������������Ȩֵ����ĳ˻����ڼ�����ֵ
%        weightParam: (none)
%           userdata: (your custom info)

biases = net.biases{1}
% biases = 
% 
%     Neural Network Bias
% 
%            initFcn: 'initzero'                ��ֵȱʡ��ʼֵҲ��0
%              learn: true
%           learnFcn: 'learnp'
%         learnParam: (none)
%               size: 1
%           userdata: (your custom info)

% 2���������
% sim()�����һ������Ϊ��ά�����ĸ�֪������
net = newp([-2 2;-2 2],1)
% ����Ȩֵ����ֵ�ֱ�Ϊ[-1,1]��1
net.IW{1,1} = [-1 1];
net.b{1} =[1];

% ��һ�������źţ�p1�ж������룬
p1 = [1;1];
a1 = sim(net,p1)

% �ڶ��������źţ�
p2 = [1;-1];
a2 = sim(net,p2)

p3 = {[1;1][1;-1]};
a3 = sim(net,p3)

% 3�������ʼ��
% init()    �����У�1����������Ȩֵ����ֵ��ԭΪ��ʼֵ��2��������Ȩֵ����ֵ�������ֵ
% ����
net = newp([ -2 2;-2 2],1);

wts = net.IW{1,1}

bias = net.b{1}
















