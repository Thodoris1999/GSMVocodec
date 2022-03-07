function [s0] = RPE_frame_ST_decoder(LARc,CurrFrmSTResd)
%RPE_FRAME_DECODER Frame decoder
quant_a = [20 20 20 20 13.637 15 8.334 8.824]';
quant_b = [0 0 4 -5 0.184 -3.5 -0.666 -2.235]';
lars = (LARc-quant_b)./quant_a;

k = arrayfun(@lar_inv, lars);
a = rc2poly(k);
% BWE https://en.wikipedia.org/wiki/Bandwidth_expansion
% gamma = 0.95;
% for i=1:20
%     sys = tf(1,[1 -a],-1);
%     if isstable(sys)
%         break;
%     end
%     for i=1:length(a)
%         a(i)=gamma^i*a(i);
%     end
%     if i==20
%         disp("Warning: LPC unstable");
%     end
% end

% apply synthesis filter
s = filter(1, [1 -a], CurrFrmSTResd);
s0 = postproc(s);
end

