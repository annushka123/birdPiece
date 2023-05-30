class Particle {

  //float gravity = 0.1;
  //float yspeed = 0.1;
  int x;
  int y;
  ArrayList<PVector> history = new ArrayList<PVector>();
  PVector v;

  Particle(int tempx, int tempy) {

    x = tempx;
    y = tempy;
  }

  void update() {

    //y += yspeed;

    //yspeed += gravity;
    //println(yspeed+=gravity);
    //if (y > height) {
    //  y = height;
    //  yspeed *= -0.9;
    //}
    
    x+= random(-5,5);
    y+= random(-5,5);

    v = new PVector(x, y);
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
    ellipse(x, y, 24, 24);
    
    for(int i = 0; i < history.size(); i++) {
      PVector pos = history.get(i);
      ellipse(pos.x, pos.y, 8, 8);
    
  }
  }
  

}
