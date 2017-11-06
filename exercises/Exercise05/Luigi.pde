class Luigi {
  float tx = random(0, 100);
  float ty = random(0, 100);
  float x;
  float y;
  float n = random(0, 100);
  PImage img;
  float xoff = 0.06;
  float xincrement = 0.07; 
  float speed;

  Luigi() {
  }
  void display() {

    x = width * noise(tx);
    y = height-90 * noise(ty);
    n = noise(xoff)*width;
    xoff += xincrement;
    imageMode(CENTER);
    image(loadImage("luigi.png"), n, y, 120, 100);
    ty += 0.10;
    n += 0.300;
  }
}