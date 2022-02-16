function bj_prime = LTP_gain_decode(bcj)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
QLB = [0.1, 0.35, 0.65, 1];

if bcj == 0
    bj_prime = QLB(1);
elseif bcj == 1
    bj_prime = QLB(2);
elseif bcj == 2
    bj_prime = QLB(3);
else
    bj_prime = QLB(4);
end

