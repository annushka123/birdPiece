import oscP5.*;
import netP5.*;

//bird class
SoloBird bird;
FlowingLines lines;

OscP5 oscP5;
OscP5 soloBirdOSC;
NetAddress myRemoteBirdLocation;

float posx;
float posy;
float posz;
float accelx;
float accely;
float accelz;
float paccelx;


int sliderPot;
int fsrSense;
int button2;
int button3;
int button4;
int diameter;
float audioIn;

float red;
float green;
float blue;

float pxS;
float pyS;
float px;
float py;
float pxFS;
float pyFS;
float pxU;
float pxL;
float pxUS;
float pxLS;

   float upper_zero;
  float lower_zero; 
 ArrayList<Float>accelxList = new ArrayList<Float>();
 
float d;
float zero;
float nums=0;

void setup() {
  size(400, 400);


  //  if(zero>-0.8 && zero<0.4) {
    
  //px = map(accelx, -0.9, 1.15, 0.01, 0.02);
  //py = map(accely, -0.95, 0.48, 0.01, 0.04);
  //println("slow");


  // }
  

  //upper_zero = zero + paccelx/2;
  //lower_zero = zero - paccelx/2;
   
   if(nums>0){
         //px = map(accelx, -0.35, 1.43, 0.01, 0.9);
         //py = map(accely, -1.24, -0.33, 0.05, 2.8);

         println("slow");
//     pxFS = px;
//    pyFS = py;
  px = map(accelx, -0.9, 1.15, 0.01, 0.2);
  py = map(accely, -0.95, 0.48, 0.01, 0.4);
   }


  bird = new SoloBird();
  lines = new FlowingLines();

  oscP5 = new OscP5(this, 6001);
  soloBirdOSC = new OscP5(this, 12001);
  myRemoteBirdLocation = new NetAddress("127.0.0.1", 1111);

  oscP5.plug(this, "PosX", "/numsX");
  oscP5.plug(this, "PosY", "/numsY");
  oscP5.plug(this, "PosZ", "/numsZ");
  oscP5.plug(this, "AccelX", "/accelX");
  oscP5.plug(this, "AccelY", "/accelY");
  oscP5.plug(this, "AccelZ", "/accelZ");
  oscP5.plug(this, "Slider", "/slider");
  oscP5.plug(this, "Fsr", "/fsr");
  oscP5.plug(this, "buttonTwo", "/buttonTwo");
  oscP5.plug(this, "buttonThree", "/buttonThree");
  oscP5.plug(this, "buttonFour", "/buttonFour");
  oscP5.plug(this, "Sound", "/sound");
}

void draw() {

  background(0);



 

  //upper_zero = zero + paccelx/2;
  //lower_zero = zero - paccelx/2; 
  
  //println(upper_zero-lower_zero);
  


  pxU = accelx+0.89;
  pxL = accelx-0.89;
  pxUS = accelx+0.35;
  pxLS = accelx-0.35;
//  println("accelx :",accelx);
//  println("pxLS :", pxLS);
//  println("pxUS :",pxUS);
//println("pxL :", pxL);
//  println("pxU :",pxU);
  OscMessage message = new OscMessage("/wings");
  message.add(mouseY);
  soloBirdOSC.send(message, myRemoteBirdLocation);



  bird.update(200, 300);
  bird.checkEdges();
  bird.display();

  //lines.display();
}

//float accelxValues(float upper_zero, float lower_zero) {
  
//  upper_zero = zero + paccelx/2;
//  lower_zero = zero - paccelx/2; 
  
//  return upper_zero;
//  return lower_zero;
  
//}
public void Sound(float sound) {

  //sound to neoPixel

  audioIn = sound;
}

public void PosX(float numsX) {

  posx = numsX;
}

public void PosY(float numsY) {

  posy = numsY;
}

public void PosZ(float numsZ) {

  posz = numsZ;
}

public void AccelX(float accelX) {

  accelx = accelX;
}

public void AccelY(float accelY) {

  accely = accelY;
}


public void fsr(int fsr) {

  fsrSense = fsr;

  diameter = int(map(fsrSense, 0, 400, 10, 50));
}

public void buttonTwo(int buttonTwo) {

  button2 = buttonTwo;
}

public void buttonThree(int buttonThree) {

  button3 = buttonThree;
}

public void buttonFour(int buttonFour) {

  button4 = buttonFour;
}
