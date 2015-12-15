function r = metodonos(Y,I,NY,NI)
  for i=1:size(NY)(1);
	for j=1:size(NY)(1);
		a=intersect(NY(i,:),NY(j,:))

		Matriz(i,j)=0;
		for k=1:size(a)(2);
			if(a(k)!=0);
				Matriz(i,j)+=Y(a(k));	
			endif
		endfor 
		if(i!=j);
			Matriz(i,j)=-Matriz(i,j);
		endif
	endfor
	MatrizR(i,1)=0;
	for j=1:size(NI)(2);
	
		MatrizR(i,1)+=-I(NI(i,j));
	endfor
	
  endfor
  Matriz
  MatrizR
  Matriz\MatrizR
end
