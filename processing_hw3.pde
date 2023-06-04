import oscP5.*;
import netP5.*;


float yoff = 0;        
float xoffIncrement = 0.05;  
float yoffIncrement = 0.05;  
int level1 = 150;
int level2 = 250;
float x=0.00;
PFont f;
OscP5 oscP5;



void setup() {
  size(1000, 700);
  
  // Initialize the OSC object
  oscP5 = new OscP5(this, 12000);
  
  
   // Create the font
  //printArray(PFont.list());
  f = createFont("AppleSDGothicNeo-Thin", 32);
  textFont(f);
}


void oscEvent(OscMessage msg) {
  if(msg.checkAddrPattern("/play")==true) { 
    if (msg.checkTypetag("f")) { // Check if the message contains a single float value
      x = msg.get(0).floatValue(); // Get the float value from the message
      print(x);
    }
  }
  if(msg.checkAddrPattern("/stop")==true) { // If the sound is stopped
     x=0.00;
  }
}

void draw() {
  background(135, 206, 235);

  if(x==440.00){
      level1= 150;
      level2= 250;
  }else if(x==466.16){
      level1= 180;
      level2= 280;
  }else if(x==493.88){
      level1= 210;
      level2= 310;
  }else if(x==523.25){
      level1= 240;
      level2= 340;
  }else if(x==554.37){
      level1= 270;
      level2= 370;
  }else if(x==587.33){
      level1= 300;
      level2= 400;
  }else if(x==622.25){
      level1= 330;
      level2= 430;
  }else if(x==659.25){
      level1= 360;
      level2= 460;
  }else if(x==698.46){
      level1= 390;
      level2= 490;
  }else if(x==739.99){
      level1= 420;
      level2= 520;
  }else if(x==783.99){
      level1= 450;
      level2= 550;
  }else if(x==830.61){
      level1= 480;
      level2= 580;
  }else if(x==880.00){
      level1= 510;
      level2= 610;
  }
  
  if(x==0.00){
    level1=550;
    level2=650;
    xoffIncrement=0.007;
    yoffIncrement=0.007;
    fill(250);
    textAlign(CENTER, CENTER);
    text("PRESS THE BUTTON TO PLAY THE SOUND", width/3, height/12);
    fill(220);
    circle(width/1.3, height/12, 30);
    fill(250);
    textAlign(CENTER, CENTER);
    text("OFF", width/1.2, height/12);
  }else{
    xoffIncrement = 0.05;
    yoffIncrement = 0.05;
    fill(250);
    textAlign(CENTER, CENTER);
    text("THE SOUND IS PLAYING", width/3, height/12);
    fill(0, 255, 0);
    circle(width/1.3, height/12, 30);
    fill(250);
    textAlign(CENTER, CENTER);
    text("ON", width/1.2, height/12);
  }
  
  noStroke();
  fill(0, 150, 255);
  beginShape(); 
  
  float xoff = 0;       
  
  
  for (float xcord = 0; xcord <= width; xcord += 10) {
    
    float ycord = map(noise(xoff, yoff), 0, 1, level1, level2);
   
    vertex(xcord, ycord); 
    xoff += xoffIncrement;
  }
 
  yoff += yoffIncrement;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}
