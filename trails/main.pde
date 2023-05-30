Particle particle;

void setup() {
  
  size(400, 400);
  particle = new Particle(300, 300);
  
}

void draw() {
 
  background(255);
  particle.show();
  particle.update();
  particle.checkEdges();
  
  
}
