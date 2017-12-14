
//  //if (((x>width-radius) || (x<radius)) || ((y>height-radius) || (y<radius))) exit();
//  //^^^^^ do nOT DELETE USE FOR ENEMYS 


/*
   Watergun Bust Down
 By Fiona Stewart
 
 You, are a watergun. 
 
 Travel around the screen by using the W,S,A,D keys.
 To shoot water tap or hold spacebar.
 
 Avoid all the targets!
 they are tired of constantly being dowsed and drowned with water droplets and have now become hostile!!
 
 THEY WILL ATTACK.
 
 If one of them catches you, your health will go down, once it reaches zero its game over!
  
 
 */

Enemy[] enemy;
Gun gun;
Water water;
ShowShoot showShoot;
Life life;
Timer timer;
int totalEnemy = 0;

void setup() {
  size (1200, 800);
  smooth();
  frameRate(60);
  
  println (millis());
  timer = new Timer();
  timer.start();

  gun = new Gun(width/2, height/2, 'W', 'S', 'A', 'D');

  showShoot = new ShowShoot(gun);

  water = new Water(30, width/2, height/2);

  life = new Life();

  enemy = new Enemy[16];

  for (int i = 0; i < enemy.length; i++) {
    enemy[i] = new Enemy(random(width), random(height), random(1, 3), random(1, 5), color(#A01B17), color(#E8332C));
  }

}

void draw() {
  background(255);
  timer.draw();
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
  
  ;
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