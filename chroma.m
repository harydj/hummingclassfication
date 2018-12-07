function [ f_crp, sideinfo ] = chroma( w, fs, sd, coeff )
%% ekstraksi fitur chroma 
%   Input :
%   frame sinyal w
%
%   output :
%   Vektor Fitur Chroma 

%% Inisialisasi Parameter 
parameter.coeffsToKeep = [coeff:120];
parameter.applyLogCompr = 1;
parameter.factorLogCompr = 1000;

%%Konversi Audio ke Pitch
[f, sd] = audio_to_pitch_via_FB(w);

%%Ekstrasi Fitur Chroma Reducted Log Pitch (CRP)
[f_crp,sideinfo] = pitch_to_CRP(f,parameter,sd);

end

