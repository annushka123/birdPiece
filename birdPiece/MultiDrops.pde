class Drop {
float x,y; // Variables for location of raindrop
//float speed; // Speed of raindrop
color c;
float r; // Radius of raindrop
Drop() {
r = diameter; // All raindrops are the same size
x = circX+random(width); // Start with a random x location
y = circY+random(height); // Start a little above the window
//speed = random(1,5); // Pick a random speed
c = color(random(100, 200),random(100, 200),random(100, 200)); // Color
}
//Move the raindrop down
void move() {
//y += speed; // Increment by speed
}
// Check if it hits the bottom
boolean reachedBottom() {
// If we go a little past the bottom
if (y > height + r*4) {
return true;
} else {
return false;
}
}
// Display the raindrop
void display() {
// Display the drop
//fill(red+random(10), green, blue, random(100, 210));
noStroke();
ellipse(x,y,r,r);
}

void rainbow() {
 fill(c);
}
}
