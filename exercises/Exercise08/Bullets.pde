
class Bullet {

  PVector center;
  PVector turrent;

  float angle = 0.0;
  float x;
  float y;

  float VX;
  float VY;

  int SIZE = 20;
  int SPEED = 5;

  Bullet ( float tempX, float tempY, int tempS) {

    x = tempX;
    y = tempY;
    SIZE = tempS;
    center = new PVector(gun.x, gun.y);
  } 

  void update() {
    angle = atan2(mouseY - y, mouseX - x);
  }

  void display() {

    pushMatrix();
    translate(x, y);
    noStroke();
    fill(#D83434);
    rotate(angle);
    // Draw the ball
    ellipse(SIZE/4, 0, SIZE/2, SIZE/2);

    popMatrix();
  }
}