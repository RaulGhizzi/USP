



          







main()
{     
      
       struct conta  //Struct base do banco de dados das contas
           {
                  int tipoconta;
                  char nome[20];
                  char sobrenome[20];
                  int numeroconta;
                  float dinconta;
                  int senha;
                  float valorjatransferido;
                  int numerodetransferencias;
                  int nummaxdetransferencias;
                  float limitedetransferencia;
                  float credito;
                  int numdesaques;
                  int limitedesaque;
                  int nummaxdesaques;
                  
           };
       int ncontas;
       int transferidor, transferida;
       int verificador, verif1, verif2, verif3, verif4;
       int i,k,j;
       int cel100, cel50, cel20, cel10, cel5, cel2;
       int nop,codop;
       int limitesaque, limitetransferencia, credito, nummaxsaques;
       int numeroconta1,numeroconta2, senha1, numconta, senha, saldo;
       int limitetransferencia1 = 1000,limitetransferencia2 = 2000,limitetransferencia3 = 5000,limitetransferencia4 = 10000;
       
       int nummaxtransferencias1 = 2, nummaxtransferencias2 = 3 , nummaxtransferencias3 = 1000000, nummaxtransferencias4 = 1000000, nummaxdetransferencias;
       float  valortransferido;
       scanf("%d",&ncontas) ; //Pega o numero de contas a serem criadas
       float dinheiroconta[ncontas];
       struct conta dados[ncontas];
       for(i=0;i<ncontas;i++) //Pega os dados do cadastro
                              {
                                  scanf("%d",&(dados[i].tipoconta));
                                  scanf("%s",&(dados[i].nome));
                                  scanf("%s",&(dados[i].sobrenome));
                                  scanf("%d",&(dados[i].numeroconta));
                                  scanf("%f",&(dados[i].dinconta));
                                  scanf("%d",&(dados[i].senha)); 
                                  
                                  
                                      
                              
                              
                                              
                                              
                                              if (dados[i].tipoconta==1)//Universitario
                                                   {
                                              (dados[i].dinconta)=(dados[i].dinconta)+50;
                                              (dados[i].nummaxdetransferencias) = nummaxtransferencias1;
                                              (dados[i].nummaxdesaques) = 1;
                                              (dados[i].credito) = 50.00;
                                              (dados[i].limitedetransferencia) = 1000;
                                              (dados[i].limitedesaque) = 300;
                                              (dados[i].valorjatransferido) = 0;
                                              (dados[i].numerodetransferencias) = 0;
                                              (dados[i].numdesaques) = 0;
                                                   }
                                              else if (dados[i].tipoconta==2)//Normal
                                                   {
                                              (dados[i].dinconta)=(dados[i].dinconta)+100;
                                              (dados[i].nummaxdetransferencias) = nummaxtransferencias2;
                                              (dados[i].nummaxdesaques) = 2;
                                              (dados[i].credito) =100;
                                              (dados[i].limitedetransferencia) = 2000;
                                              (dados[i].limitedesaque) = 1000;
                                              (dados[i].valorjatransferido) = 0;
                                              (dados[i].numerodetransferencias) = 0;
                                              (dados[i].numdesaques) = 0;                                              
                                                   }                           
                                              else if (dados[i].tipoconta==3)//Especial
                                                   {
                                              (dados[i].dinconta)=(dados[i].dinconta)+500;
                                              (dados[i].nummaxdetransferencias) = nummaxtransferencias3;
                                              (dados[i].nummaxdesaques) = 10;
                                              (dados[i].credito) =500;
                                              (dados[i].limitedetransferencia) = 5000;
                                              (dados[i].limitedesaque) = 2000;
                                              (dados[i].valorjatransferido) = 0;
                                              (dados[i].numerodetransferencias) = 0;
                                              (dados[i].numdesaques) = 0;
                                                   }
                                              else if (dados[i].tipoconta==4)//VIP
                                                   {
                                              (dados[i].dinconta)=(dados[i].dinconta)+2000;
                                              (dados[i].nummaxdetransferencias) = nummaxtransferencias4;
                                              (dados[i].nummaxdesaques) = 10000000;
                                              (dados[i].credito) =2000;
                                              (dados[i].limitedetransferencia) = 10000;
                                              (dados[i].limitedesaque) = 3000;
                                              (dados[i].valorjatransferido) = 0;
                                              (dados[i].numerodetransferencias) = 0;
                                              (dados[i].numdesaques) = 0;
                                                   }
                                              
                                              
                                              
                                              
                                   printf("Tipo:%d\nNome:%s\nSobrenome:%s\nNumero da Conta:%d\nDinheiro na conta:%f\nSenha:%d\n",dados[i].tipoconta,dados[i].nome,dados[i].sobrenome,dados[i].numeroconta,dados[i].dinconta,dados[i].senha);           
                                   
                              
                              }  
       scanf("%d",&cel100); //Pega a quantidade de cédulas.
       scanf("%d",&cel50);   
       scanf("%d",&cel20);
       scanf("%d",&cel10);
       scanf("%d",&cel5);
       scanf("%d",&cel2);
       
       printf("Notas:\n100:%d\n50:%d\n20:%d\n10:%d\n5:%d\n2:%d\n",cel100,cel50,cel20,cel10,cel5,cel2);
       
       scanf("%d",&nop); // Numero de Operações  a serem realizadas
       
        
       for (k=0;k<nop;k++) //Loop para realizar as operações
           {
                                 
                                 
                                 scanf("%d",&codop); //código da operação a ser realizada
                                 
                                
                                
if (codop==1)
{    //inicio da operaçao saldo
          scanf ("%d", &numconta);
          //verificador     
          verif1=numconta/10000;
          verif2=(numconta-verif1*10000)/1000;
          verif3=(numconta-verif1*10000-verif2*1000)/100;
          verif4=(numconta-verif1*10000-verif2*1000-verif3*100)/10;
          verificador=(verif1*9+verif2*8+verif3*7+verif4*6)%11;
          if (verificador==10) 
                  verificador=0;
          else if (verificador!=10) verificador=verificador;        
          if (verificador==numconta-verif1*10000-verif2*1000-verif3*100-verif4*10)
          {   
             for (k=0; k<ncontas; k++)
             {
                 
                  if (numconta==dados[k].numeroconta)
                  {
                        scanf("%d", &senha);
                        if (senha==dados[k].senha)
                        {
                                /*if (dados[k].tipoconta==1)
                                saldo=(dados[k].dinconta)+50;
                                else if (dados[k].tipoconta==2)
                                saldo=(dados[k].dinconta)+100;
                                else if (dados[k].tipoconta==3)
                                saldo=(dados[k].dinconta)+500;
                                else if (dados[k].tipoconta==4)
                                saldo=(dados[k].dinconta)+2000; */
                                printf ("%.2f\n",(dados[k].dinconta));
                                break;
                        }                      
                                     
                       else 
                               {
                                printf ("Erro: 7000\n");
                                break;
                               }
                  }
                                    
                  else if (k==ncontas-1 && numconta!=dados[ncontas-1].numeroconta) 
                        printf("Erro: 6000\n");
             }
          }
                                                   
                            
               else 
                      printf("Erro: 6100\n");
} 
else if (codop==2) //Saque
{
                                 int numeroconta1;
                                
                                 scanf("%d",&numeroconta1);
                                  
                                               verif1=numeroconta1/10000;
                                               verif2=(numeroconta1-verif1*10000)/1000;
                                               verif3=(numeroconta1-verif1*10000-verif2*1000)/100;
                                               verif4=(numeroconta1-verif1*10000-verif2*1000-verif3*100)/10;
                                               verificador=(verif1*9+verif2*8+verif3*7+verif4*6)%11;
                                               if (verificador==10) 
                                                  verificador=0;
                                               else if(verificador!=10) 
                                                    verificador = verificador;
                                                    
                                              // Chega o numero verificador da conta
                                              if (verificador != (numeroconta1  -verif1*10000 - verif2*1000 - verif3*100 - verif4*10)) 
                                                   {
                                                     printf("6100\n"); //Código verificador errado
                                                     continue;
                                                   }
                                                   
                                 int ncel100, ncel50, ncel20, ncel10, ncel5, ncel2, resto, j, caso, senha1, valor, sit=0;
                                 float saldo;
                                                                                   
                                              for (j=0;j<=ncontas;)
                                                  {
                                                       if (numeroconta1==dados[j].numeroconta)
                                                            break;
                                                     else 
                                                            j++;
                                                  }                                              
             
                                              scanf("%d", &valor);
                                              scanf("%d", &senha1);
                                              ncel100=valor/100;
                                              ncel50=(valor-ncel100*100)/50;
                                              ncel20=(valor-ncel100*100-ncel50*50)/20;
                                              ncel10=(valor-ncel100*100-ncel50*50-ncel20*20)/10;
                                              ncel5=(valor-ncel100*100-ncel50*50-ncel20*20-ncel10*10)/5;
                                              ncel2=(valor-ncel100*100-ncel50*50-ncel20*20-ncel10*10-ncel5*5)/2;
                                              resto=valor-ncel100*100-ncel50*50-ncel20*20-ncel10*10-ncel5*5-ncel2*2;
                                              printf("Notas:\n100:%d\n50:%d\n20:%d\n10:%d\n5:%d\n2:%d\n%d\n",ncel100,ncel50,ncel20,ncel10,ncel5,ncel2,resto);
                                              
                                              if (ncel100>cel100)
                                                 {ncel50=ncel50+ 2*(ncel100-cel100);
                                                 ncel100=cel100;}
                                              
                                              if (ncel50>cel50)
                                                 {ncel20=ncel20+2*(ncel50-cel50);
                                                 ncel10=ncel10+ (ncel50-cel50);
                                                 ncel50=cel50;}
                                              
                                              if(ncel20>cel20)
                                                {ncel10+ncel10+2*(ncel20-cel20);
                                                ncel20=cel20;}
                                              
                                              if(ncel10>cel10)
                                                {ncel5=ncel5+2*(ncel10-cel10);
                                                ncel10=cel10;}
                                              
                                              if(ncel5>cel5)
                                               {
                                                  if((ncel5-cel5)%2==0)
                                                   {ncel2=ncel2+(ncel5-cel5)*5/2;
                                                    ncel5=cel5;}
                                                   else if((ncel5-cel5)%2!=0)
                                                    sit=1;
                                               }
                                               
                                               if (ncel2>cel2)
                                               sit=1;                                   
                                                           
                                              if (resto!=0)
                                              sit=1;
                                              printf("Notas:\n100:%d\n50:%d\n20:%d\n10:%d\n5:%d\n2:%d\n%d\n%d\n",ncel100,ncel50,ncel20,ncel10,ncel5,ncel2,resto,sit);
                                              
                                              
                    if(sit==1)
                       printf("Erro:8000");
                                              
                    else if (sit!=1)
                      {
                          if(dados[j].tipoconta==1)
                               {
                                      if (valor<=300 && valor<=dados[j].dinconta && dados[j].numdesaques<dados[j].nummaxdesaques)  
                                           {
                                              caso=1;
                                              dados[j].dinconta=dados[j].dinconta-valor;
                                               //saldo=dados[j].dinconta+50;
                                               dados[j].numdesaques=dados[j].numdesaques+1;
                                           }
                                      else if (valor>300)
                                         caso=2;
                                       else if (valor>dados[j].dinconta)
                                         caso=3;
                                      else if (dados[j].numdesaques==dados[j].nummaxdesaques)
                                          caso=4;
                             }
                        else if (dados[j].tipoconta==2)
                            {
                                if (valor<=1000 && valor<=dados[j].dinconta && dados[j].numdesaques<dados[j].nummaxdesaques) 
                                     {
                                       caso=1;
                                       dados[j].dinconta=dados[j].dinconta-valor;
                                                    //saldo=dados[j].dinconta+100                                                    
                                       dados[j].numdesaques=dados[j].numdesaques+1;
                                     }
                              else if (valor>1000)
                                  caso=2;
                             else if (valor>dados[j].dinconta)
                                  caso=3;
                             else if (dados[j].numdesaques==dados[j].nummaxdesaques)
                                  caso=4;
                           }
                      else if (dados[j].tipoconta==3)
                           {
                               if (valor<=2000 && valor<=dados[j].dinconta && dados[j].numdesaques<dados[j].nummaxdesaques) 
                                   {
                                        caso=1;
                                        dados[j].dinconta=dados[j].dinconta-valor;
                                                    //saldo=dados[j].dinconta+500
                                        dados[j].numdesaques=dados[j].numdesaques+1;
                                    }
                              else if (valor>2000)
                                   caso=2;
                              else if (valor>dados[j].dinconta)
                                    caso=3;
                              else if (dados[j].numdesaques==dados[j].nummaxdesaques)
                                     caso=4;
                          }
                    else if (dados[j].tipoconta==4)
                          {
                              if (valor<=3000 && valor<=dados[j].dinconta)
                                    {
                                      caso=1;
                                      dados[j].dinconta=dados[j].dinconta-valor;
                                                    //saldo=dados[j].dinconta
                                    }
                              else if (valor>3000)
                                    caso=2;
                              else if (valor>dados[j].dinconta)
                                     caso=3;
                         }
                                                    
       
                     if (caso==1)
                         {
                              if (senha1==dados[j].senha)
                                 printf("%d %d %d %d %d %d %10.2f", ncel100, ncel50, ncel20, ncel10, ncel5, ncel2, dados[j].dinconta);
                              else 
                                 printf("Erro: 7000");
                         }
                   else if (caso==2)
                         printf("Erro:1000");
                  else if (caso==3)
                        printf("Erro:5000");
                  else if (caso==4)
                        printf("Erro : 3000");
           }
}

                             
                                      
else if (codop==3)
{   //inicio da operçao depósito
          float deposito;
          scanf ("%d", &numconta);
                   
          //verificador     
          verif1=numconta/10000;
          verif2=(numconta-verif1*10000)/1000;
          verif3=(numconta-verif1*10000-verif2*1000)/100;
          verif4=(numconta-verif1*10000-verif2*1000-verif3*100)/10;
          verificador=(verif1*9+verif2*8+verif3*7+verif4*6)%11;
          if (verificador==10) 
                  verificador=0;
          else if (verificador!=10) verificador=verificador;        
          if (verificador==numconta-verif1*10000-verif2*1000-verif3*100-verif4*10)
          {   
             for (k=0; k<ncontas; k++)
             {
                  if (numconta==dados[k].numeroconta)
                  {
                                scanf ("%f", &deposito);                                                                                                                                                                                                                                                                                                                                                                                                                     
                                (dados[k].dinconta)=(dados[k].dinconta)+deposito; 
                                printf ("%f", dados[k].dinconta);
                                printf ("OK\n");
                                break;
                  }                      
                                     
                   else if (k==ncontas-1 && numconta!=dados[ncontas-1].numeroconta)
                        printf("Erro: 6000\n");
             }
          }
                                                   
                            
               else 
                      printf("Erro: 6100\n");

                      
}    
         
      
   
                                                   
                                                   
                                                   
                                      
                                 else if(codop==4)  //Transferencia                                      
                                  {
                                            
                                       
                                              scanf("%d",&numeroconta1); //Pega o numero da primeira conta                                                                                         
                                              
                                               verif1=numeroconta1/10000;
                                               verif2=(numeroconta1-verif1*10000)/1000;
                                               verif3=(numeroconta1-verif1*10000-verif2*1000)/100;
                                               verif4=(numeroconta1-verif1*10000-verif2*1000-verif3*100)/10;
                                               verificador=(verif1*9+verif2*8+verif3*7+verif4*6)%11;
                                               if (verificador==10) 
                                                  verificador=0;
                                               else if(verificador!=10) 
                                                    verificador = verificador;
                                                    
                                              // Chega o numero verificador da conta
                                              if (verificador != (numeroconta1  -verif1*10000 - verif2*1000 - verif3*100 - verif4*10)) 
                                                   {
                                                     printf("6100\n"); //Código verificador errado
                                                     continue;
                                                   }
                                              for (transferidor = 0;transferidor <= ncontas;)
                                                  {
                                                       if (numeroconta1 == (dados[transferidor].numeroconta)) //Percorre o banco de dados de contas até achar qual a conta digitada
                                                            {
                                                            printf("%d\n",transferidor);
                                                            break;
                                                            }
                                                       else 
                                                            {
                                                                  if(transferidor > ncontas)  //Verifica se ja esta na ultima conta, caso sim, a conta digitada não existe
                                                                     printf("6000\n"); //Conta nao existe
                                                                  else
                                                                  transferidor++;                          
                                                                  
                                                            } 
                                                                  
                                                   }  
                                               
                                              
                                              
                                              
                                              if((dados[transferidor].numerodetransferencias) > (dados[transferidor].nummaxdetransferencias))// Verifica se ja atingiu o limite de transferencias do dia
                                                  {
                                                          printf("4000\n");   //Exedeu o limite de transferencias diario                              
                                                          continue;                                  
                                                  }
                                              
                                               scanf("%d",&numeroconta2); // Pega o numero da segunda conta   
                                               
                                               verif1=numeroconta2/10000;
                                               verif2=(numeroconta2-verif1*10000)/1000;
                                               verif3=(numeroconta2-verif1*10000-verif2*1000)/100;
                                               verif4=(numeroconta2-verif1*10000-verif2*1000-verif3*100)/10;
                                               verificador=(verif1*9+verif2*8+verif3*7+verif4*6)%11;
                                               if (verificador==10) 
                                                  verificador=0;
                                               else if(verificador!=10) 
                                                    verificador = verificador;
                                              
                                               // Chega o numero verificador da conta
                                             
                                              if (verificador != (numeroconta2  -verif1*10000 - verif2*1000 - verif3*100 - verif4*10)) 
                                                   {
                                                     printf("6100\n"); //Codigo verificador errado
                                                     continue;
                                                   }
                                                
                                                //Acha a conta correspondente ao numero da segunda conta   
                                               for (transferida=0;transferida<=ncontas;)
                                                  {
                                                       if (numeroconta2 == (dados[transferida].numeroconta))
                                                            {
                                                            //printf("%d\n",transferida);
                                                            break;
                                                            }
                                                       else 
                                                            {
                                                                  if(transferida > ncontas) //Verifica se ja checou todas as contas, como anteriormente.
                                                                  {
                                                                     printf("6200\n"); //Conta nao existe
                                                                     break;
                                                                  }

                                                                  else
                                                                  transferida++;                          
                                                                  
                                                            }   
                                                            printf("%d",transferida);   
                                                   }
                                              //printf("Transferidor numero: %d\nTransferida numero: %d\n",transferidor,transferida);       
                                              //printf("Transferidor: %.2f\nTransferida: %.2f\n",dados[transferidor].dinconta,dados[transferida].dinconta);                       
                                              scanf("%f",&valortransferido); // Pega o valor q ser transferido
                                              
                                              if(valortransferido > (dados[transferidor].dinconta))  
                                                {
                                                          printf("5100\n");
                                                          continue;
                                                }
                                              scanf("%d",&senha1); //Pega a senha da conta 1
                                              
                                              
                                              if(valortransferido > (dados[transferidor].limitedetransferencia))//Verifica se o valor exede o limite a ser transferido
                                                 {
                                                        printf("2000\n");          
                                                        continue;          
                                                 }
                                                 
                                              if((valortransferido + (dados[transferidor].valorjatransferido)) > dados[transferidor].limitedetransferencia)//Verifica se o limite a ser transferido em um dia sera exedido
                                                 {
                                                        printf("2000\n");          
                                                        continue;          
                                                 }
                                                 
                                             if (senha1 == dados[transferidor].senha) //Verifica se a senha bate com a da conta transferidora
                                              {
                                                  (dados[transferidor].dinconta) = (dados[transferidor].dinconta) - valortransferido;  //Faz a transferencia
                                                  (dados[transferida].dinconta) = (dados[transferida].dinconta) + valortransferido;
                                                  (dados[transferidor].numerodetransferencias)++;  //Incrementa o contador do numero de transferencias do dia
                                                  (dados[transferidor].valorjatransferido) =  (dados[transferidor].valorjatransferido) + valortransferido;  //Incrementa o contador do valor transferido no dia                                               
                                                  printf("OK\n"); 
                                              }
                                             else if (senha1 != dados[transferidor].senha)                 
                                                  { 
                                                   printf ("7000\n");//Senha incorreta
                                                   continue;
                                                  }
                                             
                                              printf("%.2f\n",dados[transferidor].dinconta);                        
                                      
                                    } 

                                  }
                             
                               
                        
                   system("pause");
                   
                   }

                                 
          
    
                                                                                        
       




