class FlowingLines {

  float x;
  float y;
  float z;
  
  FlowingLines() {
    
    x = posx;
    y = posy;
    z = posz;

  }
  
  void display() {
    
    pushMatrix();
    translate(200, 200);
    fill(200);
    ellipse(posx, posy, posz*0.3, posx*0.3);
    
    println("x:", x);
    println("y:", y);
    println("z:", z);
    popMatrix();
    
    
  }







}
