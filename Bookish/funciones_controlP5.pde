
//funcion barra de busqueda
public void searchbar(String theText) {
    searchtext = theText.toLowerCase();
    println(searchtext);
    buscar(searchtext);   
}

//funcion boton busqueda
public void sumit() {
  if(v){
    searchtext = cp5.get(Textfield.class,"searchbar").getText();
    println(searchtext);
    buscar(searchtext);
  }
}

//funcion pagina siguiente
public void next(){
  //ciclo para el cambio de etiqueta del boton
  if(v && index<z){
   v=false;
   for(int i=0;i<9;i++,index++){      
      if(index<z){
        PImage b1 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book.png");
        b1.resize(width/4 -20,width/4 -20);
        PImage b2 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book2.png");
        b2.resize(width/4 -20,width/4 -20);
        botones[i].setImages(b1,b2,b1).setLabel(general.getString(index,"name")).setValue(index).setVisible(true);;
        labels[i].setText(general.getString(index,"name")).setVisible(true);
        println(i);
      }
      else {
        botones[i].setVisible(false);
        labels[i].setVisible(false);
      }
    }
    accordion.open(1);
    println(index);
    v=true;
   }
}

//funcion del boton de pagina anterior
public void prev(){
   if(v && index >9){
     v=false;
    index-=10;    
    for(int i=8;i>=0;i--,index--){
      
      PImage b1 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book.png");
      b1.resize(width/4 -20,width/4 -20);
      PImage b2 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book2.png");
      b2.resize(width/4 -20,width/4 -20);
      
      botones[i].setImages(b1,b2,b1).setLabel(general.getString(index,"name")).setVisible(true).setValue(index);
      labels[i].setText(general.getString(index,"name")).setVisible(true);
      println(i);    
    }
    accordion.open(1);
    index+=10;
    println(index);
    v=true;
   } 
}

//funcines asociadas a los eventos de los botones

public void Libro1(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue())  ,"user"),general.getString(int(theEvent.getValue()) ,"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }
}
public void Libro2(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }
  
}
public void Libro3(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }

}
public void Libro4(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }

}
public void Libro5(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }

}
public void Libro6(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }

}
public void Libro7(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }

}
public void Libro8(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }

}
public void Libro9(ControlEvent theEvent){
  if(v){
    v2=true;
    book.cargar(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    book.display();//(general.getString(int(theEvent.getValue()),"user"),general.getString(int(theEvent.getValue()),"name"));
    accordion.close();
  }
}


//funcion para el cambio de pestañas
void controlEvent(ControlEvent theEvent) {
  
  if (theEvent.isTab()) {
    println("got an event from tab : "+theEvent.getTab().getName()+" with id "+theEvent.getTab().getId());
    accordion.open(0);
    v2=false;
  }
  if (theEvent.isGroup()){
   println("ok " + theEvent.getGroup().getValue()+" "+theEvent.getGroup()); 
  }
  
}

//funcion boton ingresar pestaña login
public void ingresar(){
  if(v){ 
    user.verificar(cp5.get(Textfield.class,"usuario").getText(),cp5.get(Textfield.class,"contraseña").getText());
    cp5.get(Textfield.class,"contraseña").clear();
  }
  
}

//funcion boton guardar pestaña: login ; grupo: perfil
public void guardar(){
  user.guardardatos();
}

public void bimg1(){
  if(v){
    selectInput("Seleciona la Foto # 1:", "fileimg1");
  }
  
}

public void fileimg1(File ruta){
  if (ruta == null) {
    println("Window was closed or the user hit cancel.");
    
  } else {
    
    println("User selected " + ruta.getAbsolutePath());
    cp5.get(Textfield.class,("img1")).setText(ruta.getAbsolutePath());
   
  }

}

public void bimg2(){
  if(v){
    selectInput("Seleciona la Foto # 2:", "fileimg2");
  }
  
}

public void fileimg2(File ruta){
  if (ruta == null) {
    println("Window was closed or the user hit cancel.");
    
  } else {
    
    println("User selected " + ruta.getAbsolutePath());
    cp5.get(Textfield.class,("img2")).setText(ruta.getAbsolutePath());
   
  }

}


public void agregar(){
  if(v && !cp5.get(Textfield.class,"titulo").getText().equals("") && !cp5.get(Textfield.class,"titulo").getText().equals(" ")){
    if(!cp5.get(Textfield.class,"autor").getText().equals("") && !cp5.get(Textfield.class,"autor").getText().equals(" ")){
      if(!cp5.get(Textfield.class,"publicacion").getText().equals("") && !cp5.get(Textfield.class,"publicacion").getText().equals(" ")){
        if(!cp5.get(Textfield.class,"img1").getText().equals("") && !cp5.get(Textfield.class,"img2").getText().equals(" ")){
          if(!cp5.get(Textfield.class,"img2").getText().equals("") && !cp5.get(Textfield.class,"img2").getText().equals(" ")){
            if(!cp5.get(Textfield.class,"tipo").getText().equals("") && !cp5.get(Textfield.class,"tipo").getText().equals(" ")){
               if(!cp5.get(Textfield.class,"descripciondeltexto").getText().equals("") && !cp5.get(Textfield.class,"descripciondeltexto").getText().equals(" ")){
                 user.agregar();
               }
            }
          }
        }
      }
    }
  }
  else println("hay espacios sin llenar");
}

public void enviar(){
  if(v && !cp5.get(Textfield.class,"ofertador").getText().equals("") && !cp5.get(Textfield.class,"ofertador").getText().equals(" ")){
    if(!cp5.get(Textfield.class,"ofcorreo").getText().equals("") && !cp5.get(Textfield.class,"ofcorreo").getText().equals(" ")){
      if(!cp5.get(Textfield.class,"oftelefono").getText().equals("") && !cp5.get(Textfield.class,"oftelefono").getText().equals(" ")){
        if(!cp5.get(Textfield.class,"ofmensaje").getText().equals("") && !cp5.get(Textfield.class,"ofmensaje").getText().equals(" ")){
          String oferta[] = new String [4];
          oferta[0] = cp5.get(Textfield.class,"ofertador").getText();
          oferta[1] = cp5.get(Textfield.class,"ofcorreo").getText();
          oferta[2] = cp5.get(Textfield.class,"oftelefono").getText();
          oferta[3] = cp5.get(Textfield.class,"ofmensaje").getText();
          saveStrings("data/users/" + book.getUserBook()+"/oferta.txt",oferta);
          println("oferta enviada");
        }
      }
    }
  }
  else println("hay campos sin llenar");
}