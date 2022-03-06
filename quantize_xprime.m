function [xM_prime,xMc] = quantize_xprime(x_prime)
%QUANTIZE_XPRIME Quantize normalized samples x'(i)
xM_prime = zeros(size(x_prime));
xMc = zeros(size(x_prime));
for i=1:length(x_prime)
    if x_prime(i)*2^15<=-24577
        xM_prime(i) = -28672*2^(-15);
        xMc(i) = 0;
    elseif x_prime(i)*2^15<=-16385
        xM_prime(i) = -20480*2^(-15);
        xMc(i) = 1;
    elseif x_prime(i)*2^15<=-8193
        xM_prime(i) = -12288*2^(-15);
        xMc(i) = 2;
    elseif x_prime(i)*2^15<=-1
        xM_prime(i) = -4096*2^(-15);
        xMc(i) = 3;
    elseif x_prime(i)*2^15<=8191
        xM_prime(i) = 4096*2^(-15);
        xMc(i) = 4;
    elseif x_prime(i)*2^15<=16383
        xM_prime(i) = 12288*2^(-15);
        xMc(i) = 5;
    elseif x_prime(i)*2^15<=24575
        xM_prime(i) = 20480*2^(-15);
        xMc(i) = 6;
    elseif x_prime(i)*2^15<=32767
        xM_prime(i) = 28672*2^(-15);
        xMc(i) = 7;
    end
end
end

