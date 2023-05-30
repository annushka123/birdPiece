class Birds {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed;
  
  Birds() {
    
    float locx = map(accelx, -0.30, 2.8, 0, width);
    float locy = map(accely, -0.1, 1.5, 0, height);
   
    location = new PVector(locx, locy);
    velocity = new PVector(0,0);
    //acceleration = new PVector(-0.001, 0.01);
    topspeed = 10;
    
    
  }
  
  void update() {
    
    float bowx = map(posx, 200, 300, 20, width-20);
    float bowy = map(posy, 200, -150, 0, height);
    
    
    PVector bow = new PVector(bowx, bowy);
    
    PVector dir = PVector.sub(bow, location);
    
    dir.normalize();
    
    dir.mult(0.5);
    
    acceleration = dir;
   
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
  }
  
  void display() {
   
    stroke(0);
    fill(red, green, blue, 220);
    ellipse(location.x, location.y, diameter*1.5, diameter+20);
    
  }
  
 
    void checkEdges() {
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
