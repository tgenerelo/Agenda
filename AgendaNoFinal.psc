// FUNCIONES
SubProceso escribirContacto (mContactos,i)
	Escribir "CONTACTO ", i+1;
	Escribir mContactos[0,i], ": ", mContactos[1,i],".";
	Escribir "";
FinSubProceso

SubProceso verContactos(ultimoContacto,vContactos,mContactos)
	Definir i Como Entero;
//	Para i=0 Hasta ultimoContacto Hacer
//		Si vContactos[i]<>"" Entonces
//			Escribir "CONTACTO ", i+1;
//			Escribir "Nombre: ", Sin Saltar;
//			Para j=0 hasta longitud(vContactos[i]) hacer
//				si Subcadena(vContactos[i],j,j)<>"*" entonces
//					Escribir subcadena(vContactos[i],j,j) Sin Saltar;
//					si Subcadena(vContactos[i],j+1,j+1)=="*" Entonces
//						Escribir "";
//						Escribir "Teléfono: " Sin Saltar;
//						j=j+1;
//					FinSi
//				FinSi
//			FinPara
//			Escribir "";
//			Escribir "";
//		FinSi
//	FinPara
	
	Para i=0 hasta ultimoContacto Hacer
		Si mContactos[0,i]<>"" o mContactos[1,i]<>"" Entonces
			escribirContacto(mContactos,i);
		FinSi
	FinPara
FinSubProceso

SubProceso buscarContactos(userInput,contador,i,j,m,ultimoContacto,vContactos,mContactos,campos)
	Escribir "Escribe parte del nombre o teléfono para buscar:";
	Leer userInput;
	Escribir "";
	contador=0;
	
	Para i=0 hasta ultimoContacto Hacer
		Para j=0 hasta campos-1 Hacer
			Para m=0 hasta Longitud(mContactos[i,j])-1 Hacer // REVISAR FUERA DE RANGO (???????)
				si Minusculas(Subcadena(userInput,0,Longitud(userInput)-1)) == Minusculas(Subcadena(mContactos[i,j],m,m+Longitud(userInput)-1)) Entonces
					contador=contador+1;
					escribirContacto(mContactos,i);
					m=Longitud(mContactos[i,j])-1;
				FinSi
			FinPara
		FinPara
	FinPara
//		Si (Minusculas(Subcadena(userInput,0,Longitud(userInput)-1))==Minusculas(Subcadena(mContactos[0,i],m,m+Longitud(userInput)-1))) o (Minusculas(Subcadena(userInput,1,Longitud(userInput)))==Minusculas(Subcadena(mContactos[1,i],m,m+Longitud(userInput)-1))) Entonces
//			Escribir "CONTACTO ", i+1;
//			contador=contador+1;
//			Escribir mContactos[0,i], ": ", mContactos[1,i],".";
//		FinSi
//
//	FinPara
	
//	Para m=0 Hasta ultimoContacto Hacer // HACERLO UNA VEZ POR CONTACTO 
//		Para i=0 hasta Longitud(vContactos[m]) Hacer
//			Si Minusculas(Subcadena(userInput,0,Longitud(userInput))) == Minusculas(Subcadena(vContactos[m],i,i+Longitud(userInput)-1)) Entonces
//				Escribir "CONTACTO ", m+1;
//				contador=contador+1;
//				Escribir "Nombre: ", Sin Saltar;
//				Para j=0 hasta longitud(vContactos[m]) hacer
//					si Subcadena(vContactos[m],j,j)<>"*" entonces
//						Escribir subcadena(vContactos[m],j,j) Sin Saltar;
//						si Subcadena(vContactos[m],j+1,j+1)=="*" Entonces
//							Escribir "";
//							Escribir "Teléfono: " Sin Saltar;
//							j=j+1;
//						FinSi
//					FinSi
//				FinPara
//				Escribir "";
//				Escribir "";
//				i=Longitud(vContactos[m]);
//			FinSi
//		FinPara
//	FinPara
	
	si contador==0 Entonces
		Escribir "No se ha encontrado ninguna coincidencia.";
		Escribir "";
	FinSi
FinSubProceso

SubProceso  agregarContacto(ultimoContacto,vContactos,mContactos,campos)
	Definir i, j Como Entero;
	Definir userInput Como Caracter;
	
	Para i=0 Hasta ultimoContacto Hacer
		Si i=ultimoContacto y mContactos[campos-1,ultimoContacto]<>"" Entonces
			Escribir "ERROR: Agenda llena. No se pueden añadir más contactos.";
		FinSi
		
		Si mContactos[0,i] == "" y mContactos[1,i] == "" Entonces
			Escribir "Introduce el nombre del contacto:";
			Leer mContactos[0,i];
			Escribir "Introduce el teléfono del contacto:";
			Leer mContactos[1,i];
			Escribir "";
			Escribir "El contacto se ha guardado correctamente como CONTACTO ", i+1;
			i=ultimoContacto;
		FinSi
	FinPara
	
//		Si vContactos[i] == "" Entonces
//			Repetir
//				Si error==Verdadero Entonces
//					Escribir "ERROR: carácter no permitido. Vuelve a intentarlo.";
//					Escribir "";
//				FinSi
//				Escribir "Introduce el nombre del contacto:";
//				Leer userInput;
//				error=Falso;
//				Para j=0 Hasta Longitud(userInput) Hacer
//					Si Subcadena(userInput,j,j)=="*" Entonces
//						error=Verdadero;
//					FinSi
//				FinPara
//			Hasta Que error==Falso
//			
//			vContactos[i]=userInput;
//			
//			Escribir "Introduce el teléfono del contacto:";
//			Leer userInput;
//			vContactos[i]=vContactos[i] + "*" + userInput;
//			
//			Escribir "";
//			Escribir "El contacto se ha guardado correctamente como CONTACTO ", i+1;
//			i=ultimoContacto;
//		FinSi
FinSubProceso

SubProceso  modificarContacto(ultimoContacto,vContactos,mContactos)
	Definir inputSub Como Entero;
	inputSub=0;
	
	Escribir "¿Qué número de contacto quieres modificar?";
	Leer inputSub;
	
	Si inputSub>0 y inputSub<=ultimoContacto y (mContactos[0,inputSub-1]<>"" o mContactos[1,inputSub-1]<>"") Entonces
		escribirContacto(mContactos,inputSub-1);
		Escribir "Introduce el nuevo nombre del contacto:";
		Leer mContactos[0,inputSub-1];
		Escribir "Introduce el nuevo teléfono del contacto:";
		Leer mContactos[1,inputSub-1];
	SiNo
		Escribir "ERROR: El ID de contacto no existe.";
	FinSi
	
//	Si inputSub<ultimoContacto Entonces
//		Repetir
//			Si error==Verdadero Entonces
//				Escribir "ERROR: carácter no permitido. Vuelve a intentarlo.";
//				Escribir "";
//			FinSi
//			Escribir "Introduce el nombre del contacto:";
//			Leer userInput;
//			error=Falso;
//			Para i=0 Hasta Longitud(userInput) Hacer
//				Si Subcadena(userInput,i,i)=="*" Entonces
//					error=Verdadero;
//				FinSi
//			FinPara
//		Hasta Que error==Falso
//		
//		vContactos[inputSub-1]=userInput;
//		
//		Escribir "Introduce el teléfono del contacto:";
//		Leer userInput;
//		vContactos[inputSub-1]=vContactos[inputSub-1] + "*" + userInput;
//		
//		Escribir "";
//		Escribir "El contacto se ha modificado correctamente";
//	SiNo
//		Escribir "ERROR: El ID de contacto no existe.";
//	FinSi
FinSubProceso


Funcion eliminarContacto()
	
FinFuncion

Funcion renumerarContactos(vContactos, ultimoContacto, mContactos)
	Definir i, j Como Entero;
//	Para i=0 Hasta ultimoContacto-1 Hacer
//		j=i+1;
//		Si vContactos[i]=="" Entonces
//			Mientras vContactos[j]=="" y j<=ultimoContacto-1 Hacer
//				j=j+1;
//			FinMientras
//			vContactos[i]=vContactos[j];
//			vContactos[j]="";
//		FinSi
//	FinPara
	
	Para i=0 hasta ultimoContacto-1 Hacer
		j=i+1;
		Si mContactos[0,i]=="" y mContactos[1,i]=="" Entonces
			Mientras (mContactos[0,j]=="" y mContactos[1,j]=="") y j<=ultimoContacto-1 Hacer
				j=j+1;
			FinMientras
			mContactos[0,i]=mContactos[0,j];
			mContactos[1,i]=mContactos[1,j];
			mContactos[0,j]="";
			mContactos[1,j]="";
		FinSi
	FinPara
FinFuncion

// PROGRAMA PRINCIPAL
Algoritmo AgendaArray
	
	Definir volverAEmpezar, vContactos, mContactos, userInput Como Caracter;
	Definir inputMenu, inputSub, contador, ultimoContacto, campos, cuantosContactos, i, j, m Como Entero;
	Definir error Como Logico;
	
	// NÚMERO DE CONTACTOS EN LA AGENDA
	cuantosContactos=10;
	campos=2;
	ultimoContacto=cuantosContactos-1;
	
	// AGENDA	
	Dimension vContactos[cuantosContactos];
	Dimension mContactos[campos,cuantosContactos];
	
	// RELLENAR VECTOR
	Para i=0 hasta ultimoContacto Hacer
		vContactos[i]="";
	FinPara
	
	// RELLENAR MATRIZ
	Para i=0 hasta campos-1 Hacer
		Para j=0 hasta cuantosContactos-1 Hacer
			mContactos[i,j]="";
		FinPara
	FinPara
	
	vContactos[1]="Paula*8538945";
	vContactos[5]="José María*7956423";
	
	mContactos[0,1]="Juan";
	mContactos[1,1]="1111111";
	mContactos[0,4]="Betty";
	mContactos[1,4]="2222222";
	mContactos[0,6]="Pat";
	mContactos[1,6]="3333333";
	
	// RENUMERAR CONTACTOS 
	renumerarContactos(vContactos, ultimoContacto, mContactos);
	
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
				// VER CONTACTOS 
				verContactos(ultimoContacto,vContactos,mContactos);
			2:
				// BUSCAR CONTACTO 
				buscarContactos(userInput,contador,i,j,m,ultimoContacto,vContactos,mContactos,campos);
			3:
				// AÑADIR CONTACTO
				agregarContacto(ultimoContacto,vContactos,mContactos,campos);
				
			4:
				// MODIFICAR CONTACTO
				modificarContacto(ultimoContacto,vContactos,mContactos);
			5:
				// ELIMINAR UN CONTACTO 
				Escribir "¿Qué ID de contacto deseas eliminar?";
				Leer inputSub;
				vContactos[inputSub-1] = "";
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
