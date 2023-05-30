class SoloBird {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed;
  
  float speedX = accelx+0.5;
  float speedY = 1;
  float headX = 0;
  float headX2 = headX-40;
  float headX3 = headX + 40;
  float headY = 0;
  float headY2 = headY-22;
  float rightY = headY-8;
  
  SoloBird() {
    
    float locx = map(accelx, 0.1, 1.5, 20, width);
    float locy = map(accely, -0.7, 1.2, 20, height-20);
   
    location = new PVector(locx, locy);
    //println("locX: ", location);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001, 0.01);
    topspeed = 7;
    
    
  }
  
  void update() {
    
    float bowx = map(posx, 130, 300, 20, width-20);
    float bowy = map(posy, 150, -300, 0, height);
    
    
    PVector bow = new PVector(bowx, bowy);
    
    PVector dir = PVector.sub(bow, location);
    
    dir.normalize();
    
    dir.mult(0.3);
    
    acceleration = dir;
   
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
     rightY = rightY+speedX;
  //rightY++;
  
    
  }
  
  void display() {
   
    stroke(255);
    noFill();
    pushMatrix();
    translate(location.x, location.y);
    
    //fill(red, green, blue, 220);
    //ellipse(location.x, location.y, diameter*1.5, diameter+20);
   bezier(headX, headY, headX, headY2, headX2, headY2, headX2, rightY);
   bezier(headX, headY, headX, headY2, headX3, headY2, headX3, rightY);

  //OscMessage message = new OscMessage("/wings");
  //message.add(rightY);
  //println("wings: ", rightY);
  //oscP5.send(message, myRemoteLocation); // send the message to Max on port 1234
     popMatrix();

  }
  
 
    void checkEdges() {
  if (rightY > 3 || rightY < -10 ) {
   println(rightY);
    speedX = speedX*-1;
  }
  

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  
  
  
  
}
}
