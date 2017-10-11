class Square {
  color c;
  float xpos;
  float ypos;
  
  Square() {
    xpos = width/2;
    ypos = height/2;
    c = color (255);
  }
  
  void draw() {
  noStroke();
   fill(c);
   rectMode(CENTER);
   rect(xpos, ypos, 320, 240);
 }
}