function [LARc,CurrFrmResd] = unpackFrmBitStrm(FrmBitStrm)
LARc = FrmBitStrm(1:8)';
CurrFrmResd = FrmBitStrm(9:168);
end

