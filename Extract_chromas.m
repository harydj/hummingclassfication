function B1 = Extract_chromas( folder, coeff, fn )

audio_files=dir(fullfile(folder,'*.wav'))   
f_CRP = zeros(12,1);
for k=1:length(audio_files)
    filename = audio_files(k).name;
    [sample fs] = audioread(fullfile(folder,filename));
    sideinfo = audioinfo(fullfile(folder,filename)); 
    %n=round(length(sample)/25);
    %overlap = round(n/2);
    %y = buffer(sample, n, overlap);
    %for i=1:length(y(1,:))
    [c, s_info] = Chroma(sample, fs, sideinfo, coeff);
    n = c(:,1:fn);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    f_CRP = [f_CRP n];
    %end
 end
    %% Visualisasi`
    %parameter.featureRate = s_info.CRP.featureRate;
    %parameter.xlabel = 'Frame [n]';
    %parameter.title = 'CRP chromagram';
    %visualizeCRP(n,parameter);
    
    B = transpose(f_CRP);
    B1 = B(2:end,:); 

end

