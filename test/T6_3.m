%输入
P = round(rand(1,8));
P

%期望输出
T = [0 (P(1:end-1)+P(2:end))==2]
T

net = newelm([0 1],[5 1],{'tansig','logsig'},'trainbfg');

Pseq = con2seq(P);
Tseq = con2seq(T);
net.trainParam.epochs = 100;
net.trainParam.show = Inf;

net = train(net,Pseq,Tseq);
Y = sim(net,Pseq);
z = seq2con(Y);
z{1,1}
%差别
diff1 = T-z{1,1}
diff1










