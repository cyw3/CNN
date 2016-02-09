%模式识别

%初始化
[alphabet,targets] = prprob;
[R , Q] = size(alphabet);
[S2, Q] = size(targets);
S1 = 10;
[R, Q] = size(alphabet);
[S2, Q] = size(targets);

P = alphabet;
net = newff(minmax(P),[S1,S2],{'logsig','logsig'},'traingdx');

net.LW{2,1} = net.LW{2,1}*0.01;
net.b{2} = net.b{2}*0.01;


%网络训练
%1\无噪声训练
%最大训练次数设为5000次，最小均方差设为0.1
T = targets;
net.performFcn = 'sse';
net.trainParam.goal = 0.1;
net.trainParam.show = 20;
net.trainParam.epochs = 5000;
net.trainParam.mc = 0.95;
[net, tr] = train(net,P,T);

%2\有噪声训练
netn = net;
netn.trainParam.goal = 0.6;
netn.trainParam.epochs = 300;
T = [targets targets targets targets];
for pass=1:10
    P= [alphabet,alphabet,...
        (alphabet+randn(R,Q)*0.1),...
        (alphabet+randn(R,Q)*0.2)];
    [net,tr]= train(netn,P,T);
end;


%再次无噪声训练

netn.trainParam.goal = 0.1;
netn.trainParam.epochs = 500;
netn.trainParam.show = 5;

P = alphabet;
T = targets;
[netn,tr] = train(netn,P,T);

%系统性能
noise_range = 0:.05:.5;
max_test = 100;
network1 = [];
network2 = [];
T = targets;
for noiselevel = noise_range
    errors1 = 0;
    errors2 = 0;
    for i=1:max_test
        P = alphabet + randn(35,26) * noiselevel;
        A = sim(net, P);
        AA = compet(A);
        errors1 = errors1 + sum(sum(abs(AA-T)))/2;
        An = sim(netn,P);
        AAn = compet(An);
        errors2 = errors2+sum(sum(abs(AAn-T)))/2;
    end;
    network1 = [network1 errors1/26/100];
    network2 = [network2 errors2/26/100];
end;

plot(noise_range,network1*100,'--',noise_range,network2*100);
title('识别误差');
xlabel('噪声指标');
ylabel('无噪声训练网络 --  有噪声训练网络---');

noisyJ = alphabet(:,1)+randn(35,1)*0.2
plotchar(noisyJ);

A2 = sim(net,noisyJ);
A2 = compet(A2);
answer = find(compet(A2)==1);
plotchar(alphabet(:,answer));

noisyJ = alphabet(:,10)+randn(35,1)*0.2;
plotchar(noisyJ);

A2 = sim(net,noisyJ);
A2 = compet(A2);

answer = find(compet(A2)==1);
plotchar(alphabet(:,answer));

noisyJ = alphabet(:,23)+randn(35,1)*0.2;
plotchar(noisyJ);

A2 = sim(net,noisyJ);
A2 = compet(A2);

answer = find(compet(A2)==1);
plotchar(alphabet(:,answer));
























