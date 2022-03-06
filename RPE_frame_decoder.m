function [s0,CurrFrmResd,LARc] = RPE_frame_decoder(FrmBitStrm,PrevFrmResd,PrevLARc)
[LARc,Nc,bc,Mall,xmaxcall,xMcall] = unpackFrmBitStrm(FrmBitStrm);

[s0, CurrFrmResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,Mall,xmaxcall,xMcall,PrevFrmResd,PrevLARc);
end
