class Enemy {
  // size, colour, location, and other calls  
  float x;
  float y;
  float vx;
  float vy;
  int size;
  int speed;
  color fillColor;
  color defaultColor;
  color hoverColor;

  boolean isDead;

  // the input of these locations and such above put into the bouncer
  Enemy(float tempX, float tempY, float tempVX, float tempVY, color tempDefaultColor, color tempHoverColor) {

    // re named the inital int variables
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    
    speed = int(random(1, 6 ));
    size = int(random(40, 90));
    isDead = false;

    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }
  // makes the ball move around the screen
  void update() {
    x += vx;
    y += vy;

    handleBounce();
    //handleMouse();
  }
  // a loop. makes it to so the ball wont go off the screen and instead bounce off and change directions
  void handleBounce() {
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
    }

    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
    }

    // maintains ball to stay the same

    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }
// void used from Pong
  void collide(Water water) {

    boolean insideLeft = (x + size/2 > water.x - water.WIDTH/2);
    boolean insideRight = (x - size/2 < water.x + water.WIDTH/2);
    boolean insideTop = (y + size/2 > water.y - water.HEIGHT/2);
    boolean insideBottom = (y - size/2 < water.y + water.HEIGHT/2);

    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = water.x + water.WIDTH/2 + size/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = water.x - water.WIDTH/2 - size/2;
      }
      //And make it bounce
      vx = -vx;
      speed = 0; // Stop it from moving by setting speed equal to zero
    y = -1000;
      //water.score = paddle.score + 1;
    }
  }

  void collide(Gun gun) {

    boolean insideLeft = (x + size/2 > gun.x - gun.WIDTH/2);
    boolean insideRight = (x - size/2 < gun.x + gun.WIDTH/2);
    boolean insideTop = (y + size/2 > gun.y - gun.HEIGHT/2);
    boolean insideBottom = (y - size/2 < gun.y + gun.HEIGHT/2);

    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = gun.x + gun.WIDTH/2 + size/2;
      } else if (vx > 0) {
        life.health -= 10;
        // Reset its position to align with the left side of the paddle
        x = gun.x - gun.WIDTH/2 - size/2;
      }
      // And make it bounce
      vx = -vx;
      //water.score = paddle.score + 1;
    }


    for (int i = 0; i < water.WIDTH; i++) {
      // float distance = dist(b.aim.x, b.aim.y, x, y);

      isDead = true; 
      this.isDead = true;
    }
  }


  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
  void caught() {
    speed = 0; // Stop it from moving by setting speed equal to zero
    y = -1000; // Set the location to somewhere way off-screen
  }
  boolean intersect(Water w) {
    float distance = dist(x, y, w.x, w.y);
    if (distance < size + w.radius) {
      return true;
    } else {
      return false;
    }
  }
}