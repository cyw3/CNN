function objVar = myTest(inVar)
% Ŀ�꺯��
% �������Ŀ�꺯���������ֵ��������Сֵ�أ����ǣ���Сֵ��
objVar = inVar(1)^2 - 2*inVar(1)*inVar(2)+ 6*inVar(1) + inVar(2)^2-6*inVar(2);

end

%http://blog.csdn.net/niuyongjie/article/details/4863979
%Լ�����ֳ������4�����ͣ�
%1.�߽�Լ�������Ա������ֵ����Сֵ�����ƣ�X>=l ����X<=u.  �½��Լ��ΪL=[1��2��3��4]���Ͻ�ΪU=[5��6��7��8]
%2.���Բ���ʽԼ����Ax<=b,����AΪmXn�ľ���xΪnX1�ľ���bΪ3X1�ľ���������n�������ܵ���m�ֲ���ʽ�����ơ�Ax<=b
%3.���Ե�ʽԼ��������ͬ2.Aeqx<=beq
%4.������Լ����

    function [c,ceq]=ellipseparabola(x)
         % Inside the ellipse bounded by (-3<x<3),(-2<y<2)
         % Above the line y=x^2-1
          c(1) = (x(1)^2)/9 + (x(2)^2)/4 - 1;%����ʽԼ��1
          c(2) = x(1)^2 - x(2) - 1;%����ʽԼ��2
          ceq = [];%��ʽԼ��,Ϊ��
    end
    
    %�ǰ������ݶ���Ϣ��Լ��������д�����ӡ�
    function [c,ceq,gradc,gradceq]=ellipseparabola2(x)
        % Inside the ellipse bounded by (-3<x<3),(-2<y<2)
        % Above the line y=x^2-1
        c(1) = x(1)^2/9 + x(2)^2/4 - 1;
        c(2) = x(1)^2 - x(2) - 1;
        ceq = [];

        if nargout > 2
            gradc = [2*x(1)/9, 2*x(1);...
                             x(2)/2, -1];
            gradceq = [];
        end

    end
    
    
    
    % �Ŵ��㷨��ֱ����������������Ҫ��������ֱ�������㷨��һ����ͨ��ģʽ�����㷨(generalized pattern search ,GPS))����һ������������Ӧ�����㷨( the mesh adaptive search (MADS) algorithm)��
    % ���Ż�  [x fval] = patternsearch(@objfun, x0)