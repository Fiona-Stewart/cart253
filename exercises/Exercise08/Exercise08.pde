/*
   Watergun Bust Down
 By Fiona Stewart
 */


Gun gun;
Water water;
 //WaterManager waterManager;

void setup() {
  size (1200, 800);
  smooth();
  frameRate(60);

  // gun spawns at a random location within these perameters 

  gun = new Gun(width/2, height/2, 'W', 'S', 'A', 'D');
  
  //waterManager = new WaterManager();

  //whole = new Gun(random(600, width-200), random(400, height-200),'W', 'S', 'A', 'D');

  water = new Water(width/2, height/2, 'W', 'S', 'A', 'D');
}

void draw() {
  background(255);
  //waterManager.run();
  gun.display();
  gun.update();

  water.update();
  water.display();
  //water.initShoot();
  //water.showShoot();
}

void mouseReleased(){
  //player.shoot();
  //gun.keyPressed();
  //water.keyPressed();
}

void keyPressed() {
  gun.keyPressed();
  water.keyPressed();
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