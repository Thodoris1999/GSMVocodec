function [FrmBitStrm, CurrFrmResd] = RPE_frame_coder(s0,PrevFrmResd)
[LARc,CurrFrmResd] = RPE_frame_ST_coder(s0);
FrmBitStrm = packFrmBitStrm(LARc,CurrFrmResd);
end

