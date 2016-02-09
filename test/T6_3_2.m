%�ȶ�ƽ���
T = [1 -1;-1 1];

%Hopfield����ռ�״̬
plot(T(1,:),T(2,:),'r*');
axis([-1.1 1.1 -1.1 1.1]);
title('Hopfield����״̬�ռ�');
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
%���ѡȡ�ĳ�ʼ������ȶ������Ͻǵ�ƽ���

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

%αƽ��㡣�����������״̬�ռ�����ĵ�

