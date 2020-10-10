Algoritmo Agenda
	
	Definir volverAEmpezar, userInput, contacto1 Como Caracter;
	Definir inputMenu, principio, final, i, j Como Entero;
	Definir error Como Logico;
	
	// AGENDA
	contacto1="";
	contacto1="";
	
	Repetir
		volverAEmpezar="";
		
		inputMenu=0;
		principio=0;
		final=0;
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
		Segun inputMenu hacer
			1:
				// Leer contacto1
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
					Si Subcadena(userInput,0,Longitud(userInput)) == Subcadena(contacto1,i,i+Longitud(userInput)-1) Entonces
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
				Escribir "¿Qué ID de contacto desea eliminar?";
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
