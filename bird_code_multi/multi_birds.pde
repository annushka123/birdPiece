class MultiBirds {

  
  float speedX = 0.8;
  float rightY = -4;

  PVector location;
  PVector pos;


  MultiBirds() {
    
    location = new PVector(width/2, height/2);
    
  }
  
void update() {
  
  rightY = rightY + speedX;
  
  
  
}

void display() {
  
  noFill();
  
for(location.x=55; location.x<width; location.x+=145) { 
  for(location.y=55; location.y<height; location.y+=145) {
    
    

   pos = new PVector(location.x, location.y);

        float rlwing_y = pos.y - 15;
        float rwing_x = pos.x - 45;
        float rlwing_3 = pos.y + rightY;
        float lwing_x = pos.x + 45;
        
        float mx = map(mouseX, 0, width, -30, 30);
        float my = map(mouseY, 0, height, -30, 30);

        stroke(location.x, location.y, 30, 150);
        bezier(pos.x+mx, pos.y+my, pos.x+mx, rlwing_y, rwing_x, rlwing_y, rwing_x, rlwing_3);
        bezier(pos.x+mx, pos.y+my, pos.x+mx, rlwing_y, lwing_x, rlwing_y, lwing_x, rlwing_3);
  }

}
  
}

  void checkEdges() {
    if (rightY > 1.00 || rightY < -15.00) {
      speedX = speedX * -1;
    }
  }






}
