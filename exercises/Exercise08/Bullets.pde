
class Bullet {


  float x;
  float y;

  float VX;
  float VY;

  int SIZE = 20;
  int SPEED = 5;

  Bullet ( float tempX, float tempY ) {

    x = tempX;
    y = tempY;

    //VX = tempVX;
    //VY = tempVY;
  } 

  void update() {

    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {

      VY = -VY;
    }
  }

  void display() {

    for (int i = 0; i < x; i++) {
      noStroke();
      fill(#D83434);
      rectMode(CENTER);

      // Draw the ball
      ellipse(x, y, SIZE, SIZE);
      // }
    }
  }
}