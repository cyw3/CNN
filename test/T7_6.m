%����֯����ӳ������SOFM
%������ѧϰ���磬�޵�ʦ����֯ѧϰ

%1�����˽ṹ
%�������˽ṹ������һ��2*3�����6����Ԫ���˽ṹ,�ֱ�������x���꣬�������y���꣬6������
pos = gridtop(2,3)
plotsom(pos)

pos = gridtop(8,10)
plotsom(pos)

%���������˽ṹ
pos = hextop(8,10)
plotsom(pos)

%������˽ṹ
pos = randtop(8,10)
plotsom(pos)

%2����Ԫ֮��ľ���
%���뺯����dist(),linkdist(),mandist(),boxdist()
%1��Eculindean��ŷ����ã�����
pos2 = [0 1 2;0 1 2]
%����ÿ����Ԫ��������һ����Ԫ֮��ľ���.ÿһ�б�ʾһ������������֮��ľ���
D2 = dist(pos2)

%2)box���룺��ʾ����λ������֮��ľ���D=max(|Pi-Pj|)
pos = gridtop(2,3)
plotsom(pos)
d = boxdist(pos)

%3)link���룺��ʾ����λ��֮��Ļ��ڻ��߲���
dlink = linkdist(pos)

%4��Manhattan����.��άά���Ĳ�֮��
W1 = [1 2;3 4; 5 6]
P1 = [1;1]
Z1 = mandist(W1,P1)

