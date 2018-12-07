function [Codebook] = Generate_Codeword (B1, nCodebook)

    [idx,Codebook,sumd,D] = kmeans(B1,nCodebook);

end


    