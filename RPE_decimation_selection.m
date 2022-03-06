function [xM, M] = RPE_decimation_selection(x)
%RPE_decimation_selection From the full signal, returns the subsampled
%signal based on MSE xM and its index M
EM = -1;
xM = zeros([1 13]);
for m=0:3
    Em=0;
    for i=0:12
        Em = Em + x(m+3*i+1)^2;
    end
    if Em>EM
        EM=Em;
        M=m;
    end
end
for i=0:12
    xM(i+1) = x(M+3*i+1);
end
end

