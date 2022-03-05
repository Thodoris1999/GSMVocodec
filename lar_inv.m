function y = lar_inv(x)
%Approximated reflection coefficients from log-area ratios
x=min(x,1.625); % enforce -1.625<=x<=1.625
x=max(x,-1.625);
if abs(x)<0.675
    y=x;
elseif x<1.225
    y=sign(x)*(0.5*abs(x)+0.3375);
else
    y=sign(x)*(0.125*abs(x)+0.796875);
end
end

