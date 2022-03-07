function d = ST_filtering(s,lars,PrevLars)
%ST_FILTERING Performs short term analysis filtering with lars interpolation
%as described in the standard
d = zeros(size(s));

lars_interp = 0.75*PrevLars+0.25*lars;
k = arrayfun(@lar_inv, lars_interp);
a = rc2poly(k);
d(1:13) = filter(a, 1, s(1:13));

lars_interp = 0.5*PrevLars+0.5*lars;
k = arrayfun(@lar_inv, lars_interp);
a = rc2poly(k);
d(14:27) = filter(a, 1, s(14:27));

lars_interp = 0.25*PrevLars+0.75*lars;
k = arrayfun(@lar_inv, lars_interp);
a = rc2poly(k);
d(28:40) = filter(a, 1, s(28:40));

k = arrayfun(@lar_inv, lars);
a = rc2poly(k);
d(41:end) = filter(a, 1, s(41:end));
end

