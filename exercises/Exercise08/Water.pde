
class Water {

  float x;
  float y;
  float xDelta;
  float yDelta;

  float SPEED = 3;
  float radius = 30;
  int HEIGHT = 80;
  int WIDTH = 80;

  float gunPointX;
  float gunPointY;


  float aimX;
  float aimY;

  char upKey;
  char downKey;
  char leftKey;
  char rightKey;

  ArrayList<Water> spray = new ArrayList<Water>();

  PVector aim = new PVector();
  PVector center;
  PVector turrent;

  Water( float x, float y, char _upKey, char _downKey, char _leftKey, char _rightKey) {

    center = new PVector(gun.x, gun.y);
    turrent  =  new PVector(gun.gunPointX, gun.gunPointY);

    aim.x = x;
    aim.y = y;

    xDelta = 0;
    yDelta = 0;

    aimX = x;
    aimY = y - 200;

    upKey = _upKey;
    downKey = _downKey;
    leftKey = _leftKey;
    rightKey = _rightKey;
  } 

  void run() {
    x += xDelta;
    y += yDelta;

    move();
    display();
  }

  void display() {

    noStroke();
    fill(#46D5FF);
    ellipse (aim.x, aim.y, 15, 15);

    //aimX = mouseX;
    //aimY = mouseY;

    //if (keyPressed==true)
    //{
    //  x=x+(SPEED*xDelta);
    //  y=y+(SPEED*yDelta);
    //}

    //translate(width/2, height/2);
    //float angle = atan2(mouseY-height/2, mouseX-width/2);

    //float angle = atan2(mouseY - y, mouseX - x);

    //gunPointX = (radius * cos(angle)) + x;
    //gunPointY = (radius * sin(angle)) + y;


    //strokeWeight(15);
    //noStroke();
    //fill(#46D5FF);
    //ellipseMode(CENTER);
    ////ellipse(x,y,radius,radius);
    //line(x, y, gunPointX, gunPointY);

    //initShoot();
    //showShoot();
  }

  void move() {
    PVector vel = PVector.sub(turrent, center);  // get direction of motion
    aim.add(new PVector(vel.x/8, vel.y/8));
  }

  void keyPressed() {

    if (keyCode == upKey) {
      yDelta = -SPEED;
      //yDelta = -1;
      //xDelta =0;
    } else if (keyCode == downKey) {
      yDelta = SPEED;
      //yDelta = 1;
      //xDelta =0;
    }
    if (keyCode == leftKey) {
      xDelta = -SPEED;
      //xDelta = -1;
      //yDelta =0;
    } else if ( keyCode == rightKey) {
      xDelta = SPEED;
      //xDelta = 1;
      //yDelta = 0;
      //} else if (key == ' ') {
      //  a=x; 
      //  b=y; 
      //  VX_shoot=xDelta;
      //  VY_shoot=yDelta; 
      //  s=4; // speed 
      //  shooting = true;
      //}
    }
  }
  void keyReleased() {
    if (keyCode == leftKey && xDelta < 0) {
      xDelta = 0;
    } else if (keyCode == rightKey && xDelta > 0) {
      xDelta = 0;
    }
    if (keyCode == upKey && yDelta < 0) {
      yDelta = 0;
    } else if (keyCode == downKey && yDelta > 0) {
      yDelta = 0;
    }
  }
}

class ShowShoot {
  
  float xDelta;
  float yDelta;

  float SPEED = 3;
  
  char upKey;
  char downKey;
  char leftKey;
  char rightKey;

  ArrayList<Water> spray = new ArrayList<Water>();
  PVector aim;

  ShowShoot(Gun gun) {

    xDelta = 0;
    yDelta = 0;

    spray = new ArrayList<Water>();
    aim = new PVector (gun.x, gun.y);
  }
  void addWater() { 
    spray.add(new Water(aim.x, aim.y, upKey, downKey, leftKey, rightKey));
  }
  void run() {

    for (int i = 0; i < spray.size(); i++) {
      Water b = spray.get(i);
      b.run();
    }
  }
  void keyPressed() {

    if (keyCode == upKey) {
      yDelta = -SPEED;
      //yDelta = -1;
      //xDelta =0;
    } else if (keyCode == downKey) {
      yDelta = SPEED;
      //yDelta = 1;
      //xDelta =0;
    }
    if (keyCode == leftKey) {
      xDelta = -SPEED;
      //xDelta = -1;
      //yDelta =0;
    } else if ( keyCode == rightKey) {
      xDelta = SPEED;
    }
  }
}
//  void initShoot() {
//    //
//  }//func
//}



//aimX = mouseX;
//aimY = mouseY;
//float angle = atan2(mouseY - y, mouseX - x);

//gunPointX = (radius * cos(angle)) + x;
//gunPointY = (radius * sin(angle)) + y;