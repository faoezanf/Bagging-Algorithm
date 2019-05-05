function akurasi = calculateAccuracy(label1,label2)

    % fungsi ini bertujuan untuk menghitung akurasi label1 terhadap label2

    jumBenar = 0; % inisialisasi jumlah benar dengan nilai 0
    jumData = size(label1,1); % jumlah data

    for i=1:jumData
        if label1(i) == label2(i) % jika label1 sama dengan label2 pada indeks yang sama,
            jumBenar = jumBenar+1; % jumlah benar ditambah 1
        end
    end

    akurasi = jumBenar / jumData * 100; % akumulasi akurasi
end