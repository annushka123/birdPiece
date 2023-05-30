float birdX, birdY; // position of the bird
float targetX, targetY; // target position of the bird
float easing = 0.05; // easing amount

void setup() {
  size(500, 500);
  birdX = width/2;
  birdY = height/2;
}

void draw() {
  background(255);
  
  // map posx and posy to the bird's target position
  targetX = mouseX;
  targetY = mouseY;
  
  // calculate the distance between the bird's current position and its target position
  float dx = targetX - birdX;
  float dy = targetY - birdY;
  
  // apply easing to the bird's position
  birdX += dx * easing;
  birdY += dy * easing;
  
  // draw the bird at its current position
  fill(255, 0, 0);
  ellipse(birdX, birdY, 50, 50);
}
