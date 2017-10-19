class Ball {
  int SIZE = 25;
  float x;
  float y;
  //float speed;
  float w;
  float vx;
  float vy;

  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    vx = 0;
    vy = 0;
  }


  void gravity() {
    // Add gravity to speed
    vx = vx + gravity;
  }

  void move() {
    x = x + vx;
  }

  void reset () {
    x = width/2;
    y = height/2;
  }   

  boolean isOffScreen() {
    return (x - SIZE/2 < 0 || x + SIZE/2 > width);
  }      

  void collide(Paddle paddle) {
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2); 
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);
    boolean ballOff = ( x - SIZE/2 > paddle.HEIGHT);
    if (insideLeft && insideRight && insideTop && insideBottom) {

      x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      vx = -vx * 0.95;

      paddle.score = paddle.score + 1;
    }
    vx = -vx * 0.95;

    if (isOffScreen()) {
      y = (int) random(height);
      x = width/2;
      vx = -vx * 0.95;
      paddle.ballsKilled = paddle.ballsKilled + 1;
    }
  }
  void display() {
    // Display the circle
    for (int i = 0; i < x; i++) {
      fill(random(255), random(255), random(255));
      stroke(1);
      colorMode(HSB);
      ellipse(x, y, w, w);
    }
  }
}