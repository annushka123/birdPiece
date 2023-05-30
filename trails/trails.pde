class Particle {

  //float gravity = 0.1;
  //float yspeed = 0.1;
  int x;
  int y;
  float speedX = 0.5;
  float movex = 1;
  float movey = 1;
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
    
    //x+= random(-5,5);
    //y+= random(-5,5);
    x = mouseX;
    y = mouseY;

    v = new PVector(x, y);
    history.add(v);
    history.size();
    if(history.size() > 25) {
    history.remove(0);
    }
    println("history:", history.size());
    movex=movex+speedX;
    movey=movey+speedX;
    println("movex: ", movex);
  }

  void show() {
    stroke(0);
    fill(0, 150);
    ellipse(x, y, movex, movey);
    
    
    pushMatrix();
    translate(width/2, height/2);
    for(int i = 0; i < history.size(); i++) {
      PVector pos = history.get(i);
      ellipse(pos.x, pos.y, movex , movey);
    
  }
  popMatrix();
  }
  
    void checkEdges() {
    //wing movement
    if (movex > 25.00 || movex < 1 ) {
      speedX = speedX*-1;
      
    }
    else if (movey > 25.00 || movey < 1) {
      speedX = speedX*-1;
    }
    }

}
