
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
  float aimX;
  float aimY;

  color[] colors = {#3AAACF, #6E84D6, #35C0CD, #5EC4CD, #4284D3, #6899D3};

  Gun (float tempX, float tempY) {
    x = tempX;
    y = tempY;

    xDelta = xDelta;
    yDelta = yDelta;

    aimX = x;
    aimY = y - 200;
  }


  void display() {

    // the commands that help to make the gun follow the cursor 
    aimX = mouseX;
    aimY = mouseY;

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
}