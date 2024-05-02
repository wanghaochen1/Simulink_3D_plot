function plot3D(x, y, z)
    % 定义persistent变量
    persistent xs ys zs index
    % 如果变量为空，初始化它们
    if isempty(xs) && isempty(ys) && isempty(zs)
        xs = zeros(1, 10000); % 预先分配一个足够大的数组
        ys = zeros(1, 10000);
        zs = zeros(1, 10000);
        index = 1; % 用于跟踪当前的索引
    end

    if index >= length(xs) % 如果数组满了，将原数据进行压缩
        [xs, ys, zs, index] = compress(xs, ys, zs, index); % 压缩数据
    end

    xs(index) = x;
    ys(index) = y;
    zs(index) = z;
    index = index + 1; % 更新索引

    plot3(xs(1:index - 1), ys(1:index - 1), zs(1:index - 1));

    function [outx, outy, outz, indexout] = compress(a, b, c, index)

        if mod(length(a), 2) ~= 0 %
            a = a(1:end - 1); % 丢弃最后一个元素
            b = b(1:end - 1);
            c = c(1:end - 1);
            indexout = (length(a) - 1) / 2;
        else
            indexout = length(a) / 2;
        end

        outx = [mean(reshape(a, 2, [])), zeros(1, 5000)];
        outy = [mean(reshape(b, 2, [])), zeros(1, 5000)];
        outz = [mean(reshape(c, 2, [])), zeros(1, 5000)];
    end

end
