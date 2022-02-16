function s = preproc(s0)
% offset compensation
s0f = zeros(size(s0));
s0f(1) = s0(1);
alpha = 32735*2^-15;
for k=2:length(s0)
    s0f(k) = s0(k)-s0(k-1)+alpha*s0f(k-1);
end
%s0f=s0; %uncomment to skip offset compensation

% preemphasis
s = zeros(size(s0f));
beta = 28189*2e-15;
s(1) = s0f(1);
for k=1:length(s0f)
    s(k) = s0f(k)-beta*s(k);
end
end

