% MAIN PROGRAM

% Fauzan Firdaus - 1301164317 - IF-40-04

% Catatan : Disarankan untuk melakukan running program dengan versi matlab
% diatas versi R2018A agar tidak terjadi kesalahan/error.

clear all; clc;
DatasetTrain = csvread('TrainsetTugas4ML.csv',1); % Load data train
DatasetTest = csvread('TestsetTugas4ML.csv',1); % Load data test
DatasetTest(:,3) = []; % menghapus kolom ke - 3 pada data test (karena terisi = 0)

bagSize = 100; % inisialisasi size bootstrap (30% dari jumlah data train)

[bootstrap1,indeksBoot1] = createNewBootstrap(DatasetTrain,bagSize); % membuat bootstrap ke 1
[bootstrap2,indeksBoot2] = createNewBootstrap(DatasetTrain,bagSize); % membuat bootstrap ke 2
[bootstrap3,indeksBoot3] = createNewBootstrap(DatasetTrain,bagSize); % membuat bootstrap ke 3
[bootstrap4,indeksBoot4] = createNewBootstrap(DatasetTrain,bagSize); % membuat bootstrap ke 4
[bootstrap5,indeksBoot5] = createNewBootstrap(DatasetTrain,bagSize); % membuat bootstrap ke 5

label1 = trainData(bootstrap1); % proses training (mendapatkan label) untuk setiap data di bootstrap 1
label2 = trainData(bootstrap2); % proses training (mendapatkan label) untuk setiap data di bootstrap 2
label3 = trainData(bootstrap3); % proses training (mendapatkan label) untuk setiap data di bootstrap 3
label4 = trainData(bootstrap4); % proses training (mendapatkan label) untuk setiap data di bootstrap 4
label5 = trainData(bootstrap5); % proses training (mendapatkan label) untuk setiap data di bootstrap 5

model1 = modelPrediction(label1,indeksBoot1,DatasetTrain); % membuat model dengan mengembalikan hasil label1 yang baru pada training
model2 = modelPrediction(label2,indeksBoot2,DatasetTrain); % membuat model dengan mengembalikan hasil label2 yang baru pada training
model3 = modelPrediction(label3,indeksBoot3,DatasetTrain); % membuat model dengan mengembalikan hasil label3 yang baru pada training
model4 = modelPrediction(label4,indeksBoot4,DatasetTrain); % membuat model dengan mengembalikan hasil label4 yang baru pada training
model5 = modelPrediction(label5,indeksBoot5,DatasetTrain); % membuat model dengan mengembalikan hasil label5 yang baru pada training

akurasiBag1 = validationBootstrap(model1,DatasetTrain); % proses validasi model1 dengan data train
text = ['Akurasi Bag/Bootstrap 1 : ',num2str(akurasiBag1),' %'];
disp(text);
akurasiBag2 = validationBootstrap(model2,DatasetTrain); % proses validasi model2 dengan data train
text = ['Akurasi Bag/Bootstrap 2 : ',num2str(akurasiBag2),' %'];
disp(text);
akurasiBag3 = validationBootstrap(model3,DatasetTrain); % proses validasi model3 dengan data train
text = ['Akurasi Bag/Bootstrap 3 : ',num2str(akurasiBag3),' %'];
disp(text);
akurasiBag4 = validationBootstrap(model4,DatasetTrain); % proses validasi model4 dengan data train
text = ['Akurasi Bag/Bootstrap 4 : ',num2str(akurasiBag4),' %'];
disp(text);
akurasiBag5 = validationBootstrap(model5,DatasetTrain); % proses validasi model5 dengan data train
text = ['Akurasi Bag/Bootstrap 5 : ',num2str(akurasiBag5),' %'];
disp(text);

resultLabel = majorityVote(model1(:,3),model2(:,3),model3(:,3),model4(:,3),model5(:,3)); % melakukan proses voting dari semua label yang didapatkan
akurasi = calculateAccuracy(resultLabel,DatasetTrain(:,3)); % menghitung akurasi dari hasil voting terhadap label asli data train
text = ['Akurasi Total Setelah Majority Vote : ',num2str(akurasi),' %'];
disp(text);


modelTesting = fitcnb(cat(2,DatasetTrain(:,1),DatasetTrain(:,2)),resultLabel); % melakukan proses learning / fit model dengan label yang baru
prediksiTest = predict(modelTesting,DatasetTest); % melakukan prediksi untuk data test berdasarkan hasil learning
csvwrite("TebakanTugas4ML.csv",prediksiTest);  %membuat file csv 
disp("File 'TebakanTugas4ML.csv' telah berhasil dibuat");