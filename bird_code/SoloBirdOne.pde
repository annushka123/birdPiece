class SoloBird {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float topspeed;

  
  float birdx;
  float birdy;
  
  float speedX=0.5;
  
  float speedY = 1;
  float headX = 10;
  float headX2 = headX-45;
  float headX3 = headX + 45;
  float headY = 10;
  float headY2 = headY-15;
  float rightY = headY-4;
  
  SoloBird() {

    birdx = mouseX;
    birdy = mouseY;
    //location = new PVector(posx, posy);
    //velocity = new PVector(0, 0);
    //acceleration = new PVector(-0.001, 0.01);
    //topspeed = 7;
  }

  void update() {

    //birdx;
    //birdy;
    //PVector bow = new PVector(posx, posy);

    //PVector dir = PVector.sub(bow, location);

    //dir.normalize();

    //dir.mult(0.3);

    //acceleration = dir;

    //velocity.add(acceleration);
    //velocity.limit(topspeed);
    //location.add(velocity);
    //speedX=map(accely, -1, 1, -1, 1);
    
//wing movement
    rightY = rightY+speedX;
    
    
  }

  void display() {

    stroke(255);
    noFill();
    pushMatrix();
    translate(mouseX, mouseY);

//bird drawing
    bezier(headX, headY, headX, headY2, headX2, headY2, headX2, rightY);
    bezier(headX, headY, headX, headY2, headX3, headY2, headX3, rightY);
    
   

    popMatrix();
  }


  void checkEdges() {
    //wing movement
    if (rightY > 1.00 || rightY < -15.00) {
      speedX = speedX*-1;
      println("rightY: ", rightY);
    }
     //rightY = rightY+speedX;


    //if ((location.x > width) || (location.x < 0) ) {
    //  velocity.x = velocity.x * -1;
    //} 
    
    //if ((location.y > height) || (location.y < 0)) {
    //  velocity.y = velocity.y * -1;
    //}

    //if (location.y > height) {
    //  location.y = 0;
    //} else if (location.y < 0) {
    //  location.y = height;
    //}
  }
}
