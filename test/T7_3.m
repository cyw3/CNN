%Kohonenzѧϰ����
%ֻ�����Ϊ1��InstarȨֵ���������������ѧϰ����ֵ���������Ϊ1��Instar��

%��������
P = [0.1826 0.6325;0.3651 0.3162;0.5477 0.3162;0.7303 0.6325];
%�����������
T = [1 0];

[R,Q] = size(P);
[S,Q] = size(T);
W=zeros(S,R);
max_epoch = 10;
%ѧϰ����
lp.lr = 0.7;

%ѵ��
for epoch = 1:max_epoch
    for q=1:Q
        A = T(:,q);
        dW=learnk(W,P(:,q),[],[],A,[],[],[],[],[],lp,[]);
        W=W+dW;
    end
end
W









