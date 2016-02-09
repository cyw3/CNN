%应用PNN进行变量分类
P = [1 2;2 2;1 1]';
Tc = [1 2 3]; 

plot(P(1,:),P(2,:),'.','markersize',30);
for i=1:3,text(P(1,i)+0.1,P(2,i),sprintf('class %g',Tc(i))), end
axis([0 3 0 3]);
title('三向量及其类别');
xlabel('P(1,:)');
ylabel('P(2,:)');

%将期望类别指针Tc转换为向量T
%因为输入向量之间的距离为1，所以设定散布常数为1
T = ind2vec(Tc);
spread = 1;
net = newpnn(P,T,spread);

A = sim(net,P);
Ac = vec2ind(A);

plot(P(1,:),P(2,:),'.','markersize',30);
axis([0 3 0 3])
for i=1:3,text(P(1,i)+0.1,P(2,i),sprintf('class %g',Ac(i))),end
title('网络测试结果');
xlabel('P(1,:)');
ylabel('P(2,:)');

%测试
p = [2;1.5];
a = sim(net,p);
ac = vec2ind(a);
hold on
plot(p(1),p(2),'*','markersize',10,'color',[1 0 0])
text(p(1)+0.1,p(2),sprintf('class %g',ac))
hold off

title('对新向量分类');
xlabel('P(1,:)与P(1)');
ylabel('P(2,:)与P(2)');

p1 = 0:0.05:3;
p2 = p1;
[P1,P2] = meshgrid(p1,p2);
pp = [P1(:) P2(:)]';
aa = sim(net,pp);
aa = full(aa);
m = mesh(P1,P2,reshape(aa(1,:),length(p1),length(p2)));
set(m,'facecolor',[0 0.5 1],'linestyle','none');
hold on
m = mesh(P1,P2,reshape(aa(2,:),length(p1),length(p2)));
set(m,'facecolor',[0 1 0.5],'linestyle','none');
m = mesh(P1,P2,reshape(aa(3,:),length(p1),length(p2)));
set(m,'facecolor',[0.5 0 1],'linestyle','none');
plot3(P(1,:),P(2,:),[1 1 1]+0.1,'.','markersize',30)
plot3(p(1),p(2),1.1,'*','markersize',10,'color',[1 0 0])
hold off
view(2)
title('向量分类立体图')
xlabel('P(1,:)与p(1)')
ylabel('P(2,:)与p(2)')



