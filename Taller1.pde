String[] headline={
  "¡Bienvenido a LINE!", 
  "Selecciona un nivel para empezar", 
};
String[] completo={
  "¡Felicidades! Has completado el nivel."
};
//Funcionamiento de cada nivel
boolean P;
boolean Q;
boolean control;

int index;
int level;
int ganar;
int grosor;
int grosorl;
int b;

float hx;
float z;
float w;
float x;
float y;

PFont f;
color grey= color(208, 206, 212);

PVector puntofinal = new PVector(0, 0);
PVector puntoinicial = new PVector(0, 0);
PVector M;
PVector A;
//Para generar los niveles:
//Nivel 1
ArrayList<PVector> punto1 = new ArrayList<PVector>();
int MG1[][]={  
  { 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 }, 
  { 1, 0, 1, 1, 0, 0, 0, 0, 0, 0 }, 
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 1 }, 
  { 0, 1, 0, 0, 1, 1, 1, 0, 0, 0 }, 
  { 0, 0, 0, 1, 0, 0, 1, 0, 0, 0 }, 
  { 0, 0, 0, 1, 0, 0, 1, 0, 0, 0 }, 
  { 0, 0, 0, 1, 1, 1, 0, 0, 1, 0 }, 
  { 1, 0, 0, 0, 0, 0, 0, 0, 1, 0 }, 
  { 0, 0, 0, 0, 0, 0, 1, 1, 0, 1 }, 
  { 0, 0, 1, 0, 0, 0, 0, 0, 1, 0 }
};

int ML1[][]={  
  { 0, 1, 0, 0, 0, 0, 0, 1, 0, 0 }, 
  { 1, 0, 1, 1, 0, 0, 0, 0, 0, 0 }, 
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 1 }, 
  { 0, 1, 0, 0, 1, 1, 1, 0, 0, 0 }, 
  { 0, 0, 0, 1, 0, 0, 1, 0, 0, 0 }, 
  { 0, 0, 0, 1, 0, 0, 1, 0, 0, 0 }, 
  { 0, 0, 0, 1, 1, 1, 0, 0, 1, 0 }, 
  { 1, 0, 0, 0, 0, 0, 0, 0, 1, 0 }, 
  { 0, 0, 0, 0, 0, 0, 1, 1, 0, 1 }, 
  { 0, 0, 1, 0, 0, 0, 0, 0, 1, 0 }
};
//Nivel 2
ArrayList<PVector> punto2 = new ArrayList<PVector>();
int MG2[][]={  
  { 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0}, //0
  { 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, //1
  { 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //2
  { 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0}, //3
  { 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0}, //4
  { 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0}, //5
  { 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1}, //6
  { 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0}, //7
  { 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0}, //8
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0}, //9
  { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1}, //10
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0}  //11
};
int ML2[][]={  
  { 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0}, //0
  { 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0}, //1
  { 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, //2
  { 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0}, //3
  { 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0}, //4
  { 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0}, //5
  { 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1}, //6
  { 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0}, //7
  { 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0}, //8
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0}, //9
  { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1}, //10
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0}  //11
};
//Nivel 3
ArrayList<PVector> punto3 = new ArrayList<PVector>();
int MG3[][]={
  
  {0,1,1,0,1,1},//0
  {1,0,0,1,1,1},//1
  {1,0,0,1,1,1},//2
  {0,1,1,0,1,1},//3
  {1,1,1,1,0,0},//4
  {1,1,1,1,0,0},//5
  
};
int ML3[][]={
  
  {0,1,1,0,1,1},//0
  {1,0,0,1,1,1},//1
  {1,0,0,1,1,1},//2
  {0,1,1,0,1,1},//3
  {1,1,1,1,0,0},//4
  {1,1,1,1,0,0},//5
  
};
//Nivel 4
ArrayList<PVector> punto4 = new ArrayList<PVector>();
int MG4[][]={  
  { 0, 2, 0, 0, 0}, 
  { 2, 0, 1, 1, 0}, 
  { 0, 1, 0, 1, 0}, 
  { 0, 1, 1, 0, 1}, 
  { 0, 0, 0, 1, 0}
};
int ML4[][]={  
  { 0, 2, 0, 0, 0}, 
  { 2, 0, 1, 1, 0}, 
  { 0, 1, 0, 1, 0}, 
  { 0, 1, 1, 0, 1}, 
  { 0, 0, 0, 1, 0}
};



//Arreglo que guarda las líneas
ArrayList<PVector> linea = new ArrayList<PVector>();

void setup() {

  size(800, 650);
  //Puntos nivel 1
  punto1.add(new PVector(200, 20));
  punto1.add(new PVector(400, 20));
  punto1.add(new PVector(600, 20));
  punto1.add(new PVector(400, 120));
  punto1.add(new PVector(300, 220));
  punto1.add(new PVector(500, 220));
  punto1.add(new PVector(400, 320));
  punto1.add(new PVector(200, 420));
  punto1.add(new PVector(400, 420));
  punto1.add(new PVector(600, 420));
  //Puntos nivel 2
  punto2.add(new PVector(200, 20));//0
  punto2.add(new PVector(400, 20));//1
  punto2.add(new PVector(600, 20));//2
  punto2.add(new PVector(300, 120));//3
  punto2.add(new PVector(500, 120));//4
  punto2.add(new PVector(200, 220));//5
  punto2.add(new PVector(600, 220));//6
  punto2.add(new PVector(300, 320));//7
  punto2.add(new PVector(500, 320));//8
  punto2.add(new PVector(200, 420));//9
  punto2.add(new PVector(400, 420));//10
  punto2.add(new PVector(600, 420));//11
  //Puntos nivel 3
  punto3.add(new PVector(200,20));//0
  punto3.add(new PVector(620,20));//1
  punto3.add(new PVector(200,440));//2
  punto3.add(new PVector(620,440));//3
  punto3.add(new PVector(410,370));//4
  punto3.add(new PVector (410,230));//5
  //Puntos nivel 4
  punto4.add(new PVector(200, 20));//0
  punto4.add(new PVector(400, 20));//1
  punto4.add(new PVector(600, 20));//2
  punto4.add(new PVector(600, 220));//6
  punto4.add(new PVector(600, 420));//11


  //Default
  grosor=20;
  grosorl=12;
  x=0;
  y=0;
  level=0;

  P=true;
  Q=true;
  control=true;

  f=createFont("Arial", 30, true);
  hx=width;
}

void draw() {
  //Se divide por niveles
  //Nivel 0: Pantalla de inicio.
  if (level==0) {
    background(100, 100, 250);
    textFont(f, 16);
    fill(0);
    textSize(50);
    textAlign(LEFT);
    text(headline[index], hx, 120);
    hx=hx-3;
    float limitepantalla=textWidth(headline[index]);
    if (hx<-limitepantalla) {
      hx=width;
      index=(index +1) % headline.length;
    }
    println(mouseX, mouseY);
    textAlign(CENTER);
    textSize(28);
    text("Nivel 1", width/2, height/3);
    text("Nivel 2", width/2, height/2);
    text("Nivel 3", width/2, height*2/3);
    text("Opciones", width/2, height*5/6);
    text("Nivel 4", width*3/4, height/3);
    strokeWeight(7);
    noFill();
    quad((width/2)-70,(height/3)-40,(width*3/4)+60, (height/3)-40,(width*3/4)+60,(height*2/3)+130,(width/2)-70, (height*2/3)+130);
    quad( 20,(height/3)-40,(width/2)-70,(height/3)-40,(width/2)-70, (height*2/3)+130,20,(height*2/3)+130);
    textAlign(LEFT);
    text("INSTRUCCIONES",30,(height/3)-10);
    textSize(20);
    int a= 25;
    
    text("Una los nodos hasta completar la" ,30,(height/3)+20);
    text("figura, no puede  repetir  línea (a" ,30,(height/3)+20+a);
    text("menos  de  que  se  indique   con" ,30,(height/3)+20+2*a);
    text("una  línea  de  distinto color).",30,(height/3)+20+3*a);
    text("*Una los nodos con el mouse.",30,(height/3)+20+5*a);
    
    text("En  opciones  podrá  cambiar  el",30,(height/3)+20+7*a);
    text("tamaño de los nodos y el grosor",30,(height/3)+20+8*a);
    text("de las líneas de unión.",30,(height/3)+20+9*a);
    text("*Use las flechas del teclado para",30,(height/3)+20+11*a);
    text("cambiar los tamaños.",30,(height/3)+20+12*a);
    
    
  }

  if (level==1) {
    background(100, 200, 200);
    strokeWeight(grosorl);
    stroke(grey);
    int puntoin = punto1.indexOf(puntoinicial);
    int puntofi = punto1.indexOf(puntofinal);


    textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(40);
    text("Reintentar", width/2, 520);
    for (int i=0; i<punto1.size(); i++) {
      for (int j=0; j<punto1.size(); j++) {
        if (MG1[i][j]==1) {
          line((int)punto1.get(i).x, (int)punto1.get(i).y, (int)punto1.get(j).x, (int)punto1.get(j).y);
        }
      }
    };
    stroke(0);
    strokeWeight(10);
    fill(0);
    for (int i=0; i<=punto1.size()-1; i++) {
      ellipse(punto1.get(i).x, punto1.get(i).y, grosor, grosor);
    }

    //Se guardan y dibujan las líneas.
    
    for (int i = 0; i<linea.size()-1; i++) {
      strokeWeight(grosorl);
      line(linea.get(i).x, linea.get(i).y, linea.get(i+1).x, linea.get(i+1).y);
    }

    M= new PVector(mouseX, mouseY);
    if (!P) {
      strokeWeight(grosorl);
      line(puntoinicial.x, puntoinicial.y, mouseX, mouseY);
    };
    if (!Q && ML1[puntoin][puntofi] != 0) {
      strokeWeight(grosorl);
      line(puntoinicial.x, puntoinicial.y, puntofinal.x, puntofinal.y);

      linea.add(puntoinicial);
      linea.add(puntofinal);
      puntoinicial = puntofinal;
      ML1[puntofi][puntoin]=ML1[puntofi][puntoin]-1;
      ML1[puntoin][puntofi]=ML1[puntoin][puntofi]-1;
    }
    
    ganar=100;
    for (int i=0; i<10; i++) {
      for (int j=0; j<10; j++) {
        if (ML1[i][j]==0) {
          ganar=ganar-1;
        }
      }
    }
    println (ganar);
    if (ganar==0) {
    background(100, 100, 250);
       textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(40);
    text("Reintentar", width/2, 520);
      textFont(f, 16);
      index=0;
      fill(0);
      textSize(50);
      textAlign(LEFT);
      text(completo[index], hx, 120);
      hx=hx-3;
      float limitepantalla=textWidth(completo[index]);
      if (hx<-limitepantalla) {
        hx=width;
        index=(index +1) % completo.length;
      }
    };
  };
  //Para el nivel 2;
  if (level==2) {
    background(100, 200, 200);

    int puntoin = punto2.indexOf(puntoinicial);
    int puntofi = punto2.indexOf(puntofinal);
    strokeWeight(grosorl);
    stroke(grey);

    textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(40);
    // println(mouseX, mouseY, puntoin, puntofi);
    text("Reintentar", width/2, 520);
    for (int i=0; i<punto2.size(); i++) {
      for (int j=0; j<punto2.size(); j++) {
        if (MG2[i][j]==1) {
          line((int)punto2.get(i).x, (int)punto2.get(i).y, (int)punto2.get(j).x, (int)punto2.get(j).y);
        }
      }
    };
    stroke(0);
    strokeWeight(10);
    fill(0);
    for (int i=0; i<=punto2.size()-1; i++) {
      ellipse(punto2.get(i).x, punto2.get(i).y, grosor, grosor);
    }

    //Se guardan y dibujan las líneas.
    strokeWeight(grosorl);
    for (int i = 0; i<linea.size()-1; i++) {
      line(linea.get(i).x, linea.get(i).y, linea.get(i+1).x, linea.get(i+1).y);
    }
    
    M= new PVector(mouseX, mouseY);
    if (!P) {
      line(puntoinicial.x, puntoinicial.y, mouseX, mouseY);
    };
    if (!Q && ML2[puntoin][puntofi] != 0) {
      line(puntoinicial.x, puntoinicial.y, puntofinal.x, puntofinal.y);

      linea.add(puntoinicial);
      linea.add(puntofinal);
      puntoinicial = puntofinal;
      ML2[puntofi][puntoin]=ML2[puntofi][puntoin]-1;
      ML2[puntoin][puntofi]=ML2[puntoin][puntofi]-1;
    }
    
    println (linea.size());
    if (linea.size()==40) {
      background(100, 100, 250);
      textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(40);
    text("Reintentar", width/2, 520);
      textFont(f, 16);
      index=0;
      fill(0);
      textSize(50);
      textAlign(LEFT);
      text(completo[index], hx, 120);
      hx=hx-3;
      float limitepantalla=textWidth(completo[index]);
      if (hx<-limitepantalla) {
        hx=width;
        index=(index +1) % completo.length;
     

      }
    };
  };
  
  if (level==3) {
    background(100, 200, 200);

    int puntoin = punto3.indexOf(puntoinicial);
    int puntofi = punto3.indexOf(puntofinal);
    strokeWeight(grosorl);
    stroke(grey);

    textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(40);
    // println(mouseX, mouseY, puntoin, puntofi);
    text("Reintentar", width/2, 520);
    for (int i=0; i<punto3.size(); i++) {
      for (int j=0; j<punto3.size(); j++) {
        if (MG3[i][j]==1) {
          line((int)punto3.get(i).x, (int)punto3.get(i).y, (int)punto3.get(j).x, (int)punto3.get(j).y);
        }
      }
    };
    stroke(0);
    strokeWeight(10);
    fill(0);
    for (int i=0; i<=punto3.size()-1; i++) {
      ellipse(punto3.get(i).x, punto3.get(i).y, grosor, grosor);
    }

    //Se guardan y dibujan las líneas.
     strokeWeight(grosorl);
    for (int i = 0; i<linea.size()-1; i++) {
      line(linea.get(i).x, linea.get(i).y, linea.get(i+1).x, linea.get(i+1).y);
    }

    M= new PVector(mouseX, mouseY);
    if (!P) {
      line(puntoinicial.x, puntoinicial.y, mouseX, mouseY);
    };
    if (!Q && ML3[puntoin][puntofi] != 0) {
      line(puntoinicial.x, puntoinicial.y, puntofinal.x, puntofinal.y);

      linea.add(puntoinicial);
      linea.add(puntofinal);
      puntoinicial = puntofinal;
      ML3[puntofi][puntoin]=ML3[puntofi][puntoin]-1;
      ML3[puntoin][puntofi]=ML3[puntoin][puntofi]-1;
    }
    
    println (linea.size());
    if (linea.size()==24) {
      background(100, 100, 250);
      textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(40);
    text("Reintentar", width/2, 520);
      textFont(f, 16);
      fill(0);
      index=0;
      textSize(50);
      textAlign(LEFT);
      text(completo[index], hx, 120);
      hx=hx-3;
      float limitepantalla=textWidth(completo[index]);
      if (hx<-limitepantalla) {
        hx=width;
        index=(index +1) % completo.length;
      }
    };
  };
  //Para nivel 4
  if (level==4) {
    background(100, 200, 200);

    int puntoin = punto4.indexOf(puntoinicial);
    int puntofi = punto4.indexOf(puntofinal);
    strokeWeight(grosorl);
    stroke(grey);

    textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(15);
    text("Puedes pasar 2 veces por esta línea", 295, 50);
    textSize(40);
    println(mouseX, mouseY, puntoin, puntofi);
    text("Reintentar", width/2, 520);
    for (int i=0; i<punto4.size(); i++) {
      for (int j=0; j<punto4.size(); j++) {
        if (MG4[i][j]!=0) {
          
          if(MG4[i][j]==2  ){
          
            stroke(220,250,300);
            line((int)punto4.get(i).x, (int)punto4.get(i).y, (int)punto4.get(j).x, (int)punto4.get(j).y);
          }
        if (MG4[i][j]==1){
          stroke(grey);
            line((int)punto4.get(i).x, (int)punto4.get(i).y, (int)punto4.get(j).x, (int)punto4.get(j).y);
        }
        
        }
      }
    };
    stroke(0);
    strokeWeight(10);
    fill(0);
    for (int i=0; i<=punto4.size()-1; i++) {
      ellipse(punto4.get(i).x, punto4.get(i).y, grosor, grosor);
    }

    //Se guardan y dibujan las líneas.
     strokeWeight(grosorl);
    for (int i = 0; i<linea.size()-1; i++) {
      
      if(linea.get(i).x==400 &&  linea.get(i).y==20 && linea.get(i+1).x==200 && linea.get(i+1).y==20){
        
        stroke(55,40,200);
        
      }else{stroke(0);}
      line(linea.get(i).x, linea.get(i).y, linea.get(i+1).x, linea.get(i+1).y);
      
      
    }
    for (int i = 0; i<linea.size()-1; i++) {
      
      if(linea.get(i).x==400 &&  linea.get(i).y==20 && linea.get(i+1).x==200 && linea.get(i+1).y==20){
        
    
    stroke(55,40,200);
    M= new PVector(mouseX, mouseY);
    }else{stroke(0);}
    }
    
    if (!P) {
      line(puntoinicial.x, puntoinicial.y, mouseX, mouseY);
    };
    if (!Q && ML4[puntoin][puntofi] != 0) {
      line(puntoinicial.x, puntoinicial.y, puntofinal.x, puntofinal.y);

      linea.add(puntoinicial);
      linea.add(puntofinal);
      puntoinicial = puntofinal;
      ML4[puntofi][puntoin]=ML4[puntofi][puntoin]-1;
      ML4[puntoin][puntofi]=ML4[puntoin][puntofi]-1;
    }
    
    //println (linea.size());
    if (linea.size()==12) {
      background(100, 100, 250);
      textAlign(CENTER);
    textSize(35);
    text("MENÚ", 60, 40);
    textSize(40);
    text("Reintentar", width/2, 520);
      textFont(f, 16);
      fill(0);
      index=0;
      textSize(50);
      textAlign(LEFT);
      text(completo[index], hx, 120);
      hx=hx-3;
      float limitepantalla=textWidth(completo[index]);
      if (hx<-limitepantalla) {
        hx=width;
        index=(index +1) % completo.length;
      }
    };
  };
  //Para opciones1:
  if (level==80) {
  background(100, 100, 250);
    textSize(30);
    textAlign(LEFT);
    fill(0);
    text("Seleccione el tamaño de nodo preferido:", 0, 40);
    fill(0);
    strokeWeight(5);
    line(20, 100, 170, 100);
    fill(200, 500);
    fill(255);
    ellipse(20+b, 100, 20, 20);

    if (keyPressed && key == CODED ) {

      if (keyCode == LEFT) {

        if (b>=10)
          b=b-3;
      } else if (keyCode == RIGHT) {
        if (b<=160)
          b=b+3;
      }
    }
    grosor=20+(b/3);
    ellipse(width/2, height/2, 20+(b/3), 20+(b/3));   
    textAlign(CENTER);
    fill(0);
    text("SIGUIENTE", width/2, 590);
    // println(mouseX, mouseY);
  
}

//Para opciones2:
  if (level==81) {
    background(100, 100, 250);
    textSize(30);
    textAlign(LEFT);
    fill(100);
    text("Seleccione el grosor de línea preferida", 0, 40);
    fill(0);
    strokeWeight(5);
    println(mouseX,mouseY);
    line(20, 100, 100, 100);
    fill(200, 500);
    fill(255);
    ellipse(20+b, 100, 20, 20);
    strokeWeight(2+(b/3));
    line((width/2)-200,height/2,(width/2)+200,height/2);

    if (keyPressed && key == CODED ) {

      if (keyCode == LEFT) {

        if (b>=10)
          b=b-3;
      } else if (keyCode == RIGHT) {
        if (b<=90)
          b=b+3;
      }
    }
    grosorl=2+(b/3);
    println(grosorl);   
    textAlign(CENTER);
    fill(0);
    text("ACEPTAR", width/2, 590);
    // println(mouseX, mouseY);

}
}

void mouseClicked() {
  //Opciones pantalla inicio
  if (level==0 && 350<=mouseX && mouseX<=450 && 190<=mouseY && mouseY<=220) {
    level=1;
  };
  if (level==0 && 350<=mouseX && mouseX<=450 && 300<=mouseY && mouseY<=330) {
    level=2;
  };
  if (level==0 && 350<=mouseX && mouseX<=450 && 410<=mouseY && mouseY<=430) {
    level=3;
  };
  if (level==0 && 550<=mouseX && mouseX<=650 && 190<=mouseY && mouseY<=220) {
    level=4;
  };
  if (level==0 && 330<=mouseX && mouseX<=470 && 515<=mouseY && mouseY<=540) {
    level=80;
  };
  
  //Reintentar nivel 1
  if (level==1 && mouseX<=525 && 295<=mouseX && 485<=mouseY && mouseY<=525) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
      for (int a=0; a<punto1.size(); a++) {
        for (int c=0; c<punto1.size(); c++) {

          ML1[a][c]=MG1[a][c];
          control=true;
          P=true;
          Q=true;
        }
      }
    };
  };
  //Reintentar nivel 2
  if (level==2 && mouseX<=525 && 295<=mouseX && 485<=mouseY && mouseY<=525) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
      for (int a=0; a<punto2.size(); a++) {
        for (int c=0; c<punto2.size(); c++) {

          ML2[a][c]=MG2[a][c];
          control=true;
          P=true;
          Q=true;
        }
      }
    };
  };
  //Reintentar nivel 3
  if (level==3 && mouseX<=525 && 295<=mouseX && 485<=mouseY && mouseY<=525) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
      for (int a=0; a<punto3.size(); a++) {
        for (int c=0; c<punto3.size(); c++) {

          ML3[a][c]=MG3[a][c];
          control=true;
          P=true;
          Q=true;
        }
      }
    };
  };
  //Reintentar nivel 4
  if (level==4 && mouseX<=525 && 295<=mouseX && 485<=mouseY && mouseY<=525) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
      for (int a=0; a<punto4.size(); a++) {
        for (int c=0; c<punto4.size(); c++) {

          ML4[a][c]=MG4[a][c];
          control=true;
          P=true;
          Q=true;
        }
      }
    };
  };
  //Volver al menú principal nivel 1
  if (level==1 && mouseX<=110 && 10<=mouseX && 10<=mouseY && mouseY<=40) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
    };
    for (int a=0; a<punto1.size(); a++) {
        for (int c=0; c<punto1.size(); c++) {

          ML1[a][c]=MG1[a][c];
          control=true;
          P=true;
          Q=true;
        }
      }
    level=0;
  };
  //Volver al menú principal nivel 2
  if (level==2 && mouseX<=110 && 10<=mouseX && 10<=mouseY && mouseY<=40) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
    };
    for (int a=0; a<punto2.size(); a++) {
      for (int c=0; c<punto2.size(); c++) {

        ML2[a][c]=MG2[a][c];
        control=true;
        P=true;
        Q=true;
      }
    }
    level=0;
  };
  //Volver al menú principal nivel 3
  if (level==3 && mouseX<=110 && 10<=mouseX && 10<=mouseY && mouseY<=40) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
    };
    for (int a=0; a<punto3.size(); a++) {
        for (int c=0; c<punto3.size(); c++) {

          ML3[a][c]=MG3[a][c];
          control=true;
          P=true;
          Q=true;
        }
      }
    level=0;
  };
  //Volver al menú principal nivel 4
  if (level==4 && mouseX<=110 && 10<=mouseX && 10<=mouseY && mouseY<=40) {
    for (int i=linea.size()-1; i>=0; i--) {
      linea.remove(i);
    };
    for (int a=0; a<punto4.size(); a++) {
        for (int c=0; c<punto4.size(); c++) {

          ML4[a][c]=MG4[a][c];
          control=true;
          P=true;
          Q=true;
        }
      }
    level=0;
  };
  if (level==3 && mouseX<=110 && 10<=mouseX && 10<=mouseY && mouseY<=40) {
    level=0;
  };
  if (level==81 && 340<=mouseX && mouseX<=500 && 560<=mouseY && mouseY<=590) {
    level=0;
  };
  if (level==80 && 340<=mouseX && mouseX<=500 && 560<=mouseY && mouseY<=590) {
    level=81;
  };
  
};



void mousePressed () {
  //Para nivel 1
  if (level==1) {
    for (int i=0; i<10; i++) {
      if (mouseX<=(punto1.get(i).x+grosor) && mouseX>=(punto1.get(i).x-grosor) && mouseY<=(punto1.get(i).y+grosor) && mouseY>=(punto1.get(i).y-grosor)) {
        if (control==true) {
          puntoinicial = punto1.get(i);
          ;
          control=false;
        }
        P=false;
        Q=true;
      }
    }
  }
  //Para nivel 2
  if (level==2) {
    for (int i=0; i<12; i++) {
      if (mouseX<=(punto2.get(i).x+grosor) && mouseX>=(punto2.get(i).x-grosor) && mouseY<=(punto2.get(i).y+grosor) && mouseY>=(punto2.get(i).y-grosor)) {
        if (control==true) {
          puntoinicial = punto2.get(i);
          ;
          control=false;
        }
        P=false;
        Q=true;
      }
    }
  }
  //Para nivel 3
  if (level==3) {
    for (int i=0; i<6; i++) {
      if (mouseX<=(punto3.get(i).x+grosor) && mouseX>=(punto3.get(i).x-grosor) && mouseY<=(punto3.get(i).y+grosor) && mouseY>=(punto3.get(i).y-grosor)) {
        if (control==true) {
          puntoinicial = punto3.get(i);
          ;
          control=false;
        }
        P=false;
        Q=true;
      }
    }
  }
  //Para nivel 4
  if (level==4) {
    for (int i=0; i<punto4.size(); i++) {
      if (mouseX<=(punto4.get(i).x+grosor) && mouseX>=(punto4.get(i).x-grosor) && mouseY<=(punto4.get(i).y+grosor) && mouseY>=(punto4.get(i).y-grosor)) {
        if (control==true) {
          puntoinicial = punto4.get(i);
          ;
          control=false;
        }
        P=false;
        Q=true;
      }
    }
  }
}


void mouseReleased () {
  //Para nivel 1
  if (level==1) {
    for (int i=0; i<10; i++) {
      for (int j=0; j<10; j++) {
        if (mouseX<=(punto1.get(i).x+grosor) && mouseX>=(punto1.get(i).x-grosor) && mouseY<=(punto1.get(i).y+grosor) && mouseY>=(punto1.get(i).y-grosor) ) {
          puntofinal = punto1.get(i);
          Q=false;
          P=true;
        }
      }
    }
  }
  //Para nivel 2
  if (level==2) {
    for (int i=0; i<12; i++) {
      for (int j=0; j<12; j++) {
        if (mouseX<=(punto2.get(i).x+grosor) && mouseX>=(punto2.get(i).x-grosor) && mouseY<=(punto2.get(i).y+grosor) && mouseY>=(punto2.get(i).y-grosor) ) {
          puntofinal = punto2.get(i);
          Q=false;
          P=true;
        }
      }
    }
  }
  //Para nivel 3
  if (level==3) {
    for (int i=0; i<6; i++) {
      for (int j=0; j<6; j++) {
        if (mouseX<=(punto3.get(i).x+grosor) && mouseX>=(punto3.get(i).x-grosor) && mouseY<=(punto3.get(i).y+grosor) && mouseY>=(punto3.get(i).y-grosor) ) {
          puntofinal = punto3.get(i);
          Q=false;
          P=true;
        }
      }
    }
  }
  //Para nivel 4
  if (level==4) {
    for (int i=0; i<punto4.size(); i++) {
      for (int j=0; j<punto4.size(); j++) {
        if (mouseX<=(punto4.get(i).x+grosor) && mouseX>=(punto4.get(i).x-grosor) && mouseY<=(punto4.get(i).y+grosor) && mouseY>=(punto4.get(i).y-grosor) ) {
          puntofinal = punto4.get(i);
          Q=false;
          P=true;
        }
      }
    }
  }
}
