function [s0, CurrFrmResd] = RPE_frame_decoder(FrmBitStrm, PrevFrmResd)
[LARc,Nc,bc,Mall,xmaxcall,xMcall] = unpackFrmBitStrm(FrmBitStrm);

[s0, CurrFrmResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,Mall,xmaxcall,xMcall,PrevFrmResd);
end
