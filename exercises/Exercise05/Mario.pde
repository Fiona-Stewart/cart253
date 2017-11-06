

class Mario {
  float tx = random(0, 100);
  float ty = random(0, 100);
  float x;
  float y;
  float n = random(0, 100);
  PImage img;
  float xoff = 0.01;
  float xincrement = 0.04; 
  float speed;

  Mario() {
  }
  void display() {

    x = width * noise(tx);
    y = height-70 * noise(ty);
    n = noise(xoff)*width;
    xoff += xincrement;
    imageMode(CENTER);
    image(loadImage("mario.gif"), n, y, 50, 70);
    ty += 0.100;
  }
}