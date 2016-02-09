%稳定平衡点
T = [1 -1;-1 1];

%Hopfield网络空间状态
plot(T(1,:),T(2,:),'r*');
axis([-1.1 1.1 -1.1 1.1]);
title('Hopfield网络状态空间');
xlabel('a(1)');
ylabel('a(2)');

net = newhop(T);
W = net.LW{1,1}
b = net.b{1,1}

Ai = T;
[Y,Pf,Af] = sim(net,2,[],Ai);
Y

a = {rands(2,1)};
[y,Pf,Af] = sim(net,{1 50},{},a);

record = [cell2mat(a) cell2mat(y)];
start = cell2mat(a);
hold on
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:));
%随机选取的初始点最后稳定在左上角的平衡点

plot(0,0,'ko');
P = [-1.0 -0.5 0.0 0.5 1.0;
    -1.0 -0.5 0.0 0.5 1.0];
color = 'rgbmy';
for i=1:5
    a = {P(:,i)};
    [y,Pf,Af] = sim(net,{1 50},{},a);
    
    record = [cell2mat(a) cell2mat(y)];
    start = cell2mat(a);
    plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1));
    drawnow
end

%伪平衡点。比如上面的在状态空间的中心点

