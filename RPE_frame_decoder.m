function [s0,CurrFrmResd] = RPE_frame_decoder(FrmBitStrm,PrevFrmResd)
[LARc,CurrFrmResd] = unpackFrmBitStrm(FrmBitStrm);
[s0] = RPE_frame_ST_decoder(LARc,CurrFrmResd);
end
