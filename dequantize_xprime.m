function x_prime = dequantize_xprime(xMc)
%DEQUANTIZE_XPRIME Dequantize normalized samples x'(i)
xprime_quant_lut = [-28672 -20480 -12288 -4096 4096 12288 20480 28672]*2^(-15);
x_prime = zeros(size(xMc));
for i=1:length(xMc)
    x_prime(i) = xprime_quant_lut(xMc(i)+1);
end
end

