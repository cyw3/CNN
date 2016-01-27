% 感知机模型，单层神经元网络，线性可分，激活函数是：符号阈值单元（强限幅函数hardlim()，使输入向量分为两个区域）
% 有S个感知机神经元，R个输入，对应一系列权值为Wi,j，表示第j个输入和第i个神经元的权值

% newp()可以生成一个感知机网络
% net = newp(PR,S)              ni = (w1*p1+...+wR*pR)+bi
% 当ni大于等于0，输出1；当ni小于0，输出0
% PR是一个RX2阶矩阵，比欧式元素的最大值和最小值；S为神经元的数目

% 1、生成网络；比如设计一个单输入和一个神经元的感知器神经网络，输入的最小值和最大值为[0 2]
net = newp([0 2], 1)
% 观察神经网络
inputweights = net.inputweights{1,1}
% inputweights = 
% 
%     Neural Network Weight
% 
%             delays: 0
%            initFcn: 'initzero'                缺省的初始化函数，权值初始值置为0
%       initSettings: (none)
%              learn: true
%           learnFcn: 'learnp'              缺省的学习函数
%         learnParam: (none)
%               size: [1 1]
%          weightFcn: 'dotprod'       网络输入给hardlim()传递函数的量为数量积dotprod，即输入量和权值矩阵的乘积，在加上阈值
%        weightParam: (none)
%           userdata: (your custom info)

biases = net.biases{1}
% biases = 
% 
%     Neural Network Bias
% 
%            initFcn: 'initzero'                阈值缺省初始值也是0
%              learn: true
%           learnFcn: 'learnp'
%         learnParam: (none)
%               size: 1
%           userdata: (your custom info)

% 2、网络仿真
% sim()。设计一个输入为二维向量的感知器网络
net = newp([-2 2;-2 2],1)
% 设置权值和阈值分别为[-1,1]和1
net.IW{1,1} = [-1 1];
net.b{1} =[1];

% 第一个输入信号：p1中都是输入，
p1 = [1;1];
a1 = sim(net,p1)

% 第二个输入信号：
p2 = [1;-1];
a2 = sim(net,p2)

p3 = {[1;1][1;-1]};
a3 = sim(net,p3)

% 3、网络初始化
% init()    作用有：1、将神经网络权值和阈值复原为初始值，2、将网络权值和阈值赋以随机值
% 例如
net = newp([ -2 2;-2 2],1);

wts = net.IW{1,1}

bias = net.b{1}
















