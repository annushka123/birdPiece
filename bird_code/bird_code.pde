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

int sliderPot;
int fsrSense;
int button2;
int button3;
int button4;
int diameter;

float red;
float green;
float blue;

void setup() {
  size(400, 400);

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
  
}

void draw() {

  background(0);

  OscMessage message = new OscMessage("/wings");
  message.add(mouseY);
  soloBirdOSC.send(message, myRemoteBirdLocation);

  bird.update();
  bird.checkEdges();
  bird.display();
  
  //lines.display();
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
