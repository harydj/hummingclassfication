function [C8,C16,C32,C64,C128,C256] = Generate_Codebook (folder,coeff,fn,Codebook8,Codebook16,Codebook32,Codebook64,Codebook128,Codebook256)
load('Codebook.mat');
audio_files=dir(fullfile(folder,'*.wav')) 
euqlid = 0;
euqlidmin = 100;
for k=1:length(audio_files)
    filename = audio_files(k).name;
    [sample fs] = audioread(fullfile(folder,filename));
    sideinfo = audioinfo(fullfile(folder,filename)); 
    [c, s_info] = Chroma(sample, fs, sideinfo, coeff);
    crp = transpose(c);
    n = crp(1:fn,:);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    for i=1:length(n(:,1))
        for j=1:length(Codebook8(:,1))
            euqlid8(i,j) = sqrt(sum((n(i,:) - Codebook8(j,:)) .^ 2));
        end
        for j=1:length(Codebook16(:,1))
            euqlid16(i,j) = sqrt(sum((n(i,:) - Codebook16(j,:)) .^ 2));
        end
        for j=1:length(Codebook32(:,1))
            euqlid32(i,j) = sqrt(sum((n(i,:) - Codebook32(j,:)) .^ 2));
        end
        for j=1:length(Codebook64(:,1))
            euqlid64(i,j) = sqrt(sum((n(i,:) - Codebook64(j,:)) .^ 2));
        end
        for j=1:length(Codebook128(:,1))
            euqlid128(i,j) = sqrt(sum((n(i,:) - Codebook128(j,:)) .^ 2));
        end
        for j=1:length(Codebook256(:,1))
            euqlid255(i,j) = sqrt(sum((n(i,:) - Codebook256(j,:)) .^ 2));
        end
    end
    
     for i=1:length(n(:,1))
           minValue = min(euqlid8(i,:));
           [row, column] = find(euqlid8 == minValue);
           C8(k,i) = column(1,1);
     end
    for i=1:length(n(:,1))
           minValue = min(euqlid16(i,:));
           [row, column] = find(euqlid16 == minValue);
           C16(k,i) = column(1,1);
    end
    for i=1:length(n(:,1))
           minValue = min(euqlid32(i,:));
           [row, column] = find(euqlid32 == minValue);
           C32(k,i) = column(1,1);
    end
    for i=1:length(n(:,1))
           minValue = min(euqlid64(i,:));
           [row, column] = find(euqlid64 == minValue);
           C64(k,i) = column(1,1);
    end
    for i=1:length(n(:,1))
           minValue = min(euqlid128(i,:));
           [row, column] = find(euqlid128 == minValue);
           C128(k,i) = column(1,1);
    end
    for i=1:length(n(:,1))
           minValue = min(euqlid255(i,:));
           [row, column] = find(euqlid255 == minValue);
           C256(k,i) = column(1,1);
    end
end

end
