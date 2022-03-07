function [LARc,CurrFrmSTResd] = RPE_frame_ST_coder(s0,PrevLARc)
%RPE_FRAME_ENCODER frame encoder
s = preproc(s0);

% LPC analysis, order 8
lpc_order = 8;
acfc = acf(s,lpc_order);
R = toeplitz(acfc(1:lpc_order));
r = acfc(2:end);
a = linsolve(R,r);
k = poly2rc([1; -a]);

lars1 = arrayfun(@lar,k);
LARc = quantize_lars(lars1);

% Apply analysis filter (linear prediction residuals using a)
lars = dequantize_lars(LARc);
PrevLars = dequantize_lars(PrevLARc);
CurrFrmSTResd = ST_filtering(s,lars,PrevLars);
end

