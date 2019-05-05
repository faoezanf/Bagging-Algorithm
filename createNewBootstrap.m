function [modelBootstrap,randomInteger] = createNewBootstrap(data,bagSize)
    
    % fungsi ini bertujuan untuk membuat bootstrap yang baru.

    jumData = size(data,1); %jumlah data
    for i=1:bagSize
        randomInteger(i) = randi(jumData); % random integer dari 1-jumlah data dengan angka yang boleh berulang
    end
    
    randomInteger = sort(randomInteger); % sorting pengurutan hasil dari random dari terkecil ke terbesar
    
    for i=1:bagSize
        modelBootstrap(i,1) = data(randomInteger(i),1); % assign atribut ke-1 sesuai data pada indeks berdasarkan random
        modelBootstrap(i,2) = data(randomInteger(i),2); % assign atribut ke-2 sesuai data pada indeks berdasarkan random
        modelBootstrap(i,3) = data(randomInteger(i),3); % assign label sesuai data pada indeks berdasarkan random
    end
    
end