        %Programa de Decomposição L.U de uma matriz%
            %Raul Bortolotto Ghizzi, nº 7171220%
                    %Turma: Mecatrônica%

%   Detalhes sobre o programa:
%       - O programa lê um arquivo de entrada com o nome "dados.txt".
%       - Faz a decomposição L.U da matrix, M, lida.
%       - Se o sistema não tiver solução uma mensagem de erro é impressa na
%       janela de comando.
%       - Os resultados são impressos em três meios diferentes:
%           * As matrizes são impressas na tela do computador.
%           * As matrizes são impressas na janela de comando.
%           * As matrizes são impressas em arquivos com os respectivos
%           nomes das matrizes, os arquivos são criados na pasta onde o
%           programa esta sendo executado.
%       - Caso não queira que os resultados sejam impressos na tela
%       comentar as três funções ao final do programa (Imprime a Matrix L,
%       Imprime a Matrix U, Imprime o resultado x).
                    
             
                    
fid = fopen('dados.txt'); %Abre o arquivo de entrada%

n = fscanf(fid,'%d',1);     %Pega o tamanho n da matriz%
A = zeros(n,n);             %Define a matriz A
temp = zeros(1,n);

%Pega as Matrizes do arquivo.
A = fscanf(fid,'%f',[n,n]); %Pega A do arquivo.
%M = A';                    %Transpõe A para ficar na ordem certa.
B = fscanf(fid,'%f',[1,n]); %Pega o vetor B de Resultados.
R = B';                     %Transpõe B e forma o vetor R de resultado (Ax=R)

Mbackup = M;                %Guarda a Matriz M inalterada para imprimir depois.
xg = linsolve(M,R);         %Resolve o sistema para checar o gabarito.

if (det(M) == 0)            %Verifica se o determinante é igual a zero, no caso se o sistema tem uma única solução.
    erro = 'O sistema não tem solução única';
    %Imprime o erro
    disp(erro);
    


else
    
%Pivoteamento.
%for i=1:n-1
%    test = abs(M((i+1),i)/M(i,i));
%    if (test > 1000)        %se a valor for muito diferente faz o pivoteamento
%        
%        temp(1,:) = A(:,1); %Armazena a linha que tem o fator pequeno da matriz em um vetor temporário. Usei a matriz A pois a leitura do MatLab lê a matriz coluna por coluna e não linha por linha.
%        M(1,:) = M(i+1,:);  %Troca as linhas a serem pivotadas.
%        M(i+1,:)=temp(1,:); 
%            break;
%        
%    end
%end

%Decomposição L.U
   
U = M;                       %Matriz U da decomposição.
L = eye(n);                  %Matriz L da decomposição.   
Utemp = U;


for i=1:n-1                  %Coluna a ser analisada.   
    
    
    
    
    for j=i+1:n               %Percorre a Coluna a ser analisada.
       
       
    
        
    %Pivoteamento
    
    lpivo = i;
    
   for h=i:n-1
       
       if (abs(M(i,h+1))>abs(M(i,h)))
           lpivo = h+1;       %Pega o maior elemento da coluna, no caso a linha que será trocada no piteamento.
       end
              
       
   end
        
        temp(1,:) = M(i,:); %Armazena a linha que tem o fator pequeno da matriz em um vetor temporário. Usei a matriz A pois a leitura do MatLab lê a matriz coluna por coluna e não linha por linha.
        M(i,:) = M(lpivo,:);  %Troca as linhas a serem pivotadas.
        M(lpivo,:)=temp(1,:); 
        
    % Fim do Pivoteamento  
     
     p = (U(j,i)/U(i,i));  %p é o elemento pivo.
     
        L(j,i) = p;
        
        for k=i+1:n
            U(j,k) = U(j,k) - (p*U(i,k));
            
        end
        
        R(j,1) = R(j,1) - (p*R(i,1));
        
        
        
    end
   
        
        
    
    
    
    
    
   
end    

for i=1:n
    
    for j=i+1:n
        
        U(j,i) = 0;
        
    end    
    
end    

[Lg,Ug,P] = lu(M);                  %Usei a função L.U do MatLab para saber se o programa estava funcionando.


%Começa resolver o sistema agora, L*U*x = R, U*x = y  =>  L*y = R.



%Acha o y
y = zeros(n,1);

for i=1:n
        
    soma = 0;   %O valor de "soma" é a soma dos produto de L por y, esse valor muda a cada iteração quando um novo valor de y é encontrado.
    for j=1:n
     
        soma = soma + L(j,i)*y(j,1);
    
    end
    y(i,1) = R(i,1) - soma;  
     

end 

%Acha o x: U*x=y  ->  x=inv(U)*y

x = inv(U)*y;


%idsaida = fopen('saida.txt','a');

%fwrite(idsaida,'L: ');
dlmwrite('Matriz_L.txt',L,'newline','pc','delimiter','\t');
dlmwrite('Matriz_U.txt',U,'newline','pc','delimiter','\t');
dlmwrite('Solucao_x.txt',x,'newline','pc','delimiter','\t');
%dlmwrite('Matriz_Pivotada.txt',M,'newline','pc','delimiter','\t');

%Imprime a Matrix L na janela de comando
disp('Matrix L');                                                                  %Imprime a matrix na janela de comando
disp(L);

%Imprime a Matrix U na janela de comando
disp('Matrix U');
disp(U);

%Imprime o Resultado x na janela de comando
disp('Resultado x');
disp(x);






%Caso não queira imprimir o resultado na tela é só comentar as três funções
%abaixo.


%Imprime a Matrix L
fL = figure('Name','Matrix L','Position', [100, 0, 400, 400],'NumberTitle','off'); %Cria a janela
tL = uitable('parent',fL,'Position', [ 0, 0, 399, 399]);                           %cria a caixa de texto dentro da janela   
set(tL,'Data',L);                                                                  %Imprime a matrix na caisa de texto


%Imprime a Matrix U
fU = figure('Name','Matrix U','Position', [505, 0, 400, 400],'NumberTitle','off');
tU = uitable('parent',fU,'Position', [ 0, 0, 399, 399]);
set(tU,'Data',U);


%Imprime o resultado x
fx = figure('Name','Resultado X','Position', [905, 0, 400, 400],'NumberTitle','off');
tx = uitable('parent',fx,'Position', [ 0, 0, 399, 399]);
set(tx,'Data',x);

%Imprime a Matrix Original M
%fM = figure('Name','Matrix Original M','Position', [300, 300, 400, 400],'NumberTitle','off');
%tM = uitable('parent',fM,'Position', [ 0, 0, 399, 399]);
%set(tM,'Data',Mbackup);
%disp('Matrix Original M');
%disp(M);

%%Imprime a Matrix M já Pivotada
%fMP = figure('Name','Matrix M já pivotada','Position', [800, 300, 400, 400],'NumberTitle','off');
%tMP = uitable('parent',fMP,'Position', [ 0, 0, 399, 399]);
%set(tMP,'Data',M);


%movefile('Matriz_L.txt','C:\Resultados');         %Move o arquivo .txt da matriz L para a pasta resultados.
%movefile('Matriz_U.txt','C:\Resultados');         %Move o arquivo .txt da matriz U para a pasta resultados.
%movefile('Solucao_x.txt','C:Resultados');        %Move o arquivo .txt da solução x para a pasta resultados.
%movefile('Matriz_Pivotada.txt','C:\Raul\USP\3º Semestre\Métodos Numéricos\Trabalho 1\Resultados');  %Move o arquivo .txt da matriz M pivotada para a pasta resultados.

end
fclose('all');

