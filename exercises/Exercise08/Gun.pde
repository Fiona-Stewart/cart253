
class Gun {

  float x;
  float y;
  // refers to the velocity
  float xDelta;
  float yDelta;

  float radius = 70;

  int HEIGHT = 80;
  int WIDTH = 80;
  int SPEED = 4;

  // extended gun component
  float gunPointX;
  float gunPointY;

  //reffers to the mouse, aka the target you hover over that you wish to shoot at
  float aimX;
  float aimY;

  // characters I am going to use to make the tank move up and down
  char upKey;
  char downKey;

  // plan to implement these so the tank can move all directions
  char leftKey;
  char rightKey;

  color[] colors = {#3AAACF, #6E84D6, #35C0CD, #5EC4CD, #4284D3, #6899D3};

  Gun (float tempX, float tempY, char _upKey, char _downKey, char _leftKey, char _rightKey) {
    x = tempX;
    y = tempY;
    xDelta = 0;
    yDelta = 0;

    aimX = x;
    aimY = y - 200;

    upKey = _upKey;
    downKey = _downKey;
    leftKey = _leftKey;
    rightKey = _rightKey;
  }

  void update() {
    x += xDelta;
    y += yDelta;


    // creates restraints so the tank stays on the screen
  
      x = constrain(x, 0 + WIDTH/2, width - WIDTH/2);
      y = constrain(y, 0 + HEIGHT/2, height - HEIGHT/2);
    
  }


  void display() {

    if (keyPressed==true)
    {
      x += SPEED*xDelta;
      y += SPEED*yDelta;
    }
    // the commands that helps to make the gun follow the cursor 
    aimX = mouseX;
    aimY = mouseY;

    /* 
     CREDIT: design of gun inspired by user: Tino Zinyama. Looked at his game
     to figure out how to make the gun barrel rotate
     */

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
  void shoot() {
  
    showShoot.addWater();

  }

  void keyPressed() {

    if (keyCode == upKey) {
      yDelta = -SPEED;
      //yDelta = -1;
      //xDelta = 0;
    } else if (keyCode == downKey) {
      yDelta = SPEED;
      //yDelta = 1;
      //xDelta = 0;
    }
    if (keyCode == leftKey) {
      xDelta = -SPEED;
      //xDelta = -1;
      //yDelta = 0;
    } else if ( keyCode == rightKey) {
      xDelta = SPEED;
      //xDelta = 1;
      //yDelta = 0;
    }
  }
  void keyReleased() {
    if (keyCode == leftKey && xDelta < 0) {
      xDelta = 0;
    } else if (keyCode == rightKey && xDelta > 0) {
      xDelta = 0;
    }
    if (keyCode == upKey && yDelta < 0) {
      yDelta = 0;
    } else if (keyCode == downKey && yDelta > 0) {
      yDelta = 0;
    }
  }
}