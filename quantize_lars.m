function LARc = quantize_lars(lars)
quant_a = [20 20 20 20 13.637 15 8.334 8.824]';
quant_b = [0 0 4 -5 0.184 -3.5 -0.666 -2.235]';
LARc = round(quant_a.*lars+quant_b);
end