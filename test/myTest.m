function objVar = myTest(inVar)
% 目标函数
% 工具箱对目标函数是求最大值还是求最小值呢？答案是：最小值。
objVar = inVar(1)^2 - 2*inVar(1)*inVar(2)+ 6*inVar(1) + inVar(2)^2-6*inVar(2);

end

%http://blog.csdn.net/niuyongjie/article/details/4863979
%约束被分成下面的4种类型：
%1.边界约束。对自变量最大值与最小值的限制：X>=l 并且X<=u.  下界的约束为L=[1，2，3，4]，上界为U=[5，6，7，8]
%2.线性不等式约束。Ax<=b,其中A为mXn的矩阵，x为nX1的矩阵，b为3X1的矩阵。描述了n个变量受到的m种不等式的限制。Ax<=b
%3.线性等式约束。基本同2.Aeqx<=beq
%4.非线性约束。

    function [c,ceq]=ellipseparabola(x)
         % Inside the ellipse bounded by (-3<x<3),(-2<y<2)
         % Above the line y=x^2-1
          c(1) = (x(1)^2)/9 + (x(2)^2)/4 - 1;%不等式约束1
          c(2) = x(1)^2 - x(2) - 1;%不等式约束2
          ceq = [];%等式约束,为空
    end
    
    %是包含了梯度信息的约束函数的写法例子。
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
    
    
    
    % 遗传算法与直接搜索工具箱中主要包含两种直接搜索算法：一种是通用模式搜索算法(generalized pattern search ,GPS))，另一个是网格自适应搜索算法( the mesh adaptive search (MADS) algorithm)。
    % 最优化  [x fval] = patternsearch(@objfun, x0)