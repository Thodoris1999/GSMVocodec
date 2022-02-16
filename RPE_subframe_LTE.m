function [N,b] = RPE_subframe_LTE(d, Prevd)
%UNTITLED3 Summary of this function goes here
%   size(d) = 40
%   size(Prevd) = 120
N=-1;
RN=-Inf;
for lambda=40:120
    R = sum(d(1:40).*Prevd((121-lambda):(160-lambda))); % Nj \in [40,120]
    if R>RN
        N = lambda;
        RN = R;
    end
end
b = RN/sum(Prevd((121-N):(160-N)).*Prevd((121-N):(160-N))); % Nj \in [40,120]
end

