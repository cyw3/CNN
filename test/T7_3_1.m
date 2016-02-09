%学习向量量化神经网络LVQ
%竞争层、线性层

clear
P = [-3 -2 -2 0 0 0 0 2 2 3;0 1 -1 2 1 -1 -2 1 -1  0]
Tc = [1 1 1 2 2 2 2 1 1 1]
plotvec(P,Tc)

T = ind2vec(Tc)
targets = full(T)
net = newlvq(minmax(P),4,[.6 .4],.1)
net.iw{1,1}

hold on
plotvec(net.IW{1,1}',vec2ind(net.LW{2,1}),'o')
net.LW{2,1}

Yb4t = sim(net,P);
Y = vec2ind(Yb4t)


