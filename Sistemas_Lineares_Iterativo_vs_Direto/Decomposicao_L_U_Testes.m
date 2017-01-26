        %Programa de Decomposi��o L.U de uma matriz%
            %Raul Bortolotto Ghizzi, n� 7171220%
                    %Turma: Mecatr�nica%

%   Detalhes sobre o programa:
%       - O programa l� um arquivo de entrada com o nome "dados.txt".
%       - Faz a decomposi��o L.U da matrix, M, lida.
%       - Se o sistema n�o tiver solu��o uma mensagem de erro � impressa na
%       janela de comando.
%       - Os resultados s�o impressos em tr�s meios diferentes:
%           * As matrizes s�o impressas na tela do computador.
%           * As matrizes s�o impressas na janela de comando.
%           * As matrizes s�o impressas em arquivos com os respectivos
%           nomes das matrizes, os arquivos s�o criados na pasta onde o
%           programa esta sendo executado.
%       - Caso n�o queira que os resultados sejam impressos na tela
%       comentar as tr�s fun��es ao final do programa (Imprime a Matrix L,
%       Imprime a Matrix U, Imprime o resultado x).



for cont=10:10:1000

cont2 = int2str(cont);                                                      
arquivo = strcat('matrizes/','Ab',cont2,'.txt');
arquivo2 = strcat('Resultado',cont2,'.txt');                                                    
tam(cont/10,1) = cont;                                                    
                                                    

t1 = tic;                    
fid = fopen(arquivo); %Abre o arquivo de entrada%

n = fscanf(fid,'%f',1);     %Pega o tamanho n da matriz%
A = zeros(n,n);             %Define a matriz A
temp = zeros(1,n);

%Pega as Matrizes do arquivo.
A = fscanf(fid,'%f',[n,n]); %Pega A do arquivo.
M = A';                     %Transp�e A para ficar na ordem certa.
B = fscanf(fid,'%f',[1,n]); %Pega o vetor B de Resultados.
R = B';                     %Transp�e B e forma o vetor R de resultado (Ax=R)

%Mbackup = M;                %Guarda a Matriz M inalterada para imprimir depois.
xg = linsolve(M,R);         %Resolve o sistema para checar o gabarito.

if (det(M) == 0)            %Verifica se o determinante � igual a zero, no caso se o sistema tem uma �nica solu��o.
    erro = 'O sistema n�o tem solu��o �nica';
    %Imprime o erro
    disp(erro);
    


else


%Decomposi��o L.U
   
U = M;                       %Matriz U da decomposi��o.
L = eye(n);                  %Matriz L da decomposi��o.   
Utemp = U;


for i=1:n-1                  %Coluna a ser analisada.   
    
    
    
    
    for j=i+1:n               %Percorre a Coluna a ser analisada.
       
       
    
        
   %Pivoteamento
    
   lpivo = i;
    
   for h=i:n-1
       
       if (abs(M(i,h+1))>abs(M(i,h)))
           lpivo = h+1;       %Pega o maior elemento da coluna, no caso a linha que ser� trocada no piteamento.
       end
              
       
   end
        
        temp(1,:) = M(i,:); %Armazena a linha que tem o fator pequeno da matriz em um vetor tempor�rio. Usei a matriz A pois a leitura do MatLab l� a matriz coluna por coluna e n�o linha por linha.
        M(i,:) = M(lpivo,:);  %Troca as linhas a serem pivotadas.
        M(lpivo,:)=temp(1,:); 
        
    % Fim do Pivoteamento  
     
     p = (U(j,i)/U(i,i));  %p � o elemento pivo.
     
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

[Lg,Ug,P] = lu(M);                  %Usei a fun��o L.U do MatLab para saber se o programa estava funcionando.


%Come�a resolver o sistema agora, L*U*x = R, U*x = y  =>  L*y = R.



%Acha o y
y = zeros(n,1);

for i=1:n
        
    soma = 0;   %O valor de "soma" � a soma dos produto de L por y, esse valor muda a cada itera��o quando um novo valor de y � encontrado.
    for j=1:n
     
        soma = soma + L(j,i)*y(j,1);
    
    end
    y(i,1) = R(i,1) - soma;  
     

end 

%Acha o x: U*x=y  ->  x=inv(U)*y

x = inv(U)*y;




end
fclose('all');

tempo_total(cont/10,1) = toc(t1);

end
