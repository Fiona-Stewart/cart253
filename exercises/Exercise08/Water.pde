
class Water {

  float x = 400;
  float y = 750;
  float xDelta;
  float yDelta;

  float SPEED = 4;
  float radius = 30;
  int HEIGHT = 80;
  int WIDTH = 80;

  float gunPointX;
  float gunPointY;

  boolean shooting = false; 
  float a=x, b=y, s=8;
  float VX_shoot, VY_shoot;

  float aimX;
  float aimY;

  char upKey;
  char downKey;
  char leftKey;
  char rightKey;


  PVector aim = new PVector();
  PVector center;
  PVector turrent;

  Water( float x, float y, char _upKey, char _downKey, char _leftKey, char _rightKey) {

    center = new PVector(gun.x, gun.y);
    turrent  =  new PVector(gun.gunPointX, gun.gunPointY);

    aim.x = x;
    aim.y = y;

    //x = tempX;
    //y = tempY;
    xDelta = 1;
    yDelta = 0;

    aimX = x;
    aimY = y - 200;

    upKey = _upKey;
    downKey = _downKey;
    leftKey = _leftKey;
    rightKey = _rightKey;
    
  } 

  void update() {
    x += xDelta;
    y += yDelta;

    x = constrain(x, 0 + WIDTH/2, width - WIDTH/2);
    y = constrain(y, 0 + HEIGHT/2, height - HEIGHT/2);
  }


  void run() {
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

  //  void initShoot() {
  //    //
  //  }//func
  //}

  class showShoot {

    char upKey;
    char downKey;
    char leftKey;
    char rightKey;

    ArrayList<Water> spray;
    PVector aim;

    showShoot (Gun GU) {
      spray = new ArrayList<Water>();
      aim = new PVector (GU.x, GU.y);
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
  }
}
//aimX = mouseX;
//aimY = mouseY;
//float angle = atan2(mouseY - y, mouseX - x);

//gunPointX = (radius * cos(angle)) + x;
//gunPointY = (radius * sin(angle)) + y;