
class Bullet {

  Gun gun = whole;
  
  PVector temp = new PVector();

  PVector center;
  PVector water;

  float angle = 0.0;

  float VX;
  float VY;

  int SIZE = 20;
  int SPEED = 5;

  float radius = 70;

  boolean isDead;
  
  int age = 0;

  Bullet ( float x, float y, int tempS) {

    temp.x = x;
    temp.y = y;
    SIZE = tempS;
    center = new PVector(gun.x, gun.y);
    water = new PVector(gun.gunPointX, gun.gunPointY);
  } 


  //void update() {
  //  angle = atan2(mouseY - y, mouseX - x);
  //}
  void run(){
    update();
    display();
  }
  

  void display() {

    pushMatrix();

    noStroke();
    fill(#46D5FF);
    rotate(angle);
    // Draw the ball
    line(temp.x, temp.y, 10, 10);

    popMatrix();
  }

  void update() {
    PVector vel = PVector.sub(water, center);  // get direction of motion
    temp.add(new PVector(vel.x/8, vel.y/8));
    age++;
  }

  // Check if the bullet is still useful
  boolean isDead() {
    return age > 120;
  }
}

class BulletManager{
  
  ArrayList<Bullet> bullets;
  PVector temp;
  
  BulletManager(Gun shoot){
    bullets = new ArrayList<Bullet>();
    temp = new PVector(shoot.x, shoot.y);
  }
  
  void addBullet(){ 
    //bullets.add(new Bullet(temp.x, temp.y));
  }
  
  void run(){
    for (int i = 0; i < bullets.size(); i++){
      Bullet b = bullets.get(i);
      b.run();
      
      if (b.isDead()){
        bullets.remove(i);
      }
    }
  }
}