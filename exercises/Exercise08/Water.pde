
class Water {

  float x;
  float y;
  float VX;
  float VY;

  //float radius = 200;

  float aimX;
  float aimY;

  Water( float tempX, float tempY) {

    x = tempX;
    y = tempY;

    aimX = x;
    aimY = y - 200;
  } 

  void update() {
  }


  void display() {

    aimX = mouseX;
    aimY = mouseY;

    translate(width/2, height/2);
    float angle = atan2(mouseY-height/2, mouseX-width/2);

    strokeWeight(15);
    stroke(#46D5FF);
    rotate(angle);
    line(90, 0, 300, 2);
  }
}