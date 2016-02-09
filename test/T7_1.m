%自组织竞争神经网络。单层神经网络
%学习规则一般采用由内星学习规则发展而来的Kohonen学习规则

%Instar学习规则
%输入向量与权值向量的相识度
P = [0.1826 0.6325;0.3651 0.3162;0.5477 0.3162;0.7303 0.6325];
T = [1 0];

[R ,Q] = size(P);
[S,Q] = size(T);

W = zeros(S,R);
max_epoch = 10;
lp.lr = 0.7;

%对Instar网络进行训练
for epoch = 1:max_epoch
    for q=1:Q
        A = T(:,q);
        %instar学习规则，执行函数
        dW = learnis(W,P(:,q),[],[],A,[],[],[],[],[],lp,[]);
        W = W+dW;
    end
end

%最终得到的权值向量
W
%改变学习率
%lp.lr = 0.3;










