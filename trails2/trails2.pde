class Particle {

  //float gravity = 0.1;
  //float yspeed = 0.1;
  //int x;
  //int y;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  //ArrayList<PVector> history = new ArrayList<PVector>();
  ArrayList<PVector> history;
  PVector v;

  Particle(int tempx, int tempy) {

    location = new PVector(tempx, tempy);
    velocity = new PVector(0.5,0.5);
    acceleration = new PVector(0.1,0.1);
    mass = random(1, 0);
    history = new ArrayList<PVector>();
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
    
  }
  void update() {
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
  
  
    //y += yspeed;

    //yspeed += gravity;
    //println(yspeed+=gravity);
    //if (y > height) {
    //  y = height;
    //  yspeed *= -0.9;
    //}
    
    //x+= random(-5,5);
    //y+= random(-5,5);

    v = new PVector(location.x, location.y);
    history.add(v);
    history.size();
    if(history.size() > 25) {
      history.remove(0);
    }
    println("history:", history.size());
  }

  void show() {
    stroke(0);
    fill(0, 150);
    ellipse(location.x, location.y, 24*mass, 24*mass);
    
    for(int i = 0; i < history.size(); i++) {
      PVector pos = history.get(i);
      ellipse(pos.x, pos.y, 8, 8);
    
    }
  }
  
  void checkEdges() {
    if(location.x > width || location.x <0) {
      velocity.x = velocity.x* -1;
    }
        if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  
  }
}
