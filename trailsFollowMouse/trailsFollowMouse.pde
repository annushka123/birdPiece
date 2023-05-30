class Particle {

  //float gravity = 0.1;
  //float yspeed = 0.1;
  PVector location;
  PVector velocity;
  PVector acceleration;
  ArrayList<PVector> history = new ArrayList<PVector>();
  PVector v;
  
  Particle() {

    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  void update() {

    //y += yspeed;

    //yspeed += gravity;
    //println(yspeed+=gravity);
    //if (y > height) {
    //  y = height;
    //  yspeed *= -0.9;
    //}
    
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    mouse.setMag(0.1);
    acceleration=mouse;

    v = new PVector(mouseX, mouseY);
    history.add(v);
    history.size();
    if(history.size() > 15) {
    history.remove(0);
    }
    
  }

  void show() {
    stroke(2);
    fill(0, 150);
    //ellipse(location.x, location.y, 24, 24);
    
    for(int i = 0; i < history.size(); i++) {
      int s = 20;
      PVector pos = history.get(i);
      ellipse(pos.x, pos.y, s, s);
      
      
  }
  }
  

}
