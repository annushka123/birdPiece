import oscP5.*;
import netP5.*;


Birds Onebird;
SoloBird flybird;
//Slider s;
Birds[] bird = new Birds[100];
ManyBirds[] birdFriends = new ManyBirds[50];
Drop[] drops = new Drop[50];

OscP5 oscP5;
OscP5 birdOSC;
NetAddress myRemoteLocation;


float posx;
float posy;
float posz;
float accelx;
float accely;
float accelz;

int sliderPot;
int fsrSense;
int button2;
int button3;
int button4;

float red;
float green;
float blue;

int diameter=10  ;
float circX;
float circY;

float linePX;
float linePY;
float lineX;
float lineY;

void setup() {
  size(1000, 1000);
  //size(800, 800, P3D);

  Onebird = new Birds();
  flybird = new SoloBird();

  for (int b = 0; b < bird.length; b++) {

    bird[b] = new Birds();
  }

  for (int i = 0; i < birdFriends.length; i ++ ) {
    birdFriends[i] = new ManyBirds();
  }

  oscP5 = new OscP5(this, 6002);
  birdOSC = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 5555);
  
  oscP5.plug(this, "posX", "/numsX");
  oscP5.plug(this, "posY", "/numsY");
  oscP5.plug(this, "posZ", "/numsZ");
  oscP5.plug(this, "accelX", "/accelX");
  oscP5.plug(this, "accelY", "/accelY");
  oscP5.plug(this, "accelZ", "/accelZ");
  oscP5.plug(this, "slider", "/slider");
  oscP5.plug(this, "fsr", "/fsr");
  oscP5.plug(this, "buttonTwo", "/buttonTwo");
  oscP5.plug(this, "buttonThree", "/buttonThree");
  oscP5.plug(this, "buttonFour", "/buttonFour");



}

void draw() {
  background(0);
  
  OscMessage message = new OscMessage("/wings");
  message.add(accely);
  
  oscP5.send(message, myRemoteLocation); // send the message to Max on port 1234
  
      //box code     
      //pushMatrix();
      //translate(width/2, height/2, 0);
      //noFill();
      //stroke(255);
      //rotateX(radians(posx));
      //rotateY(radians(posy));
      //rotateZ(radians(posz));
      //box(posx, posy, posz);
      //println("posy: ", posy);
      //println("posx: ", posx);
      //println("posz: ", posz);
      //popMatrix();
  
   flybird.update();
   flybird.checkEdges();
   flybird.display();
   if (button2 == 2) {



    int dropLength = int(map(fsrSense, 0, 450, 0, 100));
    for (int i=0; i<dropLength; i++) {

      bird[i].update();
      bird[i].checkEdges();
      bird[i].display();



    }

    int dropLength2 = int(map(fsrSense, 0, 450, 0, 50));
    for (int i=0; i<dropLength2; i++) {
      birdFriends[i].update();
      birdFriends[i].checkEdges();
      birdFriends[i].display();
    }

    Onebird.update();
    Onebird.checkEdges();
    Onebird.display();
    //int dropLength = int(map(fsrSense, 0, 450, 0, 50));

    //for(int i=0; i<dropLength; i++) {
    ////int i = int(map(fsrSense, 0, 450, 0, 50));
    //drops[i].display();
    //drops[i].rainbow();

    //}
  }

  if (button4 == 4) {
    println(4);

    background(0);
  }
}

public void posX(float numsX) {

  posx = numsX;

  if (posx > 200 && posx < 250) {

    circX = map(posx, 230, 250, 10, width-10);
  } else if (posx <200 && posx > 280) {

    circX = map(posx, 100, 400, width/2-10, width/2+10);
  }
  lineX = map(posx, 100, 350, 0, width);
}

public void posY(float numsY) {

  posy = numsY;

  if (posy > -60 && posy <60) {
    circY = map(posy, -60, 60, 0, height);
  }


  lineY = map(posy, -40, 40, 0, height);
}

public void posZ(float numsZ) {

  posz = numsZ;
  diameter = int(map(posz, -100, 100, 10, 50));
}

public void accelX(float accelX) {

  accelx = accelX;
}

public void accelY(float accelY) {

  accely = accelY;
}

public void accelZ(float accelZ) {

  accelz = accelZ;
}

public void slider(int slider) {

  sliderPot = slider;

  //println("slider: ", sliderPot);

  if (sliderPot < 400) {

    red = map(sliderPot, 0, 400, 0, 255);

    //println("red: ", red);
  } else if (sliderPot < 800) {

    green = map(sliderPot, 400, 800, 0, 255);

    //println("green: ", green);
  } else {
    blue = map(sliderPot, 800, 1000, 0, 255);

    //println("blue: ", blue);
  }
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
