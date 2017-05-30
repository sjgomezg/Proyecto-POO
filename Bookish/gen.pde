void gen(){
//pestañas
  cp5.getTab("default")
     .setSize(70,15)
     .activateEvent(true)
     .setLabel("Busqueda")
     .setId(1)
     ;
     
  cp5.addTab("login")
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
     .setSize(70,15)
     .activateEvent(true)
     .setId(2)     
     ;    
 
//elementos pestaña general
  //barra de busqueda
   cp5.addTextfield("searchbar")
     .setLabel("")
     .setPosition(0,height/40 + 10)
     .setSize((width*6)/8,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     ;
     
   //boton de busqueda
  cp5.addBang("sumit")
     .setValue(100)
     .setLabel("")
     .setPosition(width/8 * 6,height/40 +10)
     .setFont(createFont("arial",20))
     .setSize(40,40)
     ;
    
   cp5.addTextarea("text")
                  .setPosition(width/100,width/20*13)
                  .setSize(width/3,200)
                  .setFont(createFont("arial",18))
                  .setLineHeight(15)
                  .setColor(color(#F78D00))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100))
                  .setVisible(false)
                  .setText("Descripcion del texto")
                  ;
   
   //elementos seccion ofertar
   cp5.addTextfield("ofertador")
     .setLabel("Nombre")
     .setPosition(width/2,height/10 * 3)
     .setSize(width/2-40,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setVisible(false)
     ;
     
   cp5.addTextfield("ofcorreo")
     .setLabel("Correo")
     .setPosition(width/2,height/10 * 4)
     .setSize(width/2-40,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setVisible(false)
     ;
     
   cp5.addTextfield("oftelefono")
     .setLabel("telefono")
     .setPosition(width/2,height/10*5)
     .setSize(width/2 -40,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setVisible(false)
     ;
   cp5.addTextfield("ofmensaje")
     .setLabel("Mensaje")
     .setPosition(width/2,height/10 * 6)
     .setSize(width/2-40,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setVisible(false)
     ;
     
   cp5.addTextlabel("ofertar")
     .setText("OFERTAR")
     .setPosition(width/2,height/10 * 2)
     .setSize(width/2-40,40)
     .setFont(createFont("arial",40))
     .setVisible(false)
     ;  
     
   cp5.addButton("enviar")
     .setLabel("enviar oferta")
     .setPosition(width/2,height/10 * 7)
     .setSize(width/2-40,40)
     .setFont(createFont("arial",30))
     .setVisible(false)
     ; 
   
   
   
   //grupo 1 acordeon
   Group g1 = cp5.addGroup("resultados")
                .setLabel("Resultados")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(height)
                ;
                
  
                
  //ciclo generador de botones
  for(int i=0,k=0, y = 0, x=width/3;i<3;i++){
    for(int j=0;j<3;j++,k++){
      labels [index] = cp5.addTextlabel("Text_" + k)
           .setValue(index)
           .setText(general.getString(index,"name"))
           .setPosition(x*j,y + width/4 -20)
           .setFont(createFont("arial",20))
           .setLetterSpacing(5) 
           .moveTo(g1)
           ;
      PImage b1 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book.png");
      b1.resize(width/4 -20,width/4 -20);
      PImage b2 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book2.png");
      b2.resize(width/4 -20,width/4 -20);
      botones[ index ] = cp5.addButton("Libro"+ (k+1))
           .setLabel(general.getString(index,"name"))
           .setValue(index)
           .setImages(b1,b2,b1)
           .setPosition(x*j+10,y)
           .setFont(createFont("arial",20))
           .setSize(width/4 -20,width/4 -20)
           .moveTo(g1);
           ; 
       
         index++;
       }
       y+=width/4+10;
     }
  
  // boton de pagina siguiente
  cp5.addButton("prev")
     .setLabel("Pag. Anterior")
     .setValue(0)
     .setPosition(width/8, height - height/5)
     .setFont(createFont("arial",20))
     .setSize(200,25)
     .moveTo(g1)
     ;
  
  // boton de pagina anterior
  cp5.addButton("next")
     .setValue(100)
     .setSize(200,25)
     .setPosition(width/8 * 5, height - height/5)     
     .setLabel("Pag. Siguiente")    
     .setFont(createFont("arial",20))
     .moveTo(g1)
     ;
  
  accordion = cp5.addAccordion("acordion1")
    .setPosition(0,height/10)
    .setWidth(width)
    
    .addItem(g1)
    .open(1)
    ;
  
//elementos pestaña login
  cp5.addTextlabel("bienvenido")           
           .setPosition(0,height/20)
           .setFont(createFont("arial",20))
           .setVisible(false)
           .moveTo("login")
           ;
  
  cp5.addTextfield("usuario")
     .setLabel("Usuario")
     .setPosition(width/3,height/10 * 2)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     .moveTo("login")
     ;
     
  cp5.addTextfield("contraseña")
     .setLabel("Contraseña")
     .setPosition(width/3,height/10 * 4)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     .moveTo("login")
     ;
  
  cp5.addBang("ingresar")
     .setValue(100)
     .setLabel("Ingresar")
     .setPosition(width/3,height/10 * 6)
     .setFont(createFont("arial",20))
     .setSize(80,40)
     .moveTo("login")
     ;
    
     
  Group g3 = cp5.addGroup("miperfil")
                .setLabel("Mi Perfil")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(height - height/10 *2)
                ;
                
  cp5.addBang("imagenperfil")
      .setLabel("Imagen de perfil")
      .setPosition(width/20,height/20)
      .setSize(80,80)
      .moveTo(g3)
      ;
      
  cp5.addTextfield("nombre")
     .setLabel("Nombre")
     .setPosition(width/20 * 4,height/20)
     .setSize(width/2,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .moveTo(g3)
     ;
  
  cp5.addTextfield("correo")
     .setLabel("Correo")
     .setPosition(width/20 * 4,height/20 * 3)
     .setSize(width/2,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .moveTo(g3)
     ;
  
  cp5.addTextfield("telefono")
     .setLabel("Telefono")
     .setPosition(width/20 * 4,height/20 *5)
     .setSize(width/2,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .moveTo(g3)
     ;
     
  cp5.addButton("guardar")
      .setLabel("Guardar")
      .setPosition(width/20 * 11,height/20 * 8)
      .setSize(80,30)
      .setFont(createFont("arial",15))
      .moveTo(g3)
      ;
                
  g4 = cp5.addGroup("mislibros")
                .setLabel("Mis Libros")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(height - height/10 *2)
                ;
                
                  
  g5 = cp5.addGroup("agregartexto")
                .setLabel("Agregar Texto")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(height - height/10 *2)
                ;   
                
  cp5.addTextfield("titulo")
     .setLabel("titulo")
     .setPosition((width/3)/3,height/20 * 3)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     .moveTo(g5)
     ;
     
  cp5.addTextfield("autor")
     .setLabel("autor")
     .setPosition((width/3)/3 * 2 + width/4 ,height/20 * 3)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     .moveTo(g5)
     ;
     
  cp5.addTextfield("publicacion")
     .setLabel("publicacion")
     .setPosition((width/3)/3,height/20 * 5)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .moveTo(g5)
     ;
     
  cp5.addTextfield("tipo")
     .setLabel("tipo")
     .setPosition((width/3)/3 * 2 + width/4,height/20 * 5)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     .moveTo(g5)
     ;
   cp5.addTextfield("descripciondeltexto")
     .setLabel("Descripcion del texto")
     .setPosition((width/3)/3,height/20 * 7)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .setAutoClear(true)
     .moveTo(g5)
     ;
  
  cp5.addTextfield("img1")
     .setLabel("Foto 1")
     .setPosition((width/3)/3,height/20 * 9)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .moveTo(g5)
     ;
  
  cp5.addButton("bimg1")
     .setValue(100)
     .setLabel("...")
     .setPosition((width/3)/3 + width/4,height/20 * 9)
     .setFont(createFont("arial",20))
     .setSize(40,40)
     .moveTo(g5)
     ;
     
  
  cp5.addTextfield("img2")
     .setLabel("Foto 2")
     .setPosition((width/3)/3 * 2 + width/4,height/20 * 9)
     .setSize(width/4,40)
     .setFont(createFont("arial",20))
     .moveTo(g5)
     ;

  cp5.addButton("bimg2")
     .setValue(100)
     .setLabel("...")
     .setPosition((width/3)/3 * 2 + (width/4*2),height/20 * 9)
     .setFont(createFont("arial",20))
     .setSize(40,40)
     .moveTo(g5)
     ;
     
  cp5.addButton("agregar")
     .setValue(100)
     .setLabel("agregar")
     .setPosition((width/3)/3,height/10 * 7)
     .setFont(createFont("arial",20))
     .setSize(100,40)
     .moveTo(g5)
     ;
  
                
  accordion2 = cp5.addAccordion("acordion2")
    .setPosition(0,height/10)
    .setWidth(width)
    .addItem(g3)
    .addItem(g5)
    .addItem(g4)
    .moveTo("login")
    .setVisible(false)
    .open(0)
    ;
 
   v=true;
}