Ball ball;
Paddle paddle;


Ball[] balls = new Ball[1];

float gravity = 0.1;

PFont f;

void setup() {
  size(840, 480);

  paddle = new Paddle(width - 25, height/2);
  //Initialize ball index 0
  balls[0] = new Ball(50, 200, 16);

  printArray(PFont.list());
  f = createFont("SukhumvitSet-SemiBold-48.vlw", 24);
  textFont(f);
}
void draw() {
  background(120);

  paddle.update();
  paddle.display();

  // Update and display all balls
  for (int i = 0; i < balls.length; i++) {
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
    balls[i].collide(paddle);
  }
  //void drawType(float x) {
  fill(#D62413);
  textSize(24);
  text("YOU HAVE KILLED", 437, 48);
  fill(255);
  textSize(24);
  text(paddle.ballsKilled, 650, height/10);
  fill(255);
  textSize(24);
  text(paddle.score, width/15, height/10);
  fill(#E9ED1D);
  textSize(15);
  text("click to add Ball", 100, 455);
}


void mousePressed() {
  // A new ball object
  Ball b = new Ball(mouseX, mouseY, 16);
  // Append to array
  balls = (Ball[]) append(balls, b);
}

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  paddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  paddle.keyReleased();
}