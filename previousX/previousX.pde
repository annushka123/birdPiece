float x, y; // current position of the object
float prevX, prevY; // previous position of the object

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
  prevX = x;
  prevY = y;
}

void draw() {
  background(255);
  
  // update the position of the object
  x = mouseX;
  y = mouseY;
  
  // draw the object at the current position
  //fill(0);
  //ellipse(x, y, 10, 10);
  
  // store the current position as the previous position

  
  // draw a line from the previous position to the current position
  strokeWeight(4);
  stroke( 0);
  line(prevX-2, prevY-2, x, y);
  
    prevX = x;
  prevY = y;
  
  println("prevX", prevX, "prevY", prevY);
  println("x", x, "y", y);
}
