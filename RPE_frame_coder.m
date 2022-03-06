function [FrmBitStrm,CurrFrmResd,LARc] = RPE_frame_coder(s0,PrevFrmResd,PrevLARc)
[LARc,Nc,bc,Mall,xmaxcall,xMcall,CurrFrmResd] = RPE_frame_SLT_coder(s0,PrevFrmResd,PrevLARc);

FrmBitStrm = packFrmBitStrm(LARc,Nc,bc,Mall,xmaxcall,xMcall);
end

