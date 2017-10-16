// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Square square;
// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(0);

Ball[] balls = new Ball[1];

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(840, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Create the ball at the centre of the screen
  for (int i = 0; i < balls.length; i++) {
  balls[0] = new Ball (width/2, height/2);
  } 
    square = new Square();
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  square.draw();
  
  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
 


 
  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  
  
 for (int i = 0; i < balls.length; i++) {
    balls[i].update();
    balls[i].collide(leftPaddle);
    balls[i].collide(rightPaddle);
    balls[i].display();
     // Check if the ball has gone off the screen
  if (balls[i].isOffScreen()) {
    // If it has, reset the ball
    balls[i].reset();
}
}
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}

void mousePressed() {
  // A new ball object
  Ball b = new Ball(mouseX, mouseY);
     // Append to array
     balls = (Ball[]) append(balls, b);
   }