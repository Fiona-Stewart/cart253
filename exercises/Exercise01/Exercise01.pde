// Commented excercise code

//final int CIRCLE_SPEED = 7;
//final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
//final color CLICK_FILL_COLOR = color(100, 100, 250);
//final color BACKGROUND_COLOR = color(250, 150, 150);
//final color STROKE_COLOR = color(250, 150, 150);
//final int CIRCLE_SIZE = 50;
//
//int circleX;
//int circleY;
//int circleVX;
//int circleVY;
//
//void setup() {
//  size(640, 480);
//  circleX = width/2;
//  circleY = height/2;
//  circleVX = CIRCLE_SPEED;
//  circleVY = CIRCLE_SPEED;
// stroke(STROKE_COLOR);
//  fill(NO_CLICK_FILL_COLOR);
//  background(BACKGROUND_COLOR);
//}

//void draw() {
//    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
//    fill(CLICK_FILL_COLOR);
//  }
//  else {
//    fill(NO_CLICK_FILL_COLOR);
//  }
//  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
//  circleX += circleVX;
//  circleY += circleVY;
//  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
//    circleVX = -circleVX;
//  }
//  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
//    circleVY = -circleVY;
//  }
//}

//void mousePressed() {
//  background(BACKGROUND_COLOR);
//}

// Commented excercise code
// determines the speed the circle travels
final int CIRCLE_SPEED = 3; //changed speed from 7 to 3
// initial starting colour
final color NO_CLICK_FILL_COLOR = color(255, 177, 98); // changed color to an orange tone
// determines the colour of the circle when the mouse waves over it
final color CLICK_FILL_COLOR = color(100, 100, 250);
final color BACKGROUND_COLOR = color(178, 255, 250); // changed background to a blue but didnt use it
final color STROKE_COLOR = color(250, 150, 150); // did not use stroke color but kept it as it did
                                                 // not effect anything.
final int CIRCLE_SIZE = 50;

 int circleWidth = 50; // CHANGED added moving element to interact with bouncing ellipses
 int last = -3; // CHANGED only applies if changing color brightness. Colours are darker when passed through top of
                // the screen compared to the bottom. Only applies to ellipses following cursor

int circleX;
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(840, 680);
  circleX = width/5; // increased width and hight by 3
  circleY = height/5;
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  stroke(STROKE_COLOR);
  noStroke();
  colorMode(HSB, height, height, height);
  fill(NO_CLICK_FILL_COLOR);
  background(0);
}


void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
 
  int whichCircle = mouseX / circleWidth;  // ADDED an interactive component to the program. colour changing dots follow the
                                           // mouse leaving a trail of dots much like the original bouncing ellipses. leaves
                                           // a gradient effect as you move along Y axis
  if (whichCircle !=last) {
    int ellipseX = whichCircle * circleWidth;
    fill(ellipseX, 100, mouseY);
    ellipse(mouseX,mouseY,50,50);
    noStroke();
    last = whichCircle;
  }
}

void mousePressed() {
  background(0);
  
}
  