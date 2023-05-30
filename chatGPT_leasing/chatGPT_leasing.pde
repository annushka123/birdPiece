PVector birdPos; // position of the bird
PVector targetPos; // target position of the bird
float easing = 0.05; // easing amount

void setup() {
  size(500, 500);
  birdPos = new PVector(width/2, height/2);
}

void draw() {
  background(255);

  // map mouseX and mouseY to the bird's target position
  targetPos = new PVector(mouseX, mouseY);

  // calculate the distance between the bird's current position and its target position
  PVector distance = PVector.sub(targetPos, birdPos);

  // apply easing to the bird's position
  distance.mult(easing);
  birdPos.add(distance);

  // draw the bird at its current position
  fill(255, 0, 0);
  ellipse(birdPos.x, birdPos.y, 50, 50);
}
