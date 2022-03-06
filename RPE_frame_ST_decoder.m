function [s0] = RPE_frame_ST_decoder(LARc,CurrFrmSTResd,PrevLARc)
%RPE_FRAME_DECODER Frame decoder
lars = dequantize_lars(LARc);
PrevLars = dequantize_lars(PrevLARc);

% apply synthesis filter
s = ST_synthesis(CurrFrmSTResd,lars,PrevLars);
s0 = postproc(s);
end

