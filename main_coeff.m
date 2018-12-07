clear all; close all; clc;

%% Inisialisasi
    Codebook = 256; %coefficient to keep on CRP
    fn = 15; %frame to keep on features
    st_tr = xlsread('train.xlsx');
    st_tst = xlsread('testing.xlsx');
    folder_tr = 'E:\University\Semester 8\TA SUKSES\Program\Dataset\train' %train data path
    folder_tst = 'E:\University\Semester 8\TA SUKSES\Program\Dataset\testing' %test data path
    
%% Pembentukan Codebook dengan Coeffient (15,35,55,75)
   Chromas15 = Extract_chromas(folder_tr,15,fn);
   Chromas35 = Extract_chromas(folder_tr,35,fn);
   Chromas55 = Extract_chromas(folder_tr,55,fn);
   Chromas75 = Extract_chromas(folder_tr,75,fn);
    
    %save('Chromas_Coeff','Chromas15','Chromas35','Chromas55','Chromas75');
    
    [Codebook15] = Generate_Codeword(Chromas15,Codebook); 
    [Codebook35] = Generate_Codeword(Chromas35,Codebook); 
    [Codebook55] = Generate_Codeword(Chromas55,Codebook); 
    [Codebook75] = Generate_Codeword(Chromas75,Codebook); 
   
    [Codeindex15_tr] = Generate_Codebook_Coeff(folder_tr,15,fn,Codebook15); %Codebook for train data
    [Codeindex15_tst] = Generate_Codebook_Coeff(folder_tst,15,fn,Codebook15); %Codebook for test data
    [Codeindex35_tr] = Generate_Codebook_Coeff(folder_tr,35,fn,Codebook35); %Codebook for train data
    [Codeindex35_tst] = Generate_Codebook_Coeff(folder_tst,35,fn,Codebook35); %Codebook for test data
    [Codeindex55_tr] = Generate_Codebook_Coeff(folder_tr,35,fn,Codebook55); %Codebook for train data
    [Codeindex55_tst] = Generate_Codebook_Coeff(folder_tst,35,fn,Codebook55); %Codebook for test data
    [Codeindex75_tr] = Generate_Codebook_Coeff(folder_tr,35,fn,Codebook75); %Codebook for train data
    [Codeindex75_tst] = Generate_Codebook_Coeff(folder_tst,35,fn,Codebook75); %Codebook for test data
    
    %save('CodeCoeff_tr','Codeindex15_tr','Codeindex35_tr','Codeindex55_tr','Codeindex75_tr');
    %save('CodeCoeff_tst','Codeindex15_tst','Codeindex35_tst','Codeindex55_tst','Codeindex75_tst');
    %load('CodeCoeff_tr');
    %load('CodeCoeff_tst');
    
%% Klasifikasi data dengan Coeff = 15
    [likelystates15_tr, likelystates15_tst] = KlasifikasiHMM(Codeindex15_tr,Codeindex15_tst,st_tr);
%% Klasifikasi data dengan Coeff = 35
    [likelystates35_tr, likelystates35_tst] = KlasifikasiHMM(Codeindex35_tr,Codeindex35_tst,st_tr);
%% Klasifikasi data dengan Coeff = 55
    [likelystates55_tr, likelystates55_tst] = KlasifikasiHMM(Codeindex55_tr,Codeindex55_tst,st_tr);
%% Klasifikasi data dengan Coeff = 75
    [likelystates75_tr, likelystates75_tst] = KlasifikasiHMM(Codeindex75_tr,Codeindex75_tst,st_tr);

%% Akurasi hasil klasifikasi
    disp('Akurasi Klasifikasi Data Training Coeff 15 : ')
    sum(st_tr==likelystates15_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Coeff 35 : ')
    sum(st_tr==likelystates35_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Coeff 55 : ')
    sum(st_tr==likelystates55_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Training Coeff 75 : ')
    sum(st_tr==likelystates75_tr)/length(st_tr)
    disp('Akurasi Klasifikasi Data Testing Coeff 15 : ')
    sum(st_tst==likelystates15_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Coeff 35 : ')
    sum(st_tst==likelystates35_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Coeff 55 : ')
    sum(st_tst==likelystates55_tst)/length(st_tst)
    disp('Akurasi Klasifikasi Data Testing Coeff 75 : ')
    sum(st_tst==likelystates75_tst)/length(st_tst)
   