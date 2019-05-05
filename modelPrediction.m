function newModel = modelPrediction(pred,indeksPred,data)
    
    % fungsi ini bertujuan untuk membuat prediksi model dengan meng-assign
    % label baru berdasarkan proses training/learning.

    for i=1:size(data,1)
        newModel(i,1) = data(i,1); % assign atribut ke-1 sesuai data train
        newModel(i,2) = data(i,2); % assign atribut ke-2 sesuai data train
        newModel(i,3) = data(i,3); % assign label sesuai data train
    end
    
    for i=1:size(pred,1)
        newModel(indeksPred(i),3) = pred(i); % assign nilai label yang baru berdasarkan hasil proses training.
    end
end