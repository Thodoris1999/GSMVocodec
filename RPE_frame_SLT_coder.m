function [LARc,Nc,bc,Mall,xmaxcall,xMcall,CurrFrmSTResd] = RPE_frame_SLT_coder(s0, PrevFrmSTResd)
%UNTITLED Summary of this function goes here
%   CurrFrmSTResd = d'(n)
%   CurrFrmExFull = e(n) (no coding)

% Variable init
Nc = zeros([1 4]);
bc = zeros([1 4]);
Mall = zeros([1 4]);
xmaxcall = zeros([1 4]);
xMcall = zeros([13 4]);

CurrFrmSTResd = zeros(size(s0));

[LARc,short_term_d] = RPE_frame_ST_coder(s0); % short_term_d is d(n) from short term analysis

for j=0:3
    d = short_term_d((j*40+1):(j*40+40)); % subframes
    if j==0
        Prevd = PrevFrmSTResd(41:160);
    elseif j==1
        Prevd = [PrevFrmSTResd(81:160) CurrFrmSTResd(1:40)];
    elseif j==2
        Prevd = [PrevFrmSTResd(121:160) CurrFrmSTResd(1:80)];
    else %j==3
        Prevd = CurrFrmSTResd(1:120);
    end
    [Nj,bj] = RPE_subframe_LTE(d,Prevd);
    
    bcj = LTP_gain_code(bj);
    bj_prime = LTP_gain_decode(bcj);
    
    % calculate current subframe residuals d_prime
    d_double_prime = bj_prime*Prevd((121-Nj):(160-Nj)); % Nj \in [40,120]
    e = d - d_double_prime;
    [M,xmaxc,xMc] = RPE_encode_LT_residuals(e);
    e_prime = RPE_decode_LT_residuals(M,xmaxc,xMc);
    d_prime = d_double_prime + e_prime;
    
    CurrFrmSTResd((j*40+1):(j*40+40)) = d_prime;
    Nc(j+1) = Nj;
    bc(j+1) = bcj;
    Mall(j+1) = M;
    xmaxcall(j+1) = xmaxc;
    xMcall(:,j+1) = xMc;
end
end

