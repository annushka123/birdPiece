class SoloBird {

  //this array list stores a history of bird trails
  ArrayList<PVector> history = new ArrayList<PVector>();

  //v is the x and y coordinates of the thing the bird is following (mouseX, mouseY or bow);
  PVector v;
  //is this needed?

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  PVector plocation;

  float topspeed;
  float easing = 0.05;
  float speedX = 0.8;

  float rightY = -4;
  // headX and headY in relation to mouse or bow

  float a;
  float b;

  SoloBird() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
  }
//needs to be redone with new accel data data
  void update(float targetX, float targetY) {
    float aa = map(targetX, -256, 256, 0, 10);
    float bb = map(targetY, -256, 256, 0, 10);
    a = map(aa, 0, 10, 20, width-20);
    b = map(bb, 0, 10, 20, height-20);
    target = new PVector(a, b);
    
    PVector distance = PVector.sub(target, location);
    distance.mult(easing);
    location.add(distance);
    //PVector mouse = new PVector(a, b);
    //target.sub(location);
    //target.setMag(1.15);
    //acceleration = target;
println("targetX", a, "targetY", b);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

    //history.add(position.copy());
    v = new PVector(location.x, location.y);
    history.add(v);
    //int numPoints = int(map(accely, -0.5, 0.8, 2, 10));
    if(history.size() > 10) {
      history.remove(0);
    }

    rightY = rightY + speedX;

  }

  void display() {
    if(history.size() > 0) {
      //stroke(255);
      noFill();

      for (int i = 0; i < history.size(); i++) {

        PVector pos = history.get(i);

        float rlwing_y = pos.y - 15;
        float rwing_x = pos.x - 45;
        float rlwing_3 = pos.y + rightY;
        float lwing_x = pos.x + 45;

        stroke(255);
        //strokeWeight(1);
        //pushMatrix();
        float z = map(posz, -156, 156, -5, 30);
        //translate(40,30);
        bezier(pos.x + z, pos.y, pos.x + z, rlwing_y, rwing_x, rlwing_y, rwing_x, rlwing_3);
        bezier(pos.x + z, pos.y, pos.x + z, rlwing_y, lwing_x, rlwing_y, lwing_x, rlwing_3);
        //popMatrix();
      }
    }
  }

  void checkEdges() {
    if (rightY > 1.00 || rightY < -15.00) {
      speedX = speedX * -1;
    }
  }
}
