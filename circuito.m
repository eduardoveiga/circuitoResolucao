clear all;
clc

nZ = input("qual o número de impedâncias do circuito? ");
nE = input("qual o número de fontes de tensão do circuito? ");
nI = input("qual o número de fontes de corrente do circuito? ");

#for i = 1:nZ;
#	disp("index");
#	disp (i);
#endfor
for i = 1:nZ;
	printf("Digite o valor da imperância Z%d ",i)
	Z(i) = input('')
endfor

for i = 1:nE;
	j=input("Digite o número da fonte de tensão  (E1,E2,E3...) ")
	printf("Digite o valor da fonte de tensão  E%d ",j)
	E(j) = input('')
endfor

for i = 1:nI;
	j=input("Digite o número da fonte de corrente  (I1,I2,I3...) ")
	printf("Digite o valor da fonte de corrente  I%d ",j)
	I(j) = input('')
endfor

opt = input("Deseja resolver este circuito pelo método das malhas ou dos nós?\n 1 - malhas \n 2 - nós\n");

while(1)
	if (opt==1)
		nM= input("Qual a quantidade de malhas? ");
		for i = 1:nM;
			printf("Qual a quantidade de impedâncias na malha %d ",i)
			nMZ = input("")
			for j = 1:nMZ
				printf("digite o número (Z1,Z2,Z3...) da impedância pertencente a malha M%d ", i)
				MZ(i,j)= input("");
			endfor
			
			printf("Qual a quantidade de fontes de tensão na malha %d ",i)
			nME = input("")
			for j = 1:nME
				printf("digite o número (E1,E2,E3...) da fonte de tensão pertencente a malha M%d ", i)
				ME(i,j)= input("");
			endfor
			printf("Qual a quantidade de fontes de corrente na malha %d ",i)
			nMI = input("")
			for j = 1:nMI
				printf("digite o número (I1,I2,I3...) da fonte de corrente pertencente a malha M%d ", i)
				ME(i,j)= input("");
			endfor
		endfor
		for i=1:length(I);
			if(I(i)!=0)
				disp("convertendo fontes de corrente em fontes de tensão")
				E(i) = Z(i)*I(i)
			endif
			metodomalhas(Z,E,MZ,ME)
		endfor
	elseif (opt==2)
		nN= input("Qual a quantidade de nós? ");
		for i = 1:nN;
			printf("Qual a quantidade de impedâncias do nó %d ",i)
			nNZ = input("")
			for j = 1:nNZ
				printf("digite o número (Z1,Z2,Z3...) da impedância pertencente ao nó N%d ", i)
				NZ(i,j)= input("");
			endfor
			
			printf("Qual a quantidade de fontes de tensão nao nó %d ",i)
			nNI = input("")
			for j = 1:nNI
				printf("digite o número (E1,E2,E3...) da fonte de tensão pertencente ao nó N%d ", i)
				NI(i,j)= input("");
			endfor
			printf("Qual a quantidade de fontes de corrente nao nó %d ",i)
			nNI = input("")
			for j = 1:nNI
				printf("digite o número (I1,I2,I3...) da fonte de corrente pertencente ao nó N%d ", i)
				NI(i,j)= input("");
			endfor
		endfor
		for i=1:length(I);
			if(I(i)!=0)
				disp("convertendo fontes de tensão em fontes de corrente")
				#E(i) = Z(i)*I(i)
				I(i) = E(i)/Z(i)
			endif
			
			metodonos(Z.^-1,I,NZ,NI)
		endfor
	else
		disp("opção inválida")
	endif
endwhile
