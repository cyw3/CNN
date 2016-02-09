%Kohonenz学习规则
%只对输出为1的Instar权值矩阵进行修正，即学习规则值作用于输出为1的Instar上

%输入向量
P = [0.1826 0.6325;0.3651 0.3162;0.5477 0.3162;0.7303 0.6325];
%期望输出矩阵
T = [1 0];

[R,Q] = size(P);
[S,Q] = size(T);
W=zeros(S,R);
max_epoch = 10;
%学习速率
lp.lr = 0.7;

%训练
for epoch = 1:max_epoch
    for q=1:Q
        A = T(:,q);
        dW=learnk(W,P(:,q),[],[],A,[],[],[],[],[],lp,[]);
        W=W+dW;
    end
end
W









