        %Programa de Solução de sistemas lineares pelo método de Gauss-Seidel%
                            %Raul Bortolotto Ghizzi, nº 7171220%
                                    %Turma: Mecatrônica%


                                    
                                    
                                    
for cont=10:10:1000

cont2 = int2str(cont);                                                      
arquivo = strcat('matrizes/','Ab',cont2,'.txt');
                                                   
tam(cont/10,1) = cont;                                     
                                    
t1=tic;                    
fid = fopen(arquivo); %Abre o arquivo de entrada%                                 Ax=b
                                                                                       %M é a matrix A
n = fscanf(fid,'%f',1);     %Pega o tamanho n da matriz%                               %b é o vetor b.
A = zeros(n,n);             %Define a matriz A
temp = zeros(n,1);
tempo = zeros(200,1);
tempo2 = zeros(200,1);
mx = zeros(n,1);
%Pega as Matrizes do arquivo.
A = fscanf(fid,'%f',[n,n]); %Pega A do arquivo.
M = A';                     %Transpõe A para ficar na ordem certa.
B = fscanf(fid,'%f',[1,n]); %Pega o vetor B de Resultados.
b1 = B';                     %Transpõe B e forma o vetor R de resultado (Ax=R)
x = zeros(n,1);
x2 = zeros(n,1);
xg = linsolve(M,b1);         %Resolve o sistema para checar o gabarito.

%Decompõe A em L, D e R
L1 = zeros(n,n);     %Matriz inferior de M
D = zeros(n,n);     %Matriz diagonal de M
R1 = zeros(n,n);     %Matriz superior de M


for i=1:n
    
    for j=1:n
        if(i==j)
            D(i,j) = M(i,j);
        elseif(i>j)
            L1(i,j) = M(i,j);
        elseif(j>i)
            R1(i,j) = M(i,j);
            
        end
        
    end


end

D2 = inv(D);
L = D2*L1;
R = D2*R1
b = D2*b1;
%M2=L+R+eye(n);
M2=L+R;

%erro > 10^(-13)
 erro = 1;
 nit=0; %Número de Iterações
 
 clc;
 while(erro>10^(-14))
     t2=tic;
     
     x2=x;
     for i=1:n
     
          temp = sum(M2(i,1:n)*x(1:n,1));
          x(i,1)= b(i,1)-temp;
         
           
     end
  
  
     
     erro = (norm(x-x2)/norm(x));
    
     
     %if(erro<10^(-13))
     %    break;
     %end
     nit=nit+1;
     tempo(nit,1)=toc(t1);
     tempo2(nit,1)=toc(t2);
 end

fclose('all');
clc;

time = toc(t1);
numiter(cont/10,1)=nit;
tempo_total(cont/10,1) = toc(t1);

end