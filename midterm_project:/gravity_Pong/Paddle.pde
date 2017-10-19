class Paddle {

  int score = 0;
  int ballsKilled = 0;
  
  float SPEED = 5;
  float HEIGHT = 80;
  float WIDTH = 16; 

  float x;
  float y;
  float vx;
  float vy;

  Paddle (float tempX, float tempY) {

    x = tempX;
    y = tempY;
    vx = 0;
    vy = 0;
  }

  void update() {

    x += vx;
    y += vy;

    y = constrain(y, 0 + HEIGHT/2, height - HEIGHT/2);
  }

  void display() {

    stroke(30);
    fill(255);
    rectMode(CENTER);

    rect(x, y, WIDTH, HEIGHT);
  }

  void keyPressed() {
    // Check if the key is our up key
    if (keyCode == UP) {
      // If so we want a negative y velocity
      vy = -SPEED;
    } // Otherwise check if the key is our down key 
    else if (keyCode == DOWN) {
      // If so we want a positive y velocity
      vy = SPEED;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our up key and the paddle is moving up
    if (keyCode == UP && vy < 0) {
      // If so it should stop
      vy = 0;
    } // Otherwise check if the key is our down key and paddle is moving down 
    else if (keyCode == DOWN && vy > 0) {
      // If so it should stop
      vy = 0;
    }
  }
}