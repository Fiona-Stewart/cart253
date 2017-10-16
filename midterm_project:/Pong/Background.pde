class Square {
// I know that they are circles not squares, at first they were but i changed it and didnt know how to change the name of the tab  
  
  float xpos;
  float ypos;
  
  Square() {
    xpos = width/5;
    ypos = height/2;
  }
  
  void draw() {
  noStroke();
  //ADDED found an interesting code in the processing examples tab that gave an interesting gradient 
    for (int i = 0; i < xpos; i++) {
    colorMode(RGB, (i+1) * xpos * 10);
    fill(millis()%((i+1) * xpos * 10));
   rectMode(CENTER);
   rect(i*xpos, ypos, 840, 480);
 }
}

}