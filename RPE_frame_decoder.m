function [s0, CurrFrmResd] = RPE_frame_decoder(FrmBitStrm, PrevFrmResd)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
[LARc,Nc,bc,CurrFrmExFull] = unpackFrmBitStrm(FrmBitStrm);
[s0, CurrFrmResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,CurrFrmExFull,PrevFrmResd);
end
