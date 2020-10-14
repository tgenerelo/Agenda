Algoritmo Agenda
	
	Definir volverAEmpezar, userInput, contacto1, contacto2 Como Caracter;
	Definir inputMenu, i, j Como Entero;
	Definir error Como Logico;
	Definir contactos Como Caracter;
	
	// AGENDA
	contacto1="";
	contacto2="";
	
	Dimension contactos[5];
	contactos[0]="Nombre1 Apellido1*12345";
	contactos[1]="Nombre2 Apellido2*23456";
	contactos[2]="Nombre3 Apellido3*34567";
	contactos[3]="Nombre4 Apellido4*45678";
	contactos[4]="Nombre5 Apellido5*56789";
	
	Repetir
		volverAEmpezar="";
		
		inputMenu=0;
		userInput="";
		
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
			Escribir "ERROR: Opción inválida. Vuelve a intentarlo";
			Leer inputMenu;
			Escribir "";
		FinMientras
		
		Segun inputMenu hacer
			1:
				// LEER CONTACTOS 
				Si contacto1<>"" Entonces
					Escribir "Nombre: ", Sin Saltar;
					Para i=0 hasta longitud(contacto1) hacer
						si Subcadena(contacto1,i,i)<>"*" entonces
							Escribir subcadena(contacto1,i,i) Sin Saltar;
							si Subcadena(contacto1,i+1,i+1)=="*" Entonces
								Escribir "";
								Escribir "Teléfono: " Sin Saltar;
								i=i+1;
							FinSi
						FinSi
					FinPara
					Escribir "";
				SiNo
					Escribir "No hay ningún contacto.";
				FinSi
			2:
				// BUSCAR CONTACTO 
				Escribir "Escribe parte del nombre o teléfono para buscar:";
				Leer userInput;
				Escribir "";
				Para i=0 hasta Longitud(contacto1) Hacer
					Si Minusculas(Subcadena(userInput,0,Longitud(userInput))) == Minusculas(Subcadena(contacto1,i,i+Longitud(userInput)-1)) Entonces
						Escribir "Se ha encontrado la siguiente coincidencia:";
						Escribir "";
						Escribir "Nombre: ", Sin Saltar;
						Para i=0 hasta longitud(contacto1) hacer
							si Subcadena(contacto1,i,i)<>"*" entonces
								Escribir subcadena(contacto1,i,i) Sin Saltar;
								si Subcadena(contacto1,i+1,i+1)=="*" Entonces
									Escribir "";
									Escribir "Teléfono: " Sin Saltar;
									i=i+1;
								FinSi
							FinSi
						FinPara
						Escribir "";
						error=Falso;
						i=Longitud(contacto1);
					SiNo
						error=Verdadero;
					FinSi
				FinPara
				Si error==Verdadero Entonces
					Escribir "No se ha encontrado ninguna coincidencia.";
					Escribir "";
				FinSi
			3:
				// AÑADIR CONTACTO
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
				
				contacto1=userInput;
				
				Escribir "Introduce el teléfono del contacto:";
				Leer userInput;
				contacto1=contacto1 + "*" + userInput;
				
				Escribir "";
				Escribir "El contacto se ha guardado correctamente";
			4:
				// MODIFICAR CONTACTO
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
				
				contacto1=userInput;
				
				Escribir "Introduce el teléfono del contacto:";
				Leer userInput;
				contacto1=contacto1 + "*" + userInput;
				
				Escribir "";
				Escribir "El contacto se ha modificado correctamente";
			5:
				// ELIMINAR UN CONTACTO 
				Escribir "¿Qué ID de contacto deseas eliminar?";
				Leer userInput;
				Si userInput=="1" Entonces
					contacto1="";
				FinSi
		FinSegun
		
		Si inputMenu<>6 Entonces
			Escribir "";
			Escribir "¿Quieres realizar otra consulta (S/N)";
			Leer volverAEmpezar;
			volverAEmpezar=Minusculas(volverAEmpezar);
			Escribir "";
		SiNo
			volverAEmpezar="n";
		FinSi
		
	Hasta Que !(volverAEmpezar=="s" o volverAEmpezar=="si" o volverAEmpezar=="sí");
	
	
	
FinAlgoritmo
