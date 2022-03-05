function FrmBitStrm = packFrmBitStrm(LARc,Nc,bc,CurrFrmExFull)
FrmBitStrm = [LARc' Nc(1) bc(1) CurrFrmExFull(1:40) Nc(2) bc(2) CurrFrmExFull(41:80) Nc(3) bc(3) CurrFrmExFull(81:120) Nc(4) bc(4) CurrFrmExFull(121:160)];
end

