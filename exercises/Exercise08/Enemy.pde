
class Enemy {


  //if (((x>width-radius) || (x<radius)) || ((y>height-radius) || (y<radius))) exit();
  //^^^^^ do nOT DELETE USE FOR ENEMYS 
  float x;
  float y;
  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;

  Enemy() {
    // x = tempX;
    // y = tempY;
    size = 25;
    loc = new PVector(random(size/2, width - size/2), -size /2);
    vel = 3;
    // spreads out the amount of enemies that appear 
    coolingTime = int(random(60));
    isDead = false;
  }
  void display(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    noFill();
    stroke(255, 0, 0);
    rect(loc.x, loc.y, size, size);
  }

  void update() {
    loc.y += vel;
    if (loc.y > height) {
      isDead = true;
    }
  }
}
//  coolingTime++;
//  if (coolingTime >= 60) {
//    spray.add(new Water(aim.x, aim.y, upKey, downKey, leftKey, rightKey));
//    coolingTime = 0;
//  }

//  for (
//}