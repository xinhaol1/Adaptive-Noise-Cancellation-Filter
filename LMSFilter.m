%This function implements the LMS Adaptive Noise Cancellation Filter
%param: primary is the voice with possible noise
%       reference is the noise
%       M is the length of the adpative filter
%       mu is the stepsize for LMS
function errl = LMSFilter(primary, reference, mu, M)
errl = zeros(size(primary));
N = size(reference);
hl = zeros(1, M);
hl(1) = 1;
for n = (M:N)
    referencep = reference(n:-1:n-M+1);
    errl(n) = primary(n) - hl * referencep;
    hl = hl + mu * errl(n) * referencep';
end
% hlms = hl';