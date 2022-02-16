function bcj = LTP_gain_code(bj)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
DLB = [0.2, 0.5, 0.8];
if bj <= DLB(1)
    bcj = 0;
elseif bj <= DLB(2)
    bcj = 1;
elseif bj<=DLB(3)
    bcj = 2;
else
    bcj = 3;
end

