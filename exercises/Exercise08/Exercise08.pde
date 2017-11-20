
Gun gun;
Bullet bullet;
void setup() {
  size (1200, 800);
  smooth();
  frameRate(60);

  // gun spawns at a random location within these perameters 
  gun = new Gun(random(600, width-200), random(400, height-200));

  bullet = new Bullet(random(600, width-200), random(400, height-200));
}

void draw() {
  background(255);
  gun.display();


    //bullet.update();
    bullet.display();
  }
  