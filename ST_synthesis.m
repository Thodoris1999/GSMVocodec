function s = ST_synthesis(d_prime,lars,PrevLars)
%ST_SYNTHESIS Performs short term synthesis filtering with lars interpolation
%as described in the standard
s = zeros(size(d_prime));

lars_interp = 0.75*PrevLars+0.25*lars;
k = arrayfun(@lar_inv, lars_interp);
a = rc2poly(k);
s(1:13) = filter(1, a, d_prime(1:13));

lars_interp = 0.5*PrevLars+0.5*lars;
k = arrayfun(@lar_inv, lars_interp);
a = rc2poly(k);
s(14:27) = filter(1, a, d_prime(14:27));

lars_interp = 0.25*PrevLars+0.75*lars;
k = arrayfun(@lar_inv, lars_interp);
a = rc2poly(k);
s(28:40) = filter(1, a, d_prime(28:40));

k = arrayfun(@lar_inv, lars);
a = rc2poly(k);
s(41:end) = filter(1, a, d_prime(41:end));
end

