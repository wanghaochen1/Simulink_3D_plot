classdef msfcn_plot3D < matlab.System & matlab.system.mixin.Propagates

    properties (DiscreteState)
        xs
        ys
        zs
        index
    end

    methods (Access = protected)

        function setupImpl(obj)
            obj.xs = zeros(1, 10000);
            obj.ys = zeros(1, 10000);
            obj.zs = zeros(1, 10000);
            obj.index = 1;
        end

        function stepImpl(obj, x, y, z)
            obj.xs(obj.index) = x;
            obj.ys(obj.index) = y;
            obj.zs(obj.index) = z;
            obj.index = obj.index + 1;

            scatter3(obj.xs(1:obj.index - 1), obj.ys(1:obj.index - 1), obj.zs(1:obj.index - 1));
        end

        function resetImpl(obj)
            obj.xs = zeros(1, 10000);
            obj.ys = zeros(1, 10000);
            obj.zs = zeros(1, 10000);
            obj.index = 1;
        end

        function num = getNumInputsImpl(~)
            num = 3; % Now there are three inputs: x, y, z
        end

        function [sz_1, sz_2, sz_3] = getOutputSizeImpl(~)
            sz_1 = [1, 1];
            sz_2 = [1, 1];
            sz_3 = [1, 1];
        end

        function [dt_1, dt_2, dt_3] = getOutputDataTypeImpl(~)
            dt_1 = 'double';
            dt_2 = 'double';
            dt_3 = 'double';
        end

        function [cp_1, cp_2, cp_3] = isOutputComplexImpl(~)
            cp_1 = false;
            cp_2 = false;
            cp_3 = false;
        end

        function [fz_1, fz_2, fz_3] = isOutputFixedSizeImpl(~)
            fz_1 = true;
            fz_2 = true;
            fz_3 = true;
        end

    end

end
