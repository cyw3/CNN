%稳定平衡点
T = [1 -1;-1 1];

%Hopfield网络空间状态
plot(T(1,:),T(2,:),'r*');
axis([-1.1 1.1 -1.1 1.1]);
title('Hopfield网络状态空间');
xlabel('a(1)');
ylabel('a(2)');

%网络设计
net = newhop(T);
%网络设计
%应用期望值作为初始输入，使用sim()检测
[Y, Pf, Af] = sim(net,2,[],T);
Y

a = {rands(2,1)};
[y,Pf,Af] = sim(net,{1 20},{},a);

record = [cell2mat(a) cell2mat(y)];
start = cell2mat(a);
hold on
plot(start(1,1),start(2,1),'bx',record(1,:),record(2,:));

color = 'rgbmy';
for i=1:25
    a = {rands(2,1)};
    [y,Pf,Af] = sim(net,{1 20},{},a);
    record = [cell2mat(a) cell2mat(y)];
    start = cell2mat(a);
    plot(start(1,1),start(2,1),'kx',record(1,:),record(2,:),color(rem(i,5)+1));
end

%所有的点最后都收敛于两个平衡点，与左上角接近的点接近于左上角，与右上角接近的点收敛于右上角


