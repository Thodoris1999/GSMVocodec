function [M,xmaxc,xMc] = RPE_encode_LT_residuals(e)
%RPE_ENCODE_LT_RESIDUALS Quantize long-term residuals e
% Quantize CurrFrmExFull to Mall,xmaxcall,xMcall
x = block_weight_filter(e);
[xM, M] = RPE_decimation_selection(x);

xmax = max(abs(xM));
xmax_quant_lut = [31 63 95 127 159 191 223 255 287 319 351 383 415 447 ...
    479 511 575 639 703 767 831 895 959 1023 1151 1279 1407 1535 1663 ...
    1791 1919 2047 2303 2559 2815 3071 3327 3583 3839 4095 4607 5119 ...
    5631 6143 6655 7167 7679 8191 9215 10239 11263 12287 13311 14335 ...
    15359 16383 18431 20479 22527 24575 26623 28671 30719 327767];
xmax_prime = -1;
for i=1:length(xmax_quant_lut)
    if xmax<xmax_quant_lut(i)
        xmax_prime = xmax_quant_lut(i);
        xmaxc = i-1;
        break;
    end
end
if xmax_prime<0 % xmax outside bounds
    xmax_prime = xmax_quant_lut(end);
    xmaxc = length(xmax_quant_lut)-1;
end

x_prime = xM/xmax_prime;
[~,xMc] = quantize_xprime(x_prime);
end

