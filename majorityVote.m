function resultLabel = majorityVote(label1,label2,label3,label4,label5)

    % fungsi ini bertujuan untuk melakukan proses voting dari ke 5
    % model prediksi yang telah didefinisikan sebelumnya.

    for i=1:size(label1,1)
        a = label1(i); % assign nilai label1
        b = label2(i); % assign nilai label2
        c = label3(i); % assign nilai label3
        d = label4(i); % assign nilai label4
        e = label5(i); % assign nilai label5
        barisVote = [a b c d e]; % membuat array dengan isi 5 label diatas
        resultLabel(i) = mode(barisVote); % vote dengan nilai modus (nilai yang paling sering muncul)
    end
end