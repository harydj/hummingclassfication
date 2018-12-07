function [C64] = Generate_Codebook_Coeff (folder,coeff,fn,Codebook64)
audio_files=dir(fullfile(folder,'*.wav')) 
euqlid = 0;
euqlidmin = 100;
for k=1:length(audio_files)
    filename = audio_files(k).name;
    [sample fs] = audioread(fullfile(folder,filename));
    sideinfo = audioinfo(fullfile(folder,filename)); 
    [c, s_info] = chroma(sample, fs, sideinfo, coeff);
    crp = transpose(c);
    n = crp(1:fn,:);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    for i=1:length(n(:,1))
        for j=1:length(Codebook64(:,1))
            euqlid64(i,j) = sqrt(sum((n(i,:) - Codebook64(j,:)) .^ 2));
        end
    end
    
     
    for i=1:length(n(:,1))
           minValue = min(euqlid64(i,:));
           [row, column] = find(euqlid64 == minValue);
           C64(k,i) = column(1,1);
    end
end

end
