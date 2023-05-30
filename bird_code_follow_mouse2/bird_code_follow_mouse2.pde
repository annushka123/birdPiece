class SoloBird {

  //this array list stores a history of bird trails
  ArrayList<PVector> history = new ArrayList<PVector>();

  //v is the x and y coordinates of the thing the bird is following (mouseX, mouseY or bow);
  PVector v;
  //is this needed?
  PVector position;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;

  float topspeed;

  float speedX=0.8;

  float rightY = -4;
  // headX and headY in relation to mouse or bow
  
  float a;
  float b;




  SoloBird(float x, float y) {

    
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update(float targetX, float targetY) {
    float aa = map(targetX, -256, 256, 0, 10);
    float bb = map(targetY, -256, 256, 0, 10);
    a = map(aa, 0, 10, 20, width-20);
    b = map(bb, 0, 10, 20, height-20);
    target = new PVector(a, b);
    //PVector mouse = new PVector(a, b);
    //mouse.sub(location);
    //mouse.setMag(1.15);
    //acceleration=mouse;

    v = new PVector(a, b);
    history.add(v);
    history.size();
    
    int nums = int(map(accely, -0.18, 0.8, 2, 10));
    if (history.size() > nums) {
      
      println("nums",nums);
      history.indexOf(v);
      history.remove(0);
      
    
    }
    
      rightY = rightY+speedX;
      
    }

  void display() {

    //stroke(255);
    noFill();

    for (int i = 0; i < history.size(); i++) {

      PVector pos = history.get(i);
      
      float rlwing_y = pos.y-15;
      float rwing_x = pos.x-45;
      float rlwing_3 = pos.y+rightY;
      float lwing_x = pos.x+45;
      
      
     if (i == 1) {
      stroke(255,0,100);

      bezier(pos.x, pos.y, pos.x, rlwing_y+2, rwing_x+2, rlwing_y+2, rwing_x+2, rlwing_3);
      bezier(pos.x, pos.y, pos.x, rlwing_y+2, lwing_x-2, rlwing_y+2, lwing_x-2, rlwing_3);


    } else if (i == 2) {
      stroke(0,200,100);
      bezier(pos.x, pos.y, pos.x, rlwing_y+4, rwing_x+4, rlwing_y+4, rwing_x+4, rlwing_3);
      bezier(pos.x, pos.y, pos.x, rlwing_y+4, lwing_x-4, rlwing_y+4, lwing_x-4, rlwing_3);
      
    }
      stroke(255);
      //strokeWeight(1);
      //pushMatrix();
      float z = map(posz, -156, 156, -5, 30);
      //translate(40,30);
      bezier(pos.x+z, pos.y, pos.x+z, rlwing_y, rwing_x, rlwing_y, rwing_x, rlwing_3);
      bezier(pos.x+z, pos.y, pos.x+z, rlwing_y, lwing_x, rlwing_y, lwing_x, rlwing_3);
      //popMatrix();
    }


      
    

    
  }


  //popMatrix();



  void checkEdges() {


    if (rightY > 1.00 || rightY < -15.00) {
      speedX = speedX*-1;
    }
    
    
  }
}
