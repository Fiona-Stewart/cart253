
Gun gun;

void setup() {
  size (1200, 800);
  smooth();
  frameRate(60);

// gun spawns at a random location within these perameters 
  gun = new Gun(random(600, width-100), random(400, height-100));

 
}

void draw() {
  background(255);
  gun.display();

}