clear all; close all; clc;

%% Inisialisasi
    nCodebook = 256; %N Codebook
    Coeff = 55; %Coefficient to Keep on CRP
    fn = 15; %frame to keep on features
    st_tr = xlsread('train.xlsx');
    st_tst = xlsread('testing.xlsx');
    load('Chroma_best');
    load('Codeindex_best');

[Codebook] = Generate_Codeword(Chromas,nCodebook); %pembentukan codeword data latih

[sample fs] = audioread(fullfile(folder,filename));
sideinfo = audioinfo(fullfile(folder,filename)); 



[Codeindex_tst] = Generate_Codebook_Coeff(folder_tst,Coeff,fn,Codebook); %Codebook for test data