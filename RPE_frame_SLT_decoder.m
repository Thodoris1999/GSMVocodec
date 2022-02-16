function [s0, CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,CurrFrmExFull,PrevFrmSTResd)
%UNTITLED2 Summary of this function goes here
%   CurrFrmExFull = e(n)
%   PrevFrmSTResd = d'(n) (previous frame)
%   CurrFrmSTResd = d'(n) (current frame)
CurrFrmSTResd = zeros(size(PrevFrmSTResd));

for j=0:3
    if j==0
        Prevd = PrevFrmSTResd(41:160);
    elseif j==1
        Prevd = [PrevFrmSTResd(81:160) CurrFrmSTResd(1:40)];
    elseif j==2
        Prevd = [PrevFrmSTResd(121:160) CurrFrmSTResd(1:80)];
    else %j==3
        Prevd = CurrFrmSTResd(1:120);
    end
    
    bj_prime = LTP_gain_decode(bc(j+1));
    d_double_prime = bj_prime*Prevd((121-Nc(j+1)):(160-Nc(j+1)));
    e = CurrFrmExFull((j*40+1):(j*40+40));
    CurrFrmSTResd((j*40+1):(j*40+40)) = e+d_double_prime;
end

s0 = RPE_frame_ST_decoder(LARc, CurrFrmSTResd);
end

