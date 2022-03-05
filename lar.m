function y = lar(x)
%LAR Conversion of reflection coeffients to approximated log-area ratios
x=min(x,1); % enforce x<=1
if x<0.675
    y=x;
elseif x<0.95
    y=sign(x)*(2*abs(x)-0.675);
else
    y=sign(x)*(8*abs(x)-6.375);
end
end

