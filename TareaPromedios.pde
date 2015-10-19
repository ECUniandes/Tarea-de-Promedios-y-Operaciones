//Ejercicio elaborado por Ernesto Cuellar para la Clase de Fundamentos 1 MDIS- 2015 Semestre II

// Tarea para demostrar el uso de variables para acumular promedios y totales utiles en las visualizaciones.

// La visualizacion requiere una pantalla con resolución superior a 1900X1300

//INICIO DEL EJERCIO
// se declaran los nombres de las letras y las tablas que se van a usar en el ejercicio
Table  tabla;  
PFont letra;
int TotalFondo = 0;
int TotalCofin = 0;
int AvgFondo = 0;
int AvgCofin = 0;
int TotalTotal = 0;
int Cuenta;

// El presente ejercicio esta basado en los datos del Mapa 1.2. Distribución de recursos del Fondo CTeI del SGR aprobados por departamento, vigencia 2012, bienios 2013 - 2014 y 2015 - 2016, con corte a 31 de diciembre de 2014*
// tomado del informe anual de indicadores de ciencia y tecnologia 2014. pagina 44 del informe pagina 42 del PDF. 


void  setup()  
{  

//DEFINICIONES
// declaracion del tamano del lienzo
size(1900,1300);
// se define el relleno del lienzo
background(255);
//se carga la letra
letra = loadFont("CenturyGothic-Bold-48.vlw");
// se define el tamano de la letra
textFont(letra,20);
// se define el suavizado de la letra.
smooth(50);

//TITULO
// se pone el texto del titulo
fill(0);
rect(0,0, 2100, 95);
fill(255);
text("Distribución de recursos del Fondo CTeI del Sistema General de Regalias (SGR) aprobados por departamento",10,25);
text("Proyectos por Departamento aprobados en la vigencia 2012, bienios 2013 - 2014 y 2015 - 2016, con corte a 31 de diciembre de 2014",10,55);
text("Cifras en Miles de Millones de Pesos COP",10,85);


//LEYENDA
// Hacemos la leyenda de la tabla
fill(255);
//contenedor
rect(1050,200, 500, 350);
//texto de la leyenda
fill(0);
text("Recursos del Fondo CTeI del SGR",1065,230);
text("Recursos Cofinanciados",1065,290);
text("Promedio de Recursos Fondo CTeI",1065,350);
text("Promedio de Recursos Cofinanciados",1065,410);
text("Cantidad y Tamaño Promedio de los proyectos",1065,470);

//Se van a graficar con una barra roja los aportes del Fondo de Ciencia y Tecnologia
noStroke();
fill(210,59,22);
rect(1065,235,150,15);
//Se van a graficar con una barra verde los aportes de Cofinanciacion
fill(0,159,57);
rect(1065,300,150,15);
// Se va a graficar las líneas gris que representan los promedios  
stroke(243,146,47);
line(1065, 365, 1215, 365);
stroke(9,131,56);
line(1065, 425, 1215, 425);
// Se grafican los circulos que representan el tamaño promedio de cada proyecto
noStroke();
fill(250,250,0);
ellipse(1080,510,20,20 );
//Se complementa la descripción de los circulos
fill(0);
textFont(letra,10);
textAlign(CENTER);
text("4",1080,495);
textAlign(LEFT);
text("Cantidad de los proyectos",1100,497);
text("= Tamaño equivale a $20.000 ",1095,515);



//Cargado de la tabla
 tabla  =  loadTable("datos.csv",  "header");  
// se verifica que se esten trabajando con todas las columnas de la tabla
println(tabla.getRowCount()  +  "  Columnas totales en la tabla"); 

// se utiliza un for para leer la tabla y asignar las variables
    for  (TableRow  fila  :  tabla.rows())  {  
    // se definen las variables que se traen de la tabla
    // se define id como entero para facilitar asignar posiciones    
        int id = fila.getInt("id");
        String  Departamento =  fila.getString("Departamento");  
        int  Fondo  =  fila.getInt("FCTeI");  
        int  Cofin =  fila.getInt("Coofinanciacion"); 
        int  Proyectos =  fila.getInt("Proyectos"); 

   // Imprimimos en la consola para verificar que Processing este leyendo todas las variables.
       // println(Departamento+" tiene el id "+id+" recibio del Fondo $"+Fondo+" Cofinancio $"+Confin+" y tiene "+Proyectos+" proyectos" ); 
        
        // Hacer una variable que calcule la suma de los 2 fondos
        int TotalDepto = Fondo+Cofin;
        //Se cargan a las Variables las sumas
        TotalTotal += TotalDepto;
        TotalFondo += Fondo;
        TotalCofin += Cofin;
        Cuenta = id;
        
        
        //println(TotalTotal);
        
                                
        // Se grafican los nombres de los departamentos
        textFont(letra,20);
        fill(0,0,0);
        textAlign(RIGHT);
        text(Departamento, 300, 100+(id*35));
        textAlign(LEFT);
        text(Departamento, 800, 100+(id*35));
        
        
        // se grafican los valores de los recursos para cada departamento
        textFont(letra,10);
        textAlign(LEFT);
        text("$"+Cofin,605, 80+(id*35));
        textAlign(RIGHT);
        text("$"+Fondo,495 , 83+(id*35));
        
        //Se grafica con una barra roja los aportes del Fondo de Ciencia y Tecnologia
        noStroke();
        fill(210,59,22);
        rect(500,85+(id*35),-(Fondo/1000),15);
        //Se grafica con una barra verde los aportes del Cofinanciacion del Departamento que comienza a partir de la plata que pone el Fondo de Ciencia y Tecnologia.
        fill(0,159,57);
        rect(600,85+(id*35),Cofin/1000,15);
        //Se grafica con una barra gris los aportes sumados para verificar que las barras tengan la longitud exacta
        //fill(200);       
       // rect(300,90+(id*35),(Fondo+Confin)/1000,10);
       // se traza una linea que divida y sobre la que se apoyan los aportes del FCT
       stroke(210,59,22);
        line(500, 120, 500, 1200);
       // se traza una linea que divida y sobre la que se apoyan los aportes de Cofinanciacion
       stroke(0,159,57);
        line(600, 120, 600, 1200);
       
       //Graficamos un circulo de acuerdo al tamaño promedio de los proyectos
       
       int AvgProj = TotalDepto/Proyectos;
       noStroke();
       fill(250,250,0);
       ellipse(550,92+(id*35), AvgProj/1000,AvgProj/1000 ); 
       fill(0);
       textAlign(CENTER);
       text(+Proyectos,550, 83+(id*35));
       
       
    }  
    
    //Luego de que se detiene la iteración del FOR
   // Imprimimos en la consola las variables sumadas finales para verificar los datos con  los que se calcularán los promedios.
    println(TotalFondo);
    println(TotalCofin);
    println(Cuenta);
    //Calculamos el Promedio
    AvgFondo = TotalFondo/Cuenta;
    AvgCofin = TotalCofin/Cuenta;
    
    
    //Trazamos la linea con el promedio de Fondo por Departamento 
   
    stroke(243,146,47,85);
    line(500-(AvgFondo/1000), 120, 500-(AvgFondo/1000), 1200);
    // Mostramos el promedio del FOndo por departamento
    fill(243,146,47);
    textAlign(RIGHT);
    text("Promedio FCTeI $"+AvgFondo,435 , 930);
    //Trazamos la linea con el promedio de Cofinanciación por Departamento 
    stroke(9,131,56,85);
    line(600+(AvgCofin/1000), 120, 600+(AvgCofin/1000), 1200);
    fill(9,131,56);
    textAlign(LEFT);
    text("Promedio Cofinanciación $"+AvgCofin,625 , 930);
   
}
