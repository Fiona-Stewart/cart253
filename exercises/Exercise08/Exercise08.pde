
//  //if (((x>width-radius) || (x<radius)) || ((y>height-radius) || (y<radius))) exit();
//  //^^^^^ do nOT DELETE USE FOR ENEMYS 


/*
   Watergun Bust Down
 By Fiona Stewart
 */
//Enemy enemy;
Enemy[] enemy = new Enemy[10];
Gun gun;
Water water;
ShowShoot showShoot;
Life life;

int totalEnemy = 0;

void setup() {
  size (1200, 800);
  smooth();
  frameRate(60);

  gun = new Gun(width/2, height/2, 'W', 'S', 'A', 'D');

  showShoot = new ShowShoot(gun);

  water = new Water(width/2, height/2);

  life = new Life();

  for (int i = 0; i < enemy.length; i++) {
    enemy[i] = new Enemy(random(width),random(height), 2, 2, color(#A01B17), color(#E8332C));
   }

}

void draw() {
  background(255);
  life.display();
  life.update();
  
  //enemy.display();
  //enemy.update();
  
  for (int i = 0; i < enemy.length; i++) {
    enemy[i].display();
    enemy[i].update();
    enemy[i].handleBounce();
    enemy[i].collide(gun);
    if (showShoot.intersect(enemy[i])) {
      enemy[i].caught();
    }
  }
  if (totalEnemy >= enemy.length) {
      totalEnemy = 0; // Start over
    }
  
  

  gun.display();
  gun.update();



  showShoot.run();
  //water.update();
  water.display();
  //water.initShoot();
  //water.showShoot();
}


void keyPressed() {
  
  gun.keyPressed();

  if (key == ' ') {
    gun.shoot();
  }
  //life.keyPressed();
}

/*
   Credits to the creators I used as reference for creating my code
 
 Bubble Pop By Tino Zinyama
 https://github.com/tzinyama/BubblePop/blob/master/README.md
 
 */