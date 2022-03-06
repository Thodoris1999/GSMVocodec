function e_prime = RPE_decode_LT_residuals(M,xmaxc,xMc)
%RPE_ENCODE_LT_RESIDUALS Dequantize long-term residuals e
% Convert M,xmaxc,xMc to e_prime

% receive subsampled xM
xmax_quant_lut = [31 63 95 127 159 191 223 255 287 319 351 383 415 447 ...
    479 511 575 639 703 767 831 895 959 1023 1151 1279 1407 1535 1663 ...
    1791 1919 2047 2303 2559 2815 3071 3327 3583 3839 4095 4607 5119 ...
    5631 6143 6655 7167 7679 8191 9215 10239 11263 12287 13311 14335 ...
    15359 16383 18431 20479 22527 24575 26623 28671 30719 327767];
xmax_prime = xmax_quant_lut(xmaxc+1);
x_prime = dequantize_xprime(xMc);
xM = x_prime*xmax_prime;
    
% upsample
e_prime = zeros([1 40]);
for i=0:12
    e_prime(3*i+M+1) = xM(i+1);
end
end

