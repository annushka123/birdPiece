Particle particle;
PVector wind;


void setup() {
  
  size(400, 400);
  particle = new Particle(300, 300);
  wind = new PVector(2,0);
  
}

void draw() {
 
  background(255);
  particle.applyForce(wind);
  particle.show();
  particle.update();
  particle.checkEdges();
  
  
  
}
