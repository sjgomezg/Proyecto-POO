class Book{
  
  String datoslibro[];
  PImage b1, b2;
  String us;
  
  void cargar(String user, String book){
    print(book);
    datoslibro = loadStrings("data/users/" + user + "/" + book + "/info.txt");
    printArray(datoslibro);
    b1 = loadImage("data/users/" + user + "/" + book + "/book.png");
    b1.resize(width/4 -20,width/4 -20);
    b2 = loadImage("data/users/" + user + "/" + book + "/book2.png");
    b2.resize(width/4 -20,width/4 -20);
    us = user;
  }
  void display(){
    fill(230);
    rect(width/100,height/7,width/4 -20,width/4 -20,10);
    fill(#F78D00);
    image(b1,width/100,height/7);   
    image(b2,width/100,height/7);   
    textSize(18); 
    for(int i=0, y = width/20*9;i<4;i++,y+=40){
      text(datoslibro[i],width/100,y);
    }
    cp5.get(Textarea.class,"text").setText(datoslibro[4]);
    
    cp5.get(Textfield.class,"ofertador").setVisible(true);
    cp5.get(Textfield.class,"oftelefono").setVisible(true);
    cp5.get(Textfield.class,"ofmensaje").setVisible(true);
    cp5.get(Textfield.class,"ofcorreo").setVisible(true);
    cp5.get(Textlabel.class,"ofertar").setVisible(true);
    cp5.get(Button.class,"enviar").setVisible(true);
    cp5.get(Textarea.class,"text").setVisible(true);
    
  }
  void cargar(){
    b1 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book.png");
    b1.resize(width/4 -20,width/4 -20);
    b2 = loadImage("data/users/"+general.getString(index,"user")+"/"+general.getString(index,"name")+"/book.png");
    b2.resize(width/4 -20,width/4 -20);
  }
  void display(String wm){
    fill(0);
    textSize(40);
    text(wm,width/4,height/2);
    cp5.get(Textfield.class,"ofertador").setVisible(false);
    cp5.get(Textfield.class,"oftelefono").setVisible(false);
    cp5.get(Textfield.class,"ofmensaje").setVisible(false);
    cp5.get(Textfield.class,"ofcorreo").setVisible(false);
    cp5.get(Textlabel.class,"ofertar").setVisible(false);
    cp5.get(Button.class,"enviar").setVisible(false);
    cp5.get(Textarea.class,"text").setVisible(false);
  }
  String getUserBook(){
    return us;
  }
   
}