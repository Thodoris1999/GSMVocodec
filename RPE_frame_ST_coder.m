function [LARc,CurrFrmSTResd] = RPE_frame_ST_coder(s0)
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
quant_a = [20 20 20 20 13.637 15 8.334 8.824]';
quant_b = [0 0 4 -5 0.184 -3.5 -0.666 -2.235]';
LARc = round(quant_a.*lars1+quant_b);

% Apply analysis filter (linear prediction residuals using a)
lars = (LARc-quant_b)./quant_a;
k = arrayfun(@lar_inv, lars);
a = rc2poly(k);
CurrFrmSTResd = filter(a, 1, s);
end

