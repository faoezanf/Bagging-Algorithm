function akurasi = validationBootstrap(bootstrap,data)

    % fungsi ini bertujuan untuk melakukan proses validasi bootstrap
    % (berdasarkan hasil training) terhadap data asli (data train).

    result = trainData(data); % proses training data train
    akurasi = calculateAccuracy(result,bootstrap(:,3)); % menghitung akurasi label baru pada bootstrap dengan array result.
end