clear all; close all; clc;

%% Inisialisasi
    nCodebook = 256; %N Codebook
    Coeff = 55; %Coefficient to Keep on CRP
    fn = 15; %frame to keep on features
    st_tr = xlsread('train.xlsx');
    st_tst = xlsread('testing.xlsx');
    folder_tr = 'E:\University\Semester 8\TA SUKSES\Program\Dataset\train' %train data path
    folder_tst = 'E:\University\Semester 8\TA SUKSES\Program\Demo' %test data path
    
    %Chromas = Extract_chromas(folder_tr,Coeff,fn);
    
    %save('Chroma_best','Chromas');
    load('Chroma_best');
    [Codebook] = Generate_Codeword(Chromas,nCodebook); %pembentukan codeword data latih
    
    %[Codeindex_tr] = Generate_Codebook_Coeff(folder_tr,Coeff,fn,Codebook); %Codebook for train data
    [Codeindex_tst2] = Generate_Codebook_Coeff(folder_tst,Coeff,fn,Codebook); %Codebook for test data
    
    %save('Codeindex_best','Codeindex_tr','Codeindex_tst');
    load('Codeindex_best');
    
    %% Klasifikasi 
    [likelystates_tr, likelystates_tst2] = KlasifikasiHMM(Codeindex_tr,Codeindex_tst,st_tr);
    
    %save('likelybest','likelystates_tr','likelystates_tst');
    load('likelybest'); 
    %% Akurasi hasil klasifikasi
    disp('Akurasi Klasifikasi Data Training : ')
    sum(st_tr==likelystates_tr)/length(st_tr)
    %disp('Akurasi Klasifikasi Data Testing : ')
    %sum(st_tst==likelystates_tst)/length(st_tst)
    