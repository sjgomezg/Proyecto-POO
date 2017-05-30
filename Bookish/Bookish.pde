import java.util.Map;
import controlP5.*;

int z, index = 0;
int iu; //index lista de usuarios

Table data;
Table userdata;
Table temp; //tabla temporal para la busqueda

Table general;//tabla general  

boolean v = false;
boolean v2=false;

String searchtext;

HashMap<String,String> users = new HashMap<String,String>();


PImage bkg;//imagen de fondo

Book book;
User user;


Group g4, g5;

ControlP5 cp5;
Accordion accordion;
Accordion accordion2;


Button botones[] = new Button[ 9 ];
Textlabel labels[] = new Textlabel[ 9 ];

Button botones2[] = new Button[ 9 ];
Textlabel labels2[] = new Textlabel[ 9 ];

void setup(){
  size(700,720);
  general = new Table();
  
  userdata = loadTable("data/lista_de_usuarios.csv", "header");
  iu = userdata.getRowCount();
  for(int i=0;i<iu;i++){
   users.put(userdata.getString(i,"usuario"),userdata.getString(i,"password"));     
  }  
  data = loadTable("data/lista_de_libros.csv", "header");
  general = data;
  z = general.getRowCount();
  println(z);  
  bkg = loadImage("resources/background.jpg");
  bkg.resize(width,height);
  
  book = new Book();
  user = new User();
  
  cp5 = new ControlP5(this);
  gen();
}

void draw(){
  background(bkg);
  if(v2){
    book.display();
  }
  else book.display("Bookish");
}

void buscar(String sr){
    
  temp = new Table();
  temp.addColumn("id");
  temp.addColumn("name");
  temp.addColumn("user");
  int j=0;
  
  for (TableRow row : data.matchRows(sr+".*", "name")) {
    temp.setString(j,"name",row.getString("name"));
    temp.setString(j,"user",row.getString("user"));
    println(row.getString("name") + ": " + row.getString("user"));
    j++;
  }
  z = temp.getRowCount();
  index = 0 ;
  if(v && index<z){
    v = false;
    
    for(int i=0;i<9;i++,index++){
      if(index<z){
        PImage b1 = loadImage("data/users/"+temp.getString(index,"user")+"/"+temp.getString(index,"name")+"/book.png");
        b1.resize(width/4 -20,width/4 -20);
        PImage b2 = loadImage("data/users/"+temp.getString(index,"user")+"/"+temp.getString(index,"name")+"/book2.png");
        b2.resize(width/4 -20,width/4 -20);
        botones[i].setImages(b1,b2,b1).setLabel(temp.getString(index,"name")).setValue(index).setVisible(true);;
        labels[i].setText(temp.getString(index,"name")).setVisible(true);
        println(i);
      }
      else {
        botones[i].setVisible(false);
        labels[i].setVisible(false);
      }
      general = temp;
    }
    accordion.open(0);
    println(index);
    v = true;
   }
  
}