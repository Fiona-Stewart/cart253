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
  background(100);

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
    text("YOU HAVE KILLED", 439, 48);
    fill(255);
    text(paddle.ballsKilled, 650, height/10);
    fill(#D62413);
    text("BALL", 677, 48);
    fill(255);
    text(paddle.score, width/15, height/10);
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