%This function implements the RLS Adaptive Noise Cancellation Filter
%param: primary is the voice with possible noise
%       reference is the noise
%       M is the length of the adaptive filter
%       L is the nuber of data samples L for computing the RLS filter
function errr = RLSFilter(primary, reference, M, L)
N = size(reference);
for n = (L+M:N)
    r = 0;
    R = 0;
    for l = n-L+1 : n
        x = reference(l: -1: l-M+1);
        r = r + x*primary(l);
        R = R + x*x';
    end
    r = 1/L.*r;
    R = 1/L.*R;
end
hr = R^(-1)*r;
%hrls = hr;
delta = conv(hr, reference);
errr = primary - delta(1:size(primary));
end