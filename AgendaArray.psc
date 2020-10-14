Algoritmo Agenda2
	
	Definir volverAEmpezar, userInput Como Caracter;
	Definir inputMenu, inputSub, contador, finalContactos, cuantosContactos, i, j, m Como Entero;
	Definir error Como Logico;
	Definir contactos Como Caracter;
	
	// NÚMERO DE CONTACTOS EN LA AGENDA
	cuantosContactos=2;
	finalContactos=cuantosContactos-1;
	
	// AGENDA	
	Dimension contactos[cuantosContactos];
	contactos[0]="";
	contactos[1]="Paula*8538945";
	
	// RENUMERAR CONTACTOS 
	Para i=0 Hasta finalContactos-1 Hacer
		j=i+1;
		Si contactos[i]=="" Entonces
			Mientras contactos[j]=="" y j<=finalContactos-1 Hacer
				j=j+1;
			FinMientras
			contactos[i]=contactos[j];
			contactos[j]="";
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
					Si contactos[i]<>"" Entonces
						Escribir "CONTACTO ", i+1;
						Escribir "Nombre: ", Sin Saltar;
						Para j=0 hasta longitud(contactos[i]) hacer
							si Subcadena(contactos[i],j,j)<>"*" entonces
								Escribir subcadena(contactos[i],j,j) Sin Saltar;
								si Subcadena(contactos[i],j+1,j+1)=="*" Entonces
									Escribir "";
									Escribir "Teléfono: " Sin Saltar;
									j=j+1;
								FinSi
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
					Para i=0 hasta Longitud(contactos[m]) Hacer
						Si Minusculas(Subcadena(userInput,0,Longitud(userInput))) == Minusculas(Subcadena(contactos[m],i,i+Longitud(userInput)-1)) Entonces
							Escribir "CONTACTO ", m+1;
							contador=contador+1;
							Escribir "Nombre: ", Sin Saltar;
							Para j=0 hasta longitud(contactos[m]) hacer
								si Subcadena(contactos[m],j,j)<>"*" entonces
									Escribir subcadena(contactos[m],j,j) Sin Saltar;
									si Subcadena(contactos[m],j+1,j+1)=="*" Entonces
										Escribir "";
										Escribir "Teléfono: " Sin Saltar;
										j=j+1;
									FinSi
								FinSi
							FinPara
							Escribir "";
							Escribir "";
							i=Longitud(contactos[m]);
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
					Si i=finalContactos y contactos[finalContactos]<>"" Entonces
						Escribir "ERROR: Agenda llena. No se pueden añadir más contactos.";
					FinSi
					Si contactos[i] = "" Entonces
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
						
						contactos[i]=userInput;
						
						Escribir "Introduce el teléfono del contacto:";
						Leer userInput;
						contactos[i]=contactos[i] + "*" + userInput;
						
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
						Escribir "Introduce el nombre del contacto:";
						Leer userInput;
						error=Falso;
						Para i=0 Hasta Longitud(userInput) Hacer
							Si Subcadena(userInput,i,i)=="*" Entonces
								error=Verdadero;
							FinSi
						FinPara
					Hasta Que error==Falso
					
					contactos[inputSub-1]=userInput;
					
					Escribir "Introduce el teléfono del contacto:";
					Leer userInput;
					contactos[inputSub-1]=contactos[inputSub-1] + "*" + userInput;
					
					Escribir "";
					Escribir "El contacto se ha modificado correctamente";
				SiNo
					Escribir "ERROR: El ID de contacto no existe.";
				FinSi
			5:
				// ELIMINAR UN CONTACTO 
				Escribir "¿Qué ID de contacto deseas eliminar?";
				Leer inputSub;
				contactos[inputSub-1] = "";
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
