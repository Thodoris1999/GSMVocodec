function [LARc,Nc,bc,Mall,xmaxcall,xMcall] = unpackFrmBitStrm(FrmBitStrm)
LARc = FrmBitStrm(1:8)';
Nc = [FrmBitStrm(9) FrmBitStrm(26) FrmBitStrm(43) FrmBitStrm(60)];
bc = [FrmBitStrm(10) FrmBitStrm(27) FrmBitStrm(44) FrmBitStrm(61)];
Mall = [FrmBitStrm(11) FrmBitStrm(28) FrmBitStrm(45) FrmBitStrm(62)];
xmaxcall = [FrmBitStrm(12) FrmBitStrm(29) FrmBitStrm(46) FrmBitStrm(63)];
xMcall = [FrmBitStrm(13:25)' FrmBitStrm(30:42)' FrmBitStrm(47:59)' FrmBitStrm(64:76)'];
end

