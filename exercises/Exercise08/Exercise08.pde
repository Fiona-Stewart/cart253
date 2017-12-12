/*
   Watergun Bust Down
 By Fiona Stewart
 */


Gun gun;
Water water;
ShowShoot showShoot;

void setup() {
  size (1200, 800);
  smooth();
  frameRate(60);

  // gun spawns at a random location within these perameters 

  gun = new Gun(width/2, height/2, 'W', 'S', 'A', 'D');

  showShoot = new ShowShoot(gun);

  //whole = new Gun(random(600, width-200), random(400, height-200),'W', 'S', 'A', 'D');

  water = new Water(width/2, height/2, 'W', 'S', 'A', 'D');
}

void draw() {
  background(255);

  gun.display();
  gun.update();

  showShoot.run();
  //water.update();
  water.display();
  //water.initShoot();
  //water.showShoot();
}

void mouseReleased() {

  //gun.keyPressed();
  //water.keyPressed();
}

void keyPressed() {
  gun.keyPressed();
  water.keyPressed();

  if (key == ' ') {
    gun.shoot();
  }
}
void keyReleased() {
  gun.keyReleased();
  water.keyReleased();
}

/*
   Credits to the creators I used as reference for creating my code
 
 Bubble Pop By Tino Zinyama
 https://github.com/tzinyama/BubblePop/blob/master/README.md
 
 */