
class Water {

  float x;
  float y;
  float xDelta;
  float yDelta;

  float SPEED = 3;
  float radius = 30;
  int HEIGHT = 15;
  int WIDTH = 15;

  float gunPointX;
  float gunPointY;

  float aimX;
  float aimY;

  ArrayList<Water> spray = new ArrayList<Water>();

  PVector aim = new PVector();
  PVector center;
  PVector turrent;
  boolean isDead;

  Water(float tempR, float x, float y) {

    radius = tempR;

    center = new PVector(gun.x, gun.y);
    turrent  =  new PVector(gun.gunPointX, gun.gunPointY);

    spray = new ArrayList<Water>();
    aim = new PVector (gun.x, gun.y);

    aim.x = x;
    aim.y = y;

    xDelta = 0;
    yDelta = 0;

    aimX = x;
    aimY = y - 200;

    xDelta = 0;
    yDelta = 0;

    spray = new ArrayList<Water>();
    aim = new PVector (gun.x, gun.y);
  }


  void run() {
    x += xDelta;
    y += yDelta;

    move();
    display();

    for (int i = 0; i < spray.size(); i++) {
      Water b = spray.get(i);
      b.run();
    }
  }

  void display() {

    noStroke();
    fill(#46D5FF);
    ellipse (aim.x, aim.y, HEIGHT, WIDTH);
  }


  void move() {
    PVector vel = PVector.sub(turrent, center);  // get direction of motion
    aim.add(new PVector(vel.x/8, vel.y/8));
  }
}

//______________________NEWCLASS___________________________

class ShowShoot {

  float radius = 30;
  float x;
  float y;
  float xDelta;
  float yDelta;

  float SPEED = 3;

  ArrayList<Water> spray = new ArrayList<Water>();
  PVector aim;

  ShowShoot(Gun gun) {

    xDelta = 0;
    yDelta = 0;

    spray = new ArrayList<Water>();
    aim = new PVector (gun.x, gun.y);
  }
  void addWater() { 
    spray.add(new Water(30, aim.x, aim.y));
  }
  boolean intersect(Enemy d) {
    float distance = dist(x, y, d.x, d.y);
    if (distance < radius + d.size) {
      return true;
    } else {
      return false;
    }
  }
  void run() {

    for (int i = 0; i < spray.size(); i++) {
      Water b = spray.get(i);
      b.run();
    }
  }
}