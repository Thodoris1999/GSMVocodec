function [LARc,Nc,bc,CurrFrmExFull] = unpackFrmBitStrm(FrmBitStrm)
LARc = FrmBitStrm(1:8)';
Nc = [FrmBitStrm(9) FrmBitStrm(51) FrmBitStrm(93) FrmBitStrm(135)];
bc = [FrmBitStrm(10) FrmBitStrm(52) FrmBitStrm(94) FrmBitStrm(136)];
CurrFrmExFull = [FrmBitStrm(11:50) FrmBitStrm(53:92) FrmBitStrm(95:134) FrmBitStrm(137:176)];
end

