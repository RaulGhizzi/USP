        %Programa Gerador de Matrizes diagonalmente dominantes%
                   %Raul Bortolotto Ghizzi, nº 7171220%
                           %Turma: Mecatrônica%

                           
                           
       
                           
                           
                           
                  
for n=100:100:1000
    
    n2 = int2str(n);                                                      
    arquivo = strcat('Ab',n2,'.txt');

    file = fopen(arquivo,'a');
    M=rand(n)*10;                                                          %Cria uma matriz                  
    soma = sum(M);
    
    
    
    for j=1:n                                                              %Transforma a Matriz em uma Matriz diagonalmente dominate  
        
        somaparcial = soma(j) - M(j,j);
        
        M(j,j) = M(j,j) + somaparcial;
                
    end 
    
     x = rand(1,n)*10;
     
     
     
     A(1:n,1:n) = M;
     A(n+1,1:n) = x;
     
     save(arquivo,'n','-ascii');
     save(arquivo,'M','-ascii','-append');
     save(arquivo,'x','-ascii','-append');
     

     fclose('all');
     
    
end


fclose('all');