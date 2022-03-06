function [s0, CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,Mall,xmaxcall,xMcall,PrevFrmSTResd)
%UNTITLED2 Summary of this function goes here
%   CurrFrmExFull = e(n)
%   PrevFrmSTResd = d'(n) (previous frame)
%   CurrFrmSTResd = d'(n) (current frame)
CurrFrmSTResd = zeros(size(PrevFrmSTResd));

for j=0:3
    bj_prime = LTP_gain_decode(bc(j+1));
    M = Mall(j+1);
    xmaxc = xmaxcall(j+1);
    xMc = xMcall(:,j+1);
    e_prime = RPE_decode_LT_residuals(M,xmaxc,xMc);
    
    if j==0
        Prevd = PrevFrmSTResd(41:160);
    elseif j==1
        Prevd = [PrevFrmSTResd(81:160) CurrFrmSTResd(1:40)];
    elseif j==2
        Prevd = [PrevFrmSTResd(121:160) CurrFrmSTResd(1:80)];
    else %j==3
        Prevd = CurrFrmSTResd(1:120);
    end
    
    d_double_prime = bj_prime*Prevd((121-Nc(j+1)):(160-Nc(j+1)));
    CurrFrmSTResd((j*40+1):(j*40+40)) = e_prime+d_double_prime;
end

s0 = RPE_frame_ST_decoder(LARc, CurrFrmSTResd);
end

