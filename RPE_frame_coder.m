function [FrmBitStrm, CurrFrmResd] = RPE_frame_coder(s0,PrevFrmResd)

[LARc,Nc,bc,CurrFrmExFull,CurrFrmResd] = RPE_frame_SLT_coder(s0, PrevFrmResd);
FrmBitStrm = packFrmBitStrm(LARc,Nc,bc,CurrFrmExFull);
end

