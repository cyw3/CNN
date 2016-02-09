%自组织特征映射网络SOFM
%竞争性学习网络，无导师自组织学习

%1、拓扑结构
%矩形拓扑结构：生成一个2*3网格的6个神经元拓扑结构,分别是上是x坐标，下面的是y坐标，6个坐标
pos = gridtop(2,3)
plotsom(pos)

pos = gridtop(8,10)
plotsom(pos)

%六角形拓扑结构
pos = hextop(8,10)
plotsom(pos)

%随机拓扑结构
pos = randtop(8,10)
plotsom(pos)

%2、神经元之间的距离
%距离函数：dist(),linkdist(),mandist(),boxdist()
%1）Eculindean（欧几里得）距离
pos2 = [0 1 2;0 1 2]
%计算每个神经元与相邻另一个神经元之间的距离.每一行表示一个点与其他点之间的距离
D2 = dist(pos2)

%2)box距离：表示两个位置向量之间的距离D=max(|Pi-Pj|)
pos = gridtop(2,3)
plotsom(pos)
d = boxdist(pos)

%3)link距离：表示两个位置之间的环节或者步数
dlink = linkdist(pos)

%4）Manhattan距离.各维维数的差之和
W1 = [1 2;3 4; 5 6]
P1 = [1;1]
Z1 = mandist(W1,P1)

