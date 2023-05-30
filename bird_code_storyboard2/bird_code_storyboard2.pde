class SoloBird {

  //this array list stores a history of bird trails
  ArrayList<PVector> history = new ArrayList<PVector>();
  //ArrayList<PVector> randomLocs = new ArrayList<PVector>();

  //v is the x and y coordinates of the thing the bird is following (mouseX, mouseY or bow);
  PVector v;
  //is this needed?

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  PVector randLocs;

  //this instead of speedX
  PVector wingaccel;
  PVector bowaccel;
  PVector bow;

  float app;
  float topspeed= 2;
  float easing = 0.01;
  float paccelx;

  //posx is location
  //accelx is acceleration

  //speedX is time(velocity)
  float speedX= 0.8;

  //position of the wings
  float rightY;
  PVector wingSpan;
  // headX and headY in relation to mouse or bow

  float a;
  float b;



  SoloBird() {

    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    wingaccel = new PVector(0,0);
    wingSpan = new PVector(0, 0);
        //acceleration
    bowaccel = new PVector(0,0);

  }

  void update(float targetX, float targetY) {
 

    target = new PVector(targetX, targetY);


    //println("randLocs: ", randLocs.x, randLocs.y);

    PVector distance = PVector.sub(target, location);
    distance.mult(easing);
    location.add(distance);
    //println("targetX", a, "targetY", b);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

    //history.add(position.copy());
    v = new PVector(location.x, location.y);
    history.add(v);
    //int numPoints = int(map(accely, -0.5, 0.8, 2, 10));
    if (history.size() > 5) {
      history.remove(0);
    }


    ////need to rewrite this
    //PVector pmouse = new PVector(pmouseX, pmouseY);

    ////PVector mouse = new PVector(accelx*0.3, accelx*0.2);
    //PVector mouse = new PVector(mouseX, mouseY);
    //mouse.sub(pmouse);

    //mouse.mult(accelx);
    
    
    float px = map(accelx, -1.5, 1.5, 0.01, 0.5);
    float py = map(accely, -1.5, 1.5, -0.01, -0.5);

    //bowaccel.x=0.7;
    //bowaccel.y=-0.02;


    float psx = map(posx, -32, 32, -0.7, 0.7);
    float psy = map(posy, -32, 32, -0.7, 0.7);

    //location
    bow = new PVector(psx, psy);



    bow.mult(bowaccel.x);
    println("bow: ", bow);


    //PVector nbow = PVector.add(wingaccel, mouse);
    //nbow.mult(1.5);

    //wingaccel.add(bowaccel);
    println("wingaccel: ", wingaccel);

    //wingaccel.limit(7);
    
    wingaccel = PVector.random2D();
    
    wingSpan.add(wingaccel);
    //wingaccel.limit(4);
    //


    // Get a random element from an array
    //String[] words = { "apple", "bear", "cat", "dog" };
    //int index = int(random(words.length));  // Same as int(random(4))
    //println(words[index]);  // Prints one of the four words
    //int[] x = {int(random(10, width))};
    //int[] y = {int(random(10, height))};
    //if(app<40) {
    ////for(int i = 0; i < x.length; i=int(random(0, 2))
    //int i = int(random(x.length));
    //int j = int(random(y.length));



    //  randLocs = new PVector(x[i], y[j]);

    //}
  }

  void display() {
    if (history.size() > 0) {
      //stroke(255);
      noFill();



      app = map(audioIn, 60, 75, 0, 255);

      for (int i = 0; i < history.size(); i++) {

        PVector pos = history.get(i);

        float rlwing_y = pos.y - 15;
        float rwing_x = pos.x - 45;

        float rlwing_3 = pos.y + wingSpan.y;
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

    if (audioIn < 62) {

      app = 0;
    }
  }

  void checkEdges() {
    if (wingSpan.y > 1.00 || wingSpan.y < -15.00) {
      wingaccel.mult( -1);
    }
  }
}
