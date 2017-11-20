class Gun {
  float x;
  float y;
  float xDelta;
  float yDelta;
  float radius = 70;
  int SPEED = 5;

  // extended gun component
  float gunPointX;
  float gunPointY;

  //reffers to the mouse, aka the target you hover over that you wish to shoot at
  float targX;
  float targY;

  color[] colors = {#3AAACF, #6E84D6, #35C0CD, #5EC4CD, #4284D3, #6899D3};

  Gun (float tempX, float tempY) {
    x = tempX;
    y = tempY;

    xDelta = xDelta;
    yDelta = yDelta;

    targX = x;
    targY = y - 200;
  }


  void display() {

    // the commands that help to make the gun follow the cursor 
    targX = mouseX;
    targY = mouseY;

    //allows for the gun to rotate around the body
    float angle = atan2(mouseY - y, mouseX - x);

    gunPointX = (radius * cos(angle)) + x;
    gunPointY = (radius * sin(angle)) + y;



    //body/gun
    ellipseMode(CENTER);
    noStroke();
    fill(#569D5B);
    ellipse(x, y, 80, 80);
    noFill();
    stroke(#569D5B);
    strokeWeight(26);
    strokeCap(PROJECT);
    line(x, y, gunPointX, gunPointY);

    //outline
    fill(#E8DE17);
    noStroke();
    ellipse(x, y, 70, 70);
    noFill();
    stroke(#E8DE17);
    strokeWeight(20);
    strokeCap(PROJECT);
    line(x, y, gunPointX, gunPointY);

    // orange part
    stroke(#E37702);
    strokeWeight(10);
    strokeCap(ROUND);
    line(x, y, gunPointX, gunPointY);
  }
  
  void keyPressed() {
    // Check if the key is our up key
    if (keyCode == UP) {
      // If so we want a negative y velocity
      yDelta = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (keyCode == DOWN) {
      // If so we want a positive y velocity
      yDelta = SPEED;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (keyCode == UP && yDelta < 0) {
      // If so it should stop
      yDelta = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (keyCode == DOWN && yDelta > 0) {
      // If so it should stop
      yDelta = 0;
    }
  }
}