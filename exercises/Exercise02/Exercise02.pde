// The program shows a moving rect with another elongated moving rect at the bottom
// of the screen that is controlled with arrow keys moving on a horizontal axis
// the square rect bounces around the screen and reflects off the elongated rect
// when it makes contact. the background of the program appears to be a static moving/colour
// changing background

// determines core background colour
color backgroundColor = color(0);

int numStatic = 100; //CHANGED amount of static
int staticSizeMin = 1; //CHANGED SIZE
int staticSizeMax = 6;
color staticColor = color(200);

//cordinates/information for the elongated rect (AKA paddle)
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 160;
int paddleHeight = 20;
color paddleColor = color(255);

//cordinates/information for the bouncing rect (AKA the ball)

int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 4; //CHANGED decreased speed
int ballSize = 80;
color ballColor = color(255);

int score = 0;


// begining information to solidify the official setup of paddle and ball
void setup() {
  size(840, 680); //CHANGED size of the program
  

  setupPaddle();
  setupBall();
 
}
// begining velocity and X + Y cordinates for paddle
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}
// begining velocity and X + Y cordinates for ball
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

// The visual creation of objects. Updates object integers
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
  
  displayScore();
}

// creation of animated background. Rectangles are positioned 
// at random and flash on and off the screen.
void drawStatic() {
  // below is a conditional
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}
// stops the paddle from exiting the window
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}
// updates the ball depending on what it hits
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

//creation of paddle
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}
// creation of ball
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize); //CHANGED the ball shape from rect to ellipse
}

// setting up for what the program will do when the ball makes contact with the paddle.
// ballOverLapsPaddle is to keep the distance from the paddle and ball when aligned more
// distant so it appears to reflect the ball.
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2; 
    ballVY = -ballVY;
  }
}



// a loop, also a conditional which asks a program a logical question.
// This loop checks to see if the ball hits the paddle at any given point on
// the X and Y axis. If it does not the ball is re-set to its starting point.
boolean ballOverlapsPaddle() {
  // (int i - 16/2 > mouseX - (i)128/2 && i + 16/2 < mouseX + (i)128/2)
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY +ballSize/2 > paddleY - paddleHeight/2){
      
      ballSize -= 5; //CHANGED ball shrinks every time it hits the paddle
      ballSize = constrain(ballSize, 5, 95); // keeps the size of ball within a determined range
      
      return true;
    }
  }
  return false;
}
// The draw function that re-sets the ball if the loop returns false.
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = (int) random(width); //CHANGED ball will spawn randomly across the horizontal
                                 // axis either in a left direction or right.
    ballY = height/2;
    ballSize = 80; //CHANGED re-sets the ball size and speed when ball is off bottom. stoping the loop
    ballVY = 4;
    score --;
  }
}
// a loop test condition. asks for a "true or false". the while block will go on
// again and again until the test becomes false.

boolean ballOffBottom() {
  // determines that when ballY is greater then the height, stop the loop
  return (ballY - ballSize/2 > height);
}
// keeps the ball within the visible window of the game. when the ball reaches
// a point near the left,right. or top of the game screen, it reflects off.
void handleBallHitWall() {
  //Left side
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
  // the "bounce" or reflect off effect.
    ballVX = -ballVX;
    
  //Right side
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
  // the "bounce" or reflect off effect.
    ballVX = -ballVX;
  }
  // Top of screen
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY + 2; //CHANGED now when the ball hits the top of the screen, speed increases.
  score ++;
  }
}

void displayScore() {
  PFont font;
  font = loadFont("OCRAStd-48.vlw");
  textFont(font,30);
  text("SCORE" + score, width/15, height/10); 
  text( - score, width/1, height/10);
}

// set up for the keys that allow the paddle to move and be controlled
//starts the movement based on which arrow key is pressed.
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

// set up for the keys that allow the paddle to move and be controlled.
// this one specifically orders the paddle to srtop moving
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}