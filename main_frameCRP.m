clear all; close all; clc;

%% Inisialisasi
    Codebook = 64; %coefficient to keep on CRP
    Coeff = 55; %frame to keep on features
    st_tr = xlsread('train.xlsx');
    st_tst = xlsread('testing.xlsx');
    folder_tr = 'E:\University\Semester 8\TA SUKSES\Program\Dataset\train' %train data path
    folder_tst = 'E:\University\Semester 8\TA SUKSES\Program\Dataset\testing' %test data path
    
%% Pembentukan Codebook dengan frameCRP (fn = 15,16,17)
    %Chromas_fn5 = Extract_chromas(folder_tr,Coeff,5);
    %Chromas_fn10 = Extract_chromas(folder_tr,Coeff,10);
    %Chromas_fn15 = Extract_chromas(folder_tr,Coeff,15);
    
    %save('ChromaCRP_tr','Chromas_fn5','Chromas_fn10','Chromas_fn15');
    
    %[Codebook_fn5] = Generate_Codeword(Chromas_fn5,Codebook); 
    %[Codebook_fn10] = Generate_Codeword(Chromas_fn10,Codebook); 
    %[Codebook_fn15] = Generate_Codeword(Chromas_fn15,Codebook); 

    %[CodeCRP5_tr] = Generate_Codebook_Coeff(folder_tr,Coeff,5,Codebook_fn5); %Codebook for train data
    %[CodeCRP5_tst] = Generate_Codebook_Coeff(folder_tst,Coeff,5,Codebook_fn5); %Codebook for test data
    %[CodeCRP10_tr] = Generate_Codebook_Coeff(folder_tr,Coeff,10,Codebook_fn10); %Codebook for train data
    %[CodeCRP10_tst] = Generate_Codebook_Coeff(folder_tst,Coeff,10,Codebook_fn10); %Codebook for test data
    %[CodeCRP15_tr] = Generate_Codebook_Coeff(folder_tr,Coeff,15,Codebook_fn15); %Codebook for train data
    %[CodeCRP15_tst] = Generate_Codebook_Coeff(folder_tst,Coeff,15,Codebook_fn15); %Codebook for test data
    
    %save('CodeCRP_tr','CodeCRP5_tr','CodeCRP10_tr','CodeCRP15_tr');
    %save('CodeCRP_tst','CodeCRP5_tst','CodeCRP10_tst','CodeCRP15_tst');
    
    load('CodeCRP_tr');
    load('CodeCRP_tst');
    
    %% Klasifikasi data dengan Frame = 5
    [likelystates5_tr, likelystates5_tst] = KlasifikasiHMM(CodeCRP5_tr,CodeCRP5_tst,st_tr);
    %% Klasifikasi data dengan Frame = 10
    [likelystates10_tr, likelystates10_tst] = KlasifikasiHMM(CodeCRP10_tr,CodeCRP10_tst,st_tr);
    %% Klasifikasi data dengan Frame = 15
    [likelystates15_tr, likelystates15_tst] = KlasifikasiHMM(CodeCRP15_tr,CodeCRP15_tst,st_tr);
    
    %% Akurasi hasil klasifikasi
    disp('Akurasi Klasifikasi Data Training Frame 5 : ')
    sum(st_tr==likelystates5_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Frame 10 : ')
    sum(st_tr==likelystates10_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Frame 15 : ')
    sum(st_tr==likelystates15_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Testing Frame 5 : ')
    sum(st_tst==likelystates5_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Frame 10 : ')
    sum(st_tst==likelystates10_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Frame 15 : ')
    sum(st_tst==likelystates15_tst)/length(st_tst)