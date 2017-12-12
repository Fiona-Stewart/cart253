

//class Water {

//  Gun gun = player;
//  float x;
//  float y;
//  PVector loc = new PVector();
//  float angle;
//  int age = 0;

//  float xDelta;
//  float yDelta;
//  float SPEED = 4;
//  float radius = 30;
//  int HEIGHT = 80;
//  int WIDTH = 80;


//  PVector center;
//  PVector turrent;

//  boolean isDead;

//  char upKey;
//  char downKey;
//  char leftKey;
//  char rightKey;


//  Water(float x, float y, char _upKey, char _downKey, char _leftKey, char _rightKey) {
//    loc.x = x;
//    loc.y = y;
//    center = new PVector(gun.x, gun.y);
//    turrent  =  new PVector(gun.gunPointX, gun.gunPointY);

//    upKey = _upKey;
//    downKey = _downKey;
//    leftKey = _leftKey;
//    rightKey = _rightKey;

//    xDelta = 1;
//    yDelta = 0;
//  }

//  void update() {
//    move();
//    display();

//    x += xDelta;
//    y += yDelta;

//    x = constrain(x, 0 + WIDTH/2, width - WIDTH/2);
//    y = constrain(y, 0 + HEIGHT/2, height - HEIGHT/2);
//  }

//  private void display() {
//    noStroke();
//    fill(#FF8D40);
//    ellipse(loc.x, loc.y, 10, 10);
//  }

//  private void move() {
//    PVector vel = PVector.sub(turrent, center);  // get direction of motion
//    loc.add(new PVector(vel.x/8, vel.y/8));
//    age++;
//  }

//  // Check if the bullet is still useful
//  boolean isDead() {
//    return age > 120;
//  }

//  void keyPressed() {

//    if (keyCode == upKey) {
//      //yDelta = -SPEED;
//      yDelta = -1;
//      xDelta = 0;
//    } else if (keyCode == downKey) {
//      //yDelta = SPEED;
//      yDelta = 1;
//      xDelta = 0;
//    }
//    if (keyCode == leftKey) {
//      //xDelta = -SPEED;
//      xDelta = -1;
//      yDelta = 0;
//    } else if ( keyCode == rightKey) {
//      //xDelta = SPEED;
//      xDelta = 1;
//      yDelta = 0;
//    }
//  }


//  //*************************************************************

//  class WaterManager {

//    char upKey;
//    char downKey;
//    char leftKey;
//    char rightKey;

//    ArrayList<Water> waters;
//    PVector loc;


//    WaterManager(Gun can) {
//      waters = new ArrayList<Water>();
//      loc = new PVector(can.x, can.y);
//    }

//    void addWater() { 
//      waters.add(new Water(loc.x, loc.y, upKey, downKey, leftKey, rightKey));
//    }

//    void run() {
//      for (int i = 0; i < waters.size(); i++) {
//        Water b = waters.get(i);
//        b.update();

//        if (b.isDead()) {
//          waters.remove(i);
//        }
//      }
//    }