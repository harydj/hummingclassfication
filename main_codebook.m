clear all; close all; clc;

%% Inisialisasi
    Coeff = 55; %coefficient to keep on CRP
    fn = 15; %frame to keep on features
    st_tr = xlsread('train.xlsx');
    st_tst = xlsread('testing.xlsx');
    folder_tr = 'E:\University\Semester 8\TA SUKSES\Program\Dataset\train' %train data path
    folder_tst = 'E:\University\Semester 8\TA SUKSES\Program\Dataset\testing' %test data path
%% Pembentukan Codebook (n = 8,16,32,65,128,256)
    Chromas = Extract_chromas(folder_tr,Coeff,fn);
    
    save('Chroma_tr','Chromas');
    
    [CB8] = Generate_Codeword(Chromas,8); 
    [CB16] = Generate_Codeword(Chromas,16); 
    [CB32] = Generate_Codeword(Chromas,32); 
    [CB64] = Generate_Codeword(Chromas,64); 
    [CB128] = Generate_Codeword(Chromas,128); 
    [CB256] = Generate_Codeword(Chromas,256); 
    
    %save('Codebook','CB8','CB16','CB32','CB64','CB128','CB256');
    
    [C8_tr,C16_tr,C32_tr,C64_tr,C128_tr,C256_tr] = Generate_Codebook(folder_tr,Coeff,fn,CB8,CB16,CB32,CB64,CB128,CB256); %Codebook for train data
    [C8_tst,C16_tst,C32_tst,C64_tst,C128_tst,C256_tst] = Generate_Codebook(folder_tst,Coeff,fn,CB8,CB16,CB32,CB64,CB128,CB256); %Codebook for test data
    
    %save('Codeindex_tr','C8_tr','C16_tr','C32_tr','C64_tr','C128_tr','C256_tr');
    %save('Codeindex_tst','C8_tst','C16_tst','C32_tst','C64_tst','C128_tst','C256_tst');

    %load('Codeindex_tr');
    %load('Codeindex_tst');
    
%% Klasifikasi dengan jumlah Codebook = 8
    [likelystates8_tr, likelystates8_tst] = KlasifikasiHMM(C8_tr,C8_tst,st_tr);
%% Klasifikasi dengan jumlah Codebook = 16
    [likelystates16_tr, likelystates16_tst] = KlasifikasiHMM(C16_tr,C16_tst,st_tr);
%% Klasifikasi dengan jumlah Codebook = 32
    [likelystates32_tr, likelystates32_tst] = KlasifikasiHMM(C32_tr,C32_tst,st_tr);
%% Klasifikasi dengan jumlah Codebook = 64
    [likelystates64_tr, likelystates64_tst] = KlasifikasiHMM(C64_tr,C64_tst,st_tr);
%% Klasifikasi dengan jumlah Codebook = 128
    [likelystates128_tr, likelystates128_tst] = KlasifikasiHMM(C128_tr,C128_tst,st_tr);
%% Klasifikasi dengan jumlah Codebook = 256
    [likelystates256_tr, likelystates256_tst] = KlasifikasiHMM(C256_tr,C256_tst,st_tr);

    %save('Likelystates_tr','likelystates8_tr','likelystates16_tr','likelystates32_tr', ...
        %'likelystates64_tr','likelystates128_tr','likelystates256_tr');
    %save('Likelystates_tst','likelystates8_tst','likelystates16_tst','likelystates32_tst', ...
       % 'likelystates64_tst','likelystates128_tst','likelystates256_tst');
    
%% Akurasi hasil klasifikasi
    disp('Akurasi Klasifikasi Data Training Codebook 8 : ')
    sum(st_tr==likelystates8_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Codebook 16 : ')
    sum(st_tr==likelystates16_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Codebook 32 : ')
    sum(st_tr==likelystates32_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Codebook 64 : ')
    sum(st_tr==likelystates64_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Codebook 128 : ')
    sum(st_tr==likelystates128_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Codebook 256 : ')
    sum(st_tr==likelystates256_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Testing Codebook 8 : ')
    sum(st_tst==likelystates8_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Codebook 16 : ')
    sum(st_tst==likelystates16_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Codebook 32 : ')
    sum(st_tst==likelystates32_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Codebook 64 : ')
    sum(st_tst==likelystates64_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Codebook 128 : ')
    sum(st_tst==likelystates128_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Codebook 256 : ')
    sum(st_tst==likelystates256_tst)/length(st_tst)
    
   