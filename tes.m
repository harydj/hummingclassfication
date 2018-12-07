load codeindex.mat
st = 
indices = crossvalind('Kfold',index8,5);

cp = classperf(species);
for i = 1:10
    test = (indices == i); train = ~test;
    class = classify(meas(test,:),meas(train,:),species(train,:));
    classperf(cp,class,test)
end

cp.ErrorRate
