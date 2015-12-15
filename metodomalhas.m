function r = metodomalhas(Z,E,MZ,ME)
  for i=1:size(MZ)(1);
	for j=1:size(MZ)(1);
		a=intersect(MZ(i,:),MZ(j,:))

		Matriz(i,j)=0;
		for k=1:size(a)(2);
			if(a(k)!=0);
				Matriz(i,j)+=Z(a(k));	
			endif
		endfor 
		if(i!=j);
			Matriz(i,j)=-Matriz(i,j);
		endif
	endfor
	MatrizR(i,1)=0;
	for j=1:size(ME)(2);
	
		MatrizR(i,1)+=-E(ME(i,j));
	endfor
	
  endfor
  Matriz
  MatrizR
  Matriz\MatrizR
end
