
// class that initially "invents" the bouncer
class Bouncer {
// size, colour, location, and other calls  
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 // the input of these locations and such above put into the bouncer
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
  
   // re named the inital int variables
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 // makes the ball move around the screen
 void update() {
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 // a loop. makes it to so the ball wont go off the screen and instead bounce off and change directions
 void handleBounce() {
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
   }
   
   // maintains ball to stay the same
   
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 // when the mouse passes over the bouncer the colour gets brighter. an if statement
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}