Particle particle;

void setup() {
  
  size(400, 400);
  particle = new Particle();
  
}

void draw() {
 
  background(255);
  particle.show();
  particle.update();
  
  
  
}
