function newLabel = trainData(data)
    
    % fungsi ini bertujuan untuk melakukan proses training data berbasis
    % naive bayes.

    atribut = cat(2,data(:,1),data(:,2)); % menggabungkan atribut 1 dan 2 pada data menjadi array yang sama
    label = data(:,3); % meng-assign data label/kelas menjadi sebuah array yang baru (terpisah dari atribut)
    
    model = fitcnb(atribut,label); % proses training/learning atribut terhadap labelnya.
    newLabel = predict(model,atribut); % proses memprediksi kelas yang baru berdasarkan hasil training.

end