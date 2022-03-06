function x = block_weight_filter(e)
%BLOCK_WEIGHT_FILTER block weighting filter for conversion e->x
H = [-134 -374 0 2054 5741 8192 5741 2054 0 -374 -134]*2^(-13);
x = zeros(size(e));
for k=0:39
    sumk = 0;
    for i =0:10
        if k+5-i<0 || k+5-i>39
            tmp = 0;
        else
            tmp = e(k+5-i+1);
        end
        sumk = sumk + H(i+1)*tmp;
    end
    x(k+1) = sumk;
end
end

