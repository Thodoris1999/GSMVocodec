function [sro] = postproc(sr)
%POSTPROC reverse preproc

% deemphasis filter
beta = 28180*2e-15;
sro = zeros(size(sr));
sro(1) = sr(1);
for k=2:length(sr)
    sro(k) = sr(k) + beta*sro(k-1);
end
end

