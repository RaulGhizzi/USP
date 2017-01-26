                        %Programa de Solução de sistemas lineares pelo método de Gauss-Seidel%
                                            %Raul Bortolotto Ghizzi, nº 7171220%
                                                    %Turma: Mecatrônica%





                                                    
                                                    
for h = 10:10:1000                                                    
                                                    
h2 = int2str(h);                                                      
arquivo = strcat('matrizes/','Ab',h2,'.txt');
arquivo2 = strcat('Resultado',h2,'.txt');                                                    
tam(h/10,1) = h;                                                    
                                                    

t1=tic;                    
fid = fopen(arquivo); %Abre o arquivo de entrada%                                 Ax=b
                                                                                       %M é a matrix A
n = fscanf(fid,'%f',1);     %Pega o tamanho n da matriz%                               %b é o vetor b.
A = zeros(n,n);             %Define a matriz A
temp = zeros(n,1);

%Pega as Matrizes do arquivo.
A = fscanf(fid,'%f',[n,n]); %Pega A do arquivo.
M = A';                     %Transpõe A para ficar na ordem certa.
B = fscanf(fid,'%f',[1,n]); %Pega o vetor B de Resultados.
b1 = B';                    %Transpõe B e forma o vetor R de resultado (Ax=R)
% x = zeros(n,1);
nit = 1
tempo = zeros(1000,1);


xg = linsolve(M,b1);        %Resolve o sistema para checar o gabarito.



v = zeros(n,1000);
p = zeros(n,1000);
r = zeros(n,1000);
alfa = zeros(1,1000);
q = zeros(1,1000);

t3=tic;
r(1:n,1)=-B;
p(1:n,2)=-r(1:n,1);

q(1,2)=(dot(r(1:n,1),r(1:n,1)))/(dot(M*r(1:n,1),r(1:n,1)));

v(1:n,2) = v(1:n,1) - q(1,2)*r(1:n,1);
% r(1:n,2) = r(1:n,1) + q(1,2)*M*p(1:n,2);
% tempo(1,1) = toc(t3);




for k=2:999
    
%     t2=tic;
    
    r(1:n,k) = r(1:n,k-1) + q(1,k)*M*p(1:n,k);
    
    alfa(1,k) = (dot(r(1:n,k),r(1:n,k)))/(dot(r(1:n,k-1),r(1:n,k-1)));
    
    p(1:n,k+1)= alfa(1,k)*p(1:n,k) - r(1:n,k);
   
    q(1,k+1)=(dot(r(1:n,k),r(1:n,k)))/(dot(M*p(1:n,k+1),p(1:n,k+1)));
    
    v(1:n,k+1) = v(1:n,k) + q(1,k+1)*p(1:n,k+1);
    
     
    erro = (norm(v(1:n,k) - v(1:n,k-1))/norm(v(1:n,k)))
    
    
    
    nit = nit + 1;
%     tempo(nit,1) = toc(t2);
    
    if (erro<10^(-13))
        
        x =  v(1:n,k+1);
        break;
        
    end
   
    
 end












%plot(tempo);


fclose('all');
clc;

tempo_total(h/10,1) = toc(t1);

% if((x-xg)<10^(-10))
%     
%     disp('O Método Convergiu');
%     
% end

numiter(h/10,1)=nit;

end 


