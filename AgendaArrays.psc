Algoritmo AgendaArrays
	
	Definir volverAEmpezar, vNombr, vTelf, userInput Como Caracter;
	Definir inputMenu, inputSub, contador, finalContactos, cuantosContactos, i, j, m Como Entero;
	Definir error Como Logico;
	
	// NÚMERO DE CONTACTOS EN LA AGENDA
	cuantosContactos=5;
	finalContactos=cuantosContactos-1;
	
	// AGENDA	
	Dimension vNombr[cuantosContactos];
	Dimension vTelf[cuantosContactos];
	
	Para i=0 hasta finalContactos Hacer
		vNombr[i]="";
	FinPara
	
	Para i=0 hasta finalContactos Hacer
		vTelf[i]="";
	FinPara
	
	vNombr[1]="María*8538945";
	vNombr[4]="Juan*7956423";
	
	// RENUMERAR CONTACTOS 
	Para i=0 Hasta finalContactos-1 Hacer
		j=i+1;
		Si vNombr[i]=="" Entonces
			Mientras vNombr[j]=="" y j<=finalContactos-1 Hacer
				j=j+1;
			FinMientras
			vNombr[i]=vNombr[j];
			vNombr[j]="";
		FinSi
	FinPara
	
	Para i=0 Hasta finalContactos-1 Hacer
		j=i+1;
		Si vTelf[i]=="" Entonces
			Mientras vTelf[j]=="" y j<=finalContactos-1 Hacer
				j=j+1;
			FinMientras
			vTelf[i]=vTelf[j];
			vTelf[j]="";
		FinSi
	FinPara
	
	Repetir
		volverAEmpezar="";
		contador=0;
		inputMenu=0;
		userInput="";
		
		// MENÚ PRINCIPAL
		Escribir "-------------------------";
		Escribir " AGENDA - MENÚ PRINCIPAL";
		Escribir "-------------------------";
		Escribir "1 - Ver contactos";
		Escribir "2 - Buscar un contacto";
		Escribir "3 - Añadir un contacto";
		Escribir "4 - Modificar un contacto";
		Escribir "5 - Eliminar un contacto";
		Escribir "6 - Salir";
		Escribir "";
		Escribir "Introduce el número de la opción deseada:";
		
		Leer inputMenu;
		Escribir "";
		
		Mientras inputMenu>6 Hacer
			Escribir "ERROR: Opción inválida. Vuelve a intentarlo:";
			Leer inputMenu;
			Escribir "";
		FinMientras
		
		Segun inputMenu hacer
			1:
				// LEER CONTACTOS 
				Para i=0 Hasta finalContactos Hacer
					Si vNombr[i]<>"" Entonces
						Escribir "CONTACTO ", i+1;
						Escribir "Nombre: ", Sin Saltar;
						Para j=0 hasta longitud(vNombr[i]) hacer
							si Subcadena(vNombr[i],j,j)<>"*" entonces
								Escribir subcadena(vNombr[i],j,j) Sin Saltar;
							FinSi
							si Subcadena(vNombr[i],j+1,j+1)=="*" Entonces
								Escribir "";
								Escribir "Teléfono: " Sin Saltar;
								j=j+1;
							FinSi
						FinPara
						Escribir "";
						Escribir "";
					FinSi
				FinPara
			2:
				// BUSCAR CONTACTO 
				Escribir "Escribe parte del nombre o teléfono para buscar:";
				Leer userInput;
				Escribir "";
				contador=0;
				Para m=0 Hasta finalContactos Hacer // HACERLO UNA VEZ POR CONTACTO 
					Para i=0 hasta Longitud(vNombr[m]) Hacer
						Si Minusculas(Subcadena(userInput,0,Longitud(userInput))) == Minusculas(Subcadena(vNombr[m],i,i+Longitud(userInput)-1)) Entonces
							Escribir "CONTACTO ", m+1;
							contador=contador+1;
							Escribir "Nombre: ", Sin Saltar;
							Para j=0 hasta longitud(vNombr[m]) hacer
								si Subcadena(vNombr[m],j,j)<>"*" entonces
									Escribir subcadena(vNombr[m],j,j) Sin Saltar;
									si Subcadena(vNombr[m],j+1,j+1)=="*" Entonces
										Escribir "";
										Escribir "Teléfono: " Sin Saltar;
										j=j+1;
									FinSi
								FinSi
							FinPara
							Escribir "";
							Escribir "";
							i=Longitud(vNombr[m]);
						FinSi
					FinPara
				FinPara
				
				si contador==0 Entonces
					Escribir "No se ha encontrado ninguna coincidencia.";
					Escribir "";
				FinSi
			3:
				// AÑADIR CONTACTO
				Para i=0 Hasta finalContactos Hacer
					Si i=finalContactos y vNombr[finalContactos]<>"" Entonces
						Escribir "ERROR: Agenda llena. No se pueden añadir más contactos.";
					FinSi
					Si vNombr[i] = "" Entonces
						Repetir
							Si error==Verdadero Entonces
								Escribir "ERROR: carácter no permitido. Vuelve a intentarlo.";
								Escribir "";
							FinSi
							Escribir "Introduce el nombre del contacto:";
							Leer userInput;
							error=Falso;
							Para j=0 Hasta Longitud(userInput) Hacer
								Si Subcadena(userInput,j,j)=="*" Entonces
									error=Verdadero;
								FinSi
							FinPara
						Hasta Que error==Falso
						
						vNombr[i]=userInput;
						
						Escribir "Introduce el teléfono del contacto:";
						Leer userInput;
						vNombr[i]=vNombr[i] + "*" + userInput;
						
						Escribir "";
						Escribir "El contacto se ha guardado correctamente como CONTACTO ", i+1;
						i=finalContactos;
					FinSi
				FinPara
				
			4:
				// MODIFICAR CONTACTO
				inputSub=0;
				Escribir "¿Qué número de contacto quieres modificar?";
				Leer inputSub;
				
				Si inputSub<finalContactos Entonces
					Repetir
						Si error==Verdadero Entonces
							Escribir "ERROR: carácter no permitido. Vuelve a intentarlo.";
							Escribir "";
						FinSi
						Escribir "CONTACTO ", inputSub;
						Escribir "Nombre: ", Sin Saltar;
						Para i=0 hasta longitud(vNombr[inputSub-1]) hacer
							si Subcadena(vNombr[inputSub-1],i,i)<>"*" entonces
								Escribir subcadena(vNombr[inputSub-1],i,i) Sin Saltar;
								si Subcadena(vNombr[inputSub-1],i+1,i+1)=="*" Entonces
									Escribir "";
									Escribir "Teléfono: " Sin Saltar;
									j=j+1;
								FinSi
							FinSi
						FinPara
						Escribir "";
						Escribir "";
						Escribir "Introduce el nuevo nombre del contacto:";
						Leer userInput;
						error=Falso;
						Para i=0 Hasta Longitud(userInput) Hacer
							Si Subcadena(userInput,i,i)=="*" Entonces
								error=Verdadero;
							FinSi
						FinPara
					Hasta Que error==Falso
					
					vNombr[inputSub-1]=userInput;
					
					Escribir "Introduce el nuevo teléfono del contacto:";
					Leer userInput;
					vNombr[inputSub-1]=vNombr[inputSub-1] + "*" + userInput;
					
					Escribir "";
					Escribir "El contacto se ha modificado correctamente";
				SiNo
					Escribir "ERROR: El ID de contacto no existe.";
				FinSi
			5:
				// ELIMINAR UN CONTACTO 
				Escribir "¿Qué ID de contacto deseas eliminar?";
				Leer inputSub;
				vNombr[inputSub-1] = "";
				Escribir "";
				Escribir "El contacto se ha eliminado correctamente.";
			6:
				volverAEmpezar=s;
		FinSegun
		
		Si inputMenu<6 Entonces
			Escribir "";
			Escribir "¿Quieres realizar otra consulta (S/N)";
			Leer volverAEmpezar;
			volverAEmpezar=Minusculas(volverAEmpezar);
			Escribir "";
		FinSi
		
	Hasta Que !(volverAEmpezar=="s" o volverAEmpezar=="si" o volverAEmpezar=="sí");
	
FinAlgoritmo
