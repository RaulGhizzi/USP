


display('Digite o nome da figura (incluindo a sua exten��o, ex: grafico.jpg):')
arquivo = input('' , 's'); % espera o input do usu�rio com o nome do arquivo .txt



i = imread(arquivo); %abre a imagem


img = im2bw(i); %converte para uma matrix binaria
xcanto1 = [0 0]; %coordenadas do canto superior esquerdo do gr�fico
xcanto2 = [0 0]; %coordenadas do canto inferior direito do gr�fico
xtemp = [0 0]; %coordenadas tempor�rias



%   j j j j 
% i
% i
% i
% i

% aprox = input(' Entre com o tipo de aproxima��o: \n 1 - Expon�ncial\n 2 - Senoides\n 3 - Fourrier\n 4 - Gaussiana\n ');%pega o tipo de aproxima��o desejada
% 
% switch aprox
%     case 1
%         precisao = input(' Entre com precis�o da aproxima��o : \n 1 - Expon�ncial Sinples\n 2 - Expon�ncial Dupla\n ');        
%         aproxtype = strcat('exp',precisao);
%     case 2
%         precisao = input(' Entre com o n�mero de sen�ides da aproxima��o : \n 1 - Sen�ide Simples\n 2 - Duas Sen�ides\n 3 - Tres Sen�ides\n 4 - Quatro Sen�ides\n 5 - Cinco Sen�ides\n 6 - Seis Sen�ides\n 7 - Sete Sen�ides\n 8 - Oito Sen�ides\n ');        
%         aproxtype = strcat('sin',precisao);        
%     case 3
%         precisao = input(' Entre com o n�mero de termos da s�rie de Fourrier da aproxima��o : \n 1 - Um Termo\n 2 - Dois Termos\n 3 - Tres Termos\n 4 - Quatro Termos\n 5 - Cinco Termos\n 6 - Seis Termos\n 7 - Sete Termos\n 8 - Oito Termos\n ');        
%         aproxtype = strcat('fourrier',precisao);         
%     case 4
%         precisao = input(' Entre com o n�mero de modelos Gaussianos da aproxima��o : \n 1 - Um Modelo\n 2 - Dois Modelos\n 3 - Tres Modelos\n 4 - Quatro Modelos\n 5 - Cinco Modelos\n 6 - Seis Modelos\n 7 - Sete Modelos\n 8 - Oito Modelos\n ');        
%         aproxtype = strcat('gauss',precisao);         
%     otherwise
%       disp('M�todo inv�lido.');
% end

xmin = input(' X m�nimo do gr�fico: ');%pega o x m�nimo do gr�fico
xmax = input(' X m�ximo do gr�fico: ');%pega o x m�ximo do gr�fico
ymin = input(' Y m�nimo do gr�fico: ');%pega o y m�nimo do gr�fico
ymax = input(' Y m�ximo do gr�fico: ');%pega o y m�ximo do gr�fico

% xmin = 0;
% xmax = 1000;
% ymax = 0;
% ymin = 5;



%acha o canto superior esquedo da figura
for j=1:560
   for i=1:420
       
       if (img(i,j)==0) %acha um ponto qualquer no grafico
           cont=1;
           xtemp = [i j]; %armazena temporariamente as coodenadas
           while(img(i,j)==0)
               i = i+1; %continua passando o i;
               
               if (cont>20)% se percorrer mais de 20 colunas significa que o programa achou uma das bordas do grafico
                   xcanto1 = xtemp;
                   i = xcanto1(1,1);
                   break;
               end
               
               cont = cont + 1;
           end
          
             break;
           
           
       end
        
       
   end
   
    if (xcanto1(1,1) ~= 0)
        break;
    end
    
end


%acha o canto inferior direito
i = xcanto1(1,1);
j = xcanto1(1,2);
while(img(i,j)==0) %acha a linha mais inferior
    
    i = i+1;    
    
end
xcanto2(1,1) = i-1;

i = xcanto1(1,1);
j = xcanto1(1,2);
while(img(i,j)==0) %acha a coluna mais a direita
    
    j = j+1;    
    
end

xcanto2(1,2) = j-1;


img2=img(xcanto1(1,1)+1:xcanto2(1,1)-1,xcanto1(1,2)+1:xcanto2(1,2)-1); %cria uma nova matriz s� com a regi�o de interesse para an�lise, retirando toda a �rea externa inclusive os v�rtices do gr�fico
xtemp = size(img2);
i = 1;
j = 1;
%retira as marca��es de escala dos gr�ficos

for i=1:xtemp(1,1) %limpa margem esquerda
    
    if(img2(i,j:j+3)==0)
       
        img2(i,j:j+3) = 1;
        
    end

   
end
i = 1;
j = 1;

for j=1:xtemp(1,2) %limpa margem superior
    
    if(img2(i:i+3,j)==0)
       
        img2(i:i+3,j) = 1;
        
    end

   
end

i=xtemp(1,1);
j=xtemp(1,2);

for i=1:xtemp(1,1) %limpa a margem direita
    
    if(img2(i,j-4:j)==0)
       
        img2(i,j-4:j) = 1;
        
    end

   
end

i=xtemp(1,1);
j=xtemp(1,2);



for j=1:xtemp(1,2) %limpa a margem inferior
    
    if(img2(i-4:i,j)==0)
       
        img2(i-4:i,j) = 1;
        
    end

   
end

%nesse ponto a 'img2' � uma imagem do gr�fico isolado

j = 1;
i = 1;
cont = 1;
for j=1:xtemp(1,2)%pega os pontos da curva
   for i=1:xtemp(1,1)
       
       if(img2(i,j)==0)
           
           pontoy(cont) = i;
           pontox(cont) = j;           
           cont = cont + 1;
           
       end
       
       
   end
   
   
end
tam = size(pontoy);
for i=1:tam(1,2)

    
      pontosx(i) = xtemp(1,2) - pontox(i);
      pontosy(i) = xtemp(1,1) - pontoy(i);

end



for i=0:tam(1,2)-1

     pontosx2(1,i+1) = xtemp(1,2) - pontosx(1,tam(1,2)-i);
     pontosy2(1,i+1) = pontosy(1,tam(1,2)-i);
      

end

px2 = pontosx2';  %px e py s�o as coordenadas dos pontos obtidos
py2 = pontosy2';

delx = xmax - xmin;%pega o delta x real do gr�fico
dely = ymax - ymin;%pega o delta y real do grafico
delkx = xtemp(1,2);%pega o delta x no grafico obtido
delky = xtemp(1,1);%pega o delta y no grafico obtido
 for i=1:tam(1,2)

     px3(i,1) = xmin + (px2(i,1)/delkx)*delx;
     py3(i,1) = ymin + (py2(i,1)/delky)*dely;
      

 end

 
 for i=1:tam(1,2)

    
      px(i,1) = xmin + (xmax - px3(i,1));
      py(i,1) = ymin + (ymax - py3(i,1));

 end

 
for i=1:tam(1,2)

     px(i,1) = xmin + (px(i,1) - px(tam(1,2),1));
     px = abs(px);
     %py(i,1) = py(tam(1,2),1);
      

end
px = px3;
py = py3;


aprox = input(' Entre com o tipo de aproxima��o: \n 1 - Expon�ncial\n 2 - Senoides\n 3 - Fourrier\n 4 - Gaussiana\n ');%pega o tipo de aproxima��o desejada

switch aprox
    case 1
        precisao = input(' Entre com precis�o da aproxima��o : \n 1 - Expon�ncial Sinples\n 2 - Expon�ncial Dupla\n ');        
            switch precisao
                case 1
                    f = fit(px,py,'exp1');
                case 2
                    f = fit(px,py,'exp2');
                otherwise
                    disp('Precis�o inv�lida.');
            end
        
    case 2
        precisao = input(' Entre com o n�mero de sen�ides da aproxima��o : \n 1 - Sen�ide Simples\n 2 - Duas Sen�ides\n 3 - Tres Sen�ides\n 4 - Quatro Sen�ides\n 5 - Cinco Sen�ides\n 6 - Seis Sen�ides\n 7 - Sete Sen�ides\n 8 - Oito Sen�ides\n ');        
        switch precisao
                case 1
                    f = fit(px,py,'sin1');
                case 2
                    f = fit(px,py,'sin2');
                case 3
                    f = fit(px,py,'sin3');
                case 4
                    f = fit(px,py,'sin4');
                case 5
                    f = fit(px,py,'sin5');
                case 6
                    f = fit(px,py,'sin6');
                case 7
                    f = fit(px,py,'sin7');
                case 8
                    f = fit(px,py,'sin8');
                otherwise
                    disp('Precis�o inv�lida.');
        end        
               
    case 3
        precisao = input(' Entre com o n�mero de termos da s�rie de Fourrier da aproxima��o : \n 1 - Um Termo\n 2 - Dois Termos\n 3 - Tres Termos\n 4 - Quatro Termos\n 5 - Cinco Termos\n 6 - Seis Termos\n 7 - Sete Termos\n 8 - Oito Termos\n ');        
        
        switch precisao
                case 1
                    f = fit(px,py,'fourier1');
                case 2
                    f = fit(px,py,'fourier2');
                case 3
                    f = fit(px,py,'fourier3');
                case 4
                    f = fit(px,py,'fourier4');
                case 5
                    f = fit(px,py,'fourier5');
                case 6
                    f = fit(px,py,'fourier6');
                case 7
                    f = fit(px,py,'fourier7');
                case 8
                    f = fit(px,py,'fourier8');
                otherwise
                    disp('Precis�o inv�lida.');
            end
        
               
    case 4
        precisao = input(' Entre com o n�mero de modelos Gaussianos da aproxima��o : \n 1 - Um Modelo\n 2 - Dois Modelos\n 3 - Tres Modelos\n 4 - Quatro Modelos\n 5 - Cinco Modelos\n 6 - Seis Modelos\n 7 - Sete Modelos\n 8 - Oito Modelos\n ');        
        
        switch precisao
                case 1
                    f = fit(px,py,'gauss1');
                case 2
                    f = fit(px,py,'gauss2');
                case 3
                    f = fit(px,py,'gauss3');
                case 4
                    f = fit(px,py,'gauss4');
                case 5
                    f = fit(px,py,'gauss5');
                case 6
                    f = fit(px,py,'gauss6');
                case 7
                    f = fit(px,py,'gauss7');
                case 8
                    f = fit(px,py,'gauss8');
                otherwise
                    disp('Precis�o inv�lida.');
            end
        
        
                 
    otherwise
      disp('M�todo inv�lido.');
end


%  f = fit(px,py,aproxtype);
%  f = fit(px,py,'exp1');
clc;
plot(f);
disp(f);


