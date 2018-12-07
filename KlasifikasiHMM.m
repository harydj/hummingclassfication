function [likelystates_tr, likelystates_tst] = KlasifikasiHMM(C_tr, C_tst, lbl_tr)
A = [1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12];
transt = repmat(A,12,1);
Emiss = rand(12, 15); Emiss = Emiss ./ (sum(Emiss, 2)*ones(1, 15));
%[TRANS_EST2, EMIS_EST2] = hmmtrain(index256,trans,estimateE)
[estimateTR,estimateE] = hmmestimate(C_tr, lbl_tr);
trans = (estimateTR + 1) / 12; %Smoothing +1 
emis = (estimateE + 1) / length(estimateE(1,:)); %Smoothing +1 
likelystates_tr = hmmviterbi(C_tr,trans, emis);
likelystates_tst = hmmviterbi(C_tst,trans, emis);
end
