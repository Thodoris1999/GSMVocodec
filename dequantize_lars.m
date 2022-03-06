function lars = dequantize_lars(LARc)
quant_a = [20 20 20 20 13.637 15 8.334 8.824]';
quant_b = [0 0 4 -5 0.184 -3.5 -0.666 -2.235]';
lars = (LARc-quant_b)./quant_a;
end

