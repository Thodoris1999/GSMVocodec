function [FrmBitStrm, CurrFrmResd] = RPE_frame_coder(s0,PrevFrmResd)
[LARc,Nc,bc,Mall,xmaxcall,xMcall,CurrFrmResd] = RPE_frame_SLT_coder(s0, PrevFrmResd);
% TODO: DEBUG SECTION REMOVE
% CurrFrmExFull2 = RPE_decode_LT_residuals(Mall,xmaxcall,xMcall);
% plot(1:160,CurrFrmExFull);
% hold on;
% plot(1:160,CurrFrmExFull2);
% legend("CurrFrmExFull","CurrFrmExFull2");
% TODO: DEBUG SECTION REMOVE

FrmBitStrm = packFrmBitStrm(LARc,Nc,bc,Mall,xmaxcall,xMcall);
end

