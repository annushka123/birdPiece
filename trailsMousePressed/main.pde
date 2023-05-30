ArrayList<Particle>particles;

void setup() {
  
  size(400, 400);
  
  particles = new ArrayList<Particle>();
  
}

void mousePressed() {
  Particle p = new Particle(mouseX, mouseY);
  particles.add(p);
}

void draw() {
 
  background(255);
  
  for (Particle p: particles) {
  p.show();
  p.update();
  
  }
  
}
