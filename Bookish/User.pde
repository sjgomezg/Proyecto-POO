class User{
  
  String usinfo[];
  String us;
  
  Table text;//tabla temporal libros del usuario
  int il;
  int index2;
  
  void verificar(String usuario, String password){
    
    if(users.containsKey(usuario)){
      if(password.equals(users.get(usuario))){
        println("OK");
        us=usuario;
        user.cargar(usuario);
        user.display(usuario);
        
        user.gentx();
       user.buscar2(usuario);
        
      }
      else {
        println("Contraseña Incorrecta");
      }
    }
    else {
      println("Usuario Incorrecto");
    }
    
  }
  void cargar(String usuario){
    usinfo = loadStrings("data/users/" + usuario +"/info.txt");    
  }  
  
  void agregar(){
    String info[] = new String[5];
    info[0] = cp5.get(Textfield.class,"titulo").getText();
    info[1] = cp5.get(Textfield.class,"autor").getText();
    info[2] = cp5.get(Textfield.class,"publicacion").getText();
    info[3] = cp5.get(Textfield.class,"tipo").getText();
    info[4] = cp5.get(Textfield.class,"descripciondeltexto").getText();
    saveStrings("data/users/" + us +"/"+ info[0] +"/info.txt",info);
    
    PImage book = loadImage(cp5.get(Textfield.class,"img1").getText());
    PImage book2 = loadImage(cp5.get(Textfield.class,"img2").getText());
    book.resize(width/4 -20,width/4 -20);
    book2.resize(width/4 -20,width/4 -20);
    
    book.save("data/users/" + us +"/"+ info[0] +"/book.png");
    book2.save("data/users/" + us +"/"+ info[0] +"/book2.png");
    
    data.setString(data.lastRowIndex() + 1,"name",info[0]);
    data.setString(data.lastRowIndex(),"user",us);
    saveTable(data,"data/lista_de_libros.csv");
    
    println("texto guardado con Exito");
  }
  
  void guardardatos(){
    
     usinfo[0] = cp5.get(Textfield.class,("nombre")).getText();
     usinfo[1] = cp5.get(Textfield.class,("correo")).getText();
     usinfo[2] = cp5.get(Textfield.class,("telefono")).getText();
     saveStrings("data/users/"+ us +"/info.txt", usinfo);
     cp5.get(Button.class,"guardar").setColorBackground(color(#02B72A)).setColorActive(color(#017C1D));
     
     println("datos guardados con Exito");
     
  }
  void display(String usuario){
    
    cp5.get(Textfield.class,("usuario")).setVisible(false);
    cp5.get(Textfield.class,("contraseña")).setVisible(false);
    cp5.get(Bang.class,("ingresar")).setVisible(false);
    
    
    
    cp5.get(Accordion.class,"acordion2").setVisible(true);
    
    PImage imp = loadImage("data/users/" + usuario +"/imp.jpg");
    imp.resize(80,80);
    cp5.get(Bang.class,"imagenperfil").setImage(imp);
    
    cp5.get(Textlabel.class,"bienvenido").setText("Bienvenido(a) " + usuario).setVisible(true);
    
  
    
    
    cp5.get(Textfield.class,"nombre").setText(usinfo[0]);
    cp5.get(Textfield.class,"correo").setText(usinfo[1]);
    cp5.get(Textfield.class,"telefono").setText(usinfo[2]);
          
  }
  void gentx(){
    //ciclo generador de botones
  for(int i=0,k=0, y = 0, x=width/3;i<3;i++){
    for(int j=0;j<3;j++,k++){
      
      labels2 [index2] = cp5.addTextlabel("Text_b" + k)
           .setValue(index2)           
           .setPosition(x*j,y + width/4 -20)
           .setFont(createFont("arial",20))           
           .moveTo(g4)
           ;
           
    
      
      botones2[ index2 ] = cp5.addButton("Librob"+ (k+1))           
           .setValue(index2)
           
           .setPosition(x*j+10,y)
           .setFont(createFont("arial",20))
           .setSize(width/4 -20,width/4 -20)
           .moveTo(g4);
           ; 
       
         index2++;
       }
       y+=width/4+10;
     }
  
  // boton de pagina siguiente
  cp5.addButton("prev2")
     .setLabel("Pag. Anterior")
     .setValue(0)
     .setPosition(width/8, height - height/5)
     .setFont(createFont("arial",20))
     .setSize(200,25)
     .moveTo(g4)
     ;
  
  // boton de pagina anterior
  cp5.addButton("next2")
     .setValue(100)
     .setSize(200,25)
     .setPosition(width/8 * 5, height - height/5)     
     .setLabel("Pag. Siguiente")    
     .setFont(createFont("arial",20))
     .moveTo(g4)
     ;
  
  }
  void buscar2(String sr){
    
  text = new Table();
  text.addColumn("id");
  text.addColumn("name");
  text.addColumn("user");
  int j=0;
  
  for (TableRow row : data.matchRows(sr, "user")) {
    text.setString(j,"name",row.getString("name"));
    text.setString(j,"user",row.getString("user"));
    println(row.getString("name") + ": " + row.getString("user"));
    j++;
  }
  il = text.getRowCount();
  index2 = 0 ;
  if(v && index2<il){
    v = false;
    
    for(int i=0;i<9;i++,index2++){
      if(index2<il){
        PImage b1 = loadImage("data/users/"+text.getString(index2,"user")+"/"+text.getString(index2,"name")+"/book.png");
        b1.resize(width/4 -20,width/4 -20);
        PImage b2 = loadImage("data/users/"+text.getString(index2,"user")+"/"+text.getString(index2,"name")+"/book2.png");
        b2.resize(width/4 -20,width/4 -20);
        botones2[i].setImages(b1,b2,b1).setLabel(text.getString(index2,"name")).setValue(index2).setVisible(true);;
        labels2[i].setText(text.getString(index2,"name")).setVisible(true);
        println(i);
      }
      else {
        botones2[i].setVisible(false);
        labels2[i].setVisible(false);
      }
     
    }
    
    println(index);
    v = true;
   }
  
}
  
    
}