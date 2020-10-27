// FUNCIONALIDADES MENÚ
// Menú principal
Funcion inputMenu<-menuPrincipal()
	Definir inputMenu, i, j Como Entero;
	Definir menu Como Caracter;
	
	Dimension menu[3,2];
	menu[0,0]="1 - Ver contactos         ";
	menu[0,1]="4 - Modificar un contacto ";
	menu[1,0]="2 - Buscar un contacto    ";
	menu[1,1]="5 - Eliminar un contacto  ";
	menu[2,0]="3 - Añadir un contacto    ";
	menu[2,1]="6 - Salir                 ";
	
	Escribir "------------------------------------------------------";
	Escribir "               AGENDA -- MENÚ PRINCIPAL               ";                 
	Escribir "------------------------------------------------------";
	Para i=0 hasta 2 Hacer
		Para j=0 hasta 1 Hacer
			Escribir menu[i,j] Sin Saltar;
		FinPara
		Escribir "";
	FinPara
	Escribir "";
	Escribir "Introduce el número de la opción deseada: " Sin Saltar;
	
	Leer inputMenu;
FinFuncion

// 1 - Ver contactos
SubProceso verContactos(ultimoContacto,mContactos,numeroContactos)
	Definir i, contador Como Entero;
	contador=0;
	
	Para i=0 hasta ultimoContacto Hacer
		Si mContactos[0,i]<>"" o mContactos[1,i]<>"" Entonces
			escribirContacto(mContactos,i);
			contador=contador+1;
		FinSi
	FinPara
	
	Escribir "";
	
	Si contador==0 Entonces
		Escribir "No se ha añadido ningún contacto.";
	FinSi
	
FinSubProceso

// 2 - Buscar un contacto
SubProceso buscarContactos(userInput,contador,i,j,m,ultimoContacto,mContactos,campos)
	Definir contactoEncontrado Como Logico;
	contactoEncontrado=falso;
	
	Escribir "Escribe parte del nombre o teléfono para buscar:";
	Leer userInput;
	Escribir "";
	
	Para i=0 hasta campos-1 Hacer
		Para j=0 hasta ultimoContacto Hacer
			Para m=0 hasta Longitud(mContactos[i,j])-1 Hacer
				si Minusculas(Subcadena(userInput,0,Longitud(userInput)-1)) == Minusculas(Subcadena(mContactos[i,j],m,m+Longitud(userInput)-1)) Entonces
					si contactoEncontrado=Falso Entonces
						Escribir "Se han encontrado las siguientes coincidencias:";
						Escribir "";
						contactoEncontrado=Verdadero;
					FinSi
					escribirContacto(mContactos,j);
					Escribir "";
					m=Longitud(mContactos[i,j])-1;
				FinSi
			FinPara
		FinPara
	FinPara
	
	si contactoEncontrado==Falso Entonces
		Escribir "No se ha encontrado ninguna coincidencia.";
	FinSi
FinSubProceso

// 3 - Añadir un contacto
SubProceso  agregarContacto(ultimoContacto,mContactos,campos)
	Definir i, j Como Entero;
	Definir userInput Como Caracter;
	
	Para i=0 Hasta ultimoContacto Hacer
		Si i=ultimoContacto y mContactos[campos-1,ultimoContacto]<>"" Entonces
			Escribir "ERROR: Agenda llena. No se pueden añadir más contactos.";
		FinSi
		
		Si mContactos[0,i]=="" y mContactos[1,i]=="" Entonces
			Escribir "Introduce el nombre del contacto:";
			Leer mContactos[0,i];
			Escribir "Introduce el teléfono del contacto:";
			Leer mContactos[1,i];
			Escribir "";
			Escribir "El contacto se ha guardado correctamente como CONTACTO ", i+1, ".";
			i=ultimoContacto;
		FinSi
	FinPara
FinSubProceso

// 4 - Modificar contacto
SubProceso  modificarContacto(ultimoContacto,mContactos)
	Definir inputSub Como Entero;
	inputSub=0;
	
	Escribir "Introduce el ID del contacto que deseas modificar: ", Sin Saltar;
	Leer inputSub;
	Escribir "";
	
	Si inputSub>0 y inputSub<=ultimoContacto y (mContactos[0,inputSub-1]<>"" o mContactos[1,inputSub-1]<>"") Entonces
		escribirContacto(mContactos,inputSub-1);
		Escribir "Introduce el nuevo nombre del contacto:";
		Leer mContactos[0,inputSub-1];
		Escribir "Introduce el nuevo teléfono del contacto:";
		Leer mContactos[1,inputSub-1];
		Escribir "El contacto se ha modificado con éxito.";
	SiNo
		errorNoContacto();
	FinSi
FinSubProceso

// 5 - Eliminar contacto
SubProceso eliminarContacto(ultimoContacto,mContactos)
	Definir inputSub Como Entero;
	Definir siONo Como Caracter;
	inputSub=0;
	siONo="";
	
	Escribir "Introduce el ID del contacto que deseas eliminar: ", Sin Saltar;
	Leer inputSub;
	Escribir "";
	Si mContactos[0,inputSub-1]<>"" o mContactos[1,inputSub-1]<>"" Entonces
		Escribir "Has elegido eliminar el siguiente contacto:";
		Escribir "";
		escribirContacto(mContactos,inputSub-1);
		Escribir "";
		Escribir "¿Estás seguro? (S/N) " Sin Saltar;
		Leer siONo;
		siONo=Minusculas(siONo);
		Si siONo=="s" Entonces
			mContactos[0,inputSub-1]="";
			mContactos[1,inputSub-1]="";
			Escribir "El contacto se ha eliminado correctamente.";
			renumerarContactos(ultimoContacto,mContactos);
			Escribir "Los contactos se han renumerado.";
		SiNo
			Escribir "La operación se ha cancelado. Ningún contacto ha sido eliminado.";
		FinSi
	SiNo
		errorNoContacto();
	FinSi
	
FinSubProceso

// FUNCIONES DE USO HABITUAL
// Escribir un contacto
SubProceso escribirContacto (mContactos,i)
	Escribir "CONTACTO ", i+1, ": ", mContactos[0,i], ", ", mContactos[1,i],".";
FinSubProceso

// Mover cada contacto al primer hueco vacío
Funcion renumerarContactos(ultimoContacto, mContactos)
	Definir i, j Como Entero;
	
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

// ERRORES
SubProceso errorNoContacto()
	Escribir "ERROR: El contacto seleccionado no existe.";
FinSubProceso

SubProceso errorOpInvalida()
	Escribir "ERROR: Operación inválida.";
FinSubProceso

// PROGRAMA PRINCIPAL
Algoritmo AgendaArray
	Definir mContactos, userInput Como Caracter;
	Definir inputMenu, inputSub, ultimoContacto, campos, numeroContactos, i, j, m Como Entero;
	Definir salir Como Logico;
	salir=Falso;
	
	// ESTABLECER TAMAÑO AGENDA
	numeroContactos=10;
	campos=2;
	ultimoContacto=numeroContactos-1;
	
	// CREAR Y RELLENAR AGENDA
	Dimension mContactos[campos,numeroContactos];
	
	Para i=0 hasta campos-1 Hacer
		Para j=0 hasta numeroContactos-1 Hacer
			mContactos[i,j]="";
		FinPara
	FinPara
	
	mContactos[0,0]="Juan";
	mContactos[1,0]="1234";
	mContactos[0,3]="María";
	mContactos[1,3]="3456";
	
	// RENUMERAR CONTACTOS
	renumerarContactos(ultimoContacto, mContactos);
	
	Repetir
		inputMenu=0;
		userInput="";
		
		// ABRIR MENÚ PRINCIPAL
		inputMenu=menuPrincipal;
		
		Escribir "";
		
		Segun inputMenu hacer
			1:
				verContactos(ultimoContacto,mContactos,numeroContactos);
			2:
				buscarContactos(userInput,contador,i,j,m,ultimoContacto,mContactos,campos);
			3:
				agregarContacto(ultimoContacto,mContactos,campos);
			4:
				modificarContacto(ultimoContacto,mContactos);
			5:
				eliminarContacto(ultimoContacto,mContactos);
			6:
				salir=Verdadero;
		FinSegun
		
		Si inputMenu<0 o inputMenu>6 Entonces
			errorOpInvalida();
		FinSi
		
		Si inputMenu<>6 Entonces
			Escribir "Pulsa INTRO para regresar al menú: ", Sin Saltar;
			Leer inputMenu;
			Escribir "";
		FinSi
		
	Hasta Que salir==Verdadero;
	
FinAlgoritmo