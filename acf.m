function acfc = acf(s,p)
%ACFC Estimates ACF of s for the first p+1 lags
%   According to the GSM standard (acfc is 1-indexed (acf(0) = acfc(1) etc))
acfc = zeros([p+1 1]);
for k=1:p+1
    for i=k:length(s)
        acfc(k) = acfc(k)+s(i)*s(i-k+1);
    end
end
end

